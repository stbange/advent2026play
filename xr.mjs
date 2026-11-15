// SPDX-License-Identifier: MIT
import {virtualScreen} from './screen.mjs';
export function angles(q) {
  const x=-2*(q.x*q.z+q.w*q.y),y=-2*(q.y*q.z-q.w*q.x),z=-(1-2*(q.x*q.x+q.y*q.y));
  return [Math.atan2(x,-z),Math.asin(Math.max(-1,Math.min(1,y)))];
}
export class XRBridge {
  constructor({module,canvas,navigator,Layer,status,fetch}) {
    Object.assign(this,{module,canvas,navigator,Layer,status,fetch});this.turn=0;this.height=1.5;this.lost=false;
    canvas.addEventListener('webglcontextlost',event=>{event.preventDefault();this.lost=true;this.status('Graphics context lost. Waiting for restoration…');});
    canvas.addEventListener('webglcontextrestored',()=>this.restore().catch(error=>{this.status(error.message);if(this.session)this.session.end();}));
  }
  async supported() {try{return !!(this.navigator?.xr && this.Layer && await this.navigator.xr.isSessionSupported('immersive-vr'));}catch{return false;}}
  async enter(options={}) {
    if(this.session){await this.session.end();return;}
    if(this.starting)return;
    this.starting=true;
    try {
      if(!await this.supported())throw new Error('Immersive WebXR is unavailable. Use a supported headset browser over HTTPS.');
      const session=await this.navigator.xr.requestSession('immersive-vr',{optionalFeatures:['local-floor']});
      this.session=session;this.options=options;this.turn=0;this.latched=false;this.calibrated=false;
      session.addEventListener('end',()=>this.finish());
      const gl=this.module.adventGL;await gl.makeXRCompatible();
      try {this.space=await session.requestReferenceSpace('local-floor');}catch{this.space=await session.requestReferenceSpace('local');}
      this.layer=new this.Layer(session,gl);session.updateRenderState({baseLayer:this.layer});
      this.pointer=this.module._malloc(32*4);if(!this.pointer)throw new Error('XR matrix allocation failed.');
      if(options.screen)this.screen=await virtualScreen(gl,this.fetch);
      if(!this.module._advent_xr_active(1))throw new Error('XR requires one local player.');
      this.active=true;
      this.status(options.screen?'XR stationary virtual screen. Recalibrate to centre the screen height.':'Immersive XR. Snap turn is enabled by default; recalibrate for seated play.');
      session.requestAnimationFrame((time,frame)=>this.frame(time,frame));
    } catch(error) {if(this.session)await this.session.end();this.finish();throw error;}
    finally {this.starting=false;}
  }
  calibrate(){this.calibrated=false;}
  finish() {
    if(this.pointer){this.module._free(this.pointer);this.pointer=0;}
    if(this.screen){this.screen.dispose();this.screen=null;}
    if(this.active){this.active=false;this.module._advent_xr_active(0);}
    this.session=null;this.previous=0;this.module._advent_touch_button(1,0);
    this.status('Returned to flat-screen play.');
  }
  async restore() {
    if(!this.module._advent_rebuild())throw new Error('Could not rebuild graphics resources. Reload to recover the saved run.');
    if(this.session){
      const gl=this.module.adventGL;await gl.makeXRCompatible();
      this.layer=new this.Layer(this.session,gl);this.session.updateRenderState({baseLayer:this.layer});
      if(this.screen){this.screen.dispose();this.screen=await virtualScreen(gl,this.fetch);}
    }
    this.lost=false;
  }
  frame(time,frame) {
    const session=this.session;if(!session)return;
    session.requestAnimationFrame((next,f)=>this.frame(next,f));
    if(this.lost)return;
    const pose=frame.getViewerPose(this.space);if(!pose)return;
    const dt=this.previous?Math.min(.05,Math.max(0,(time-this.previous)/1000)):0;this.previous=time;
    if(!this.calibrated){this.height=pose.transform.position.y;this.heightOffset=this.options.seated?1.5-this.height:0;this.calibrated=true;}
    let [yaw,pitch]=angles(pose.transform.orientation),forward=0,strafe=0,vertical=0,buttons=0,turn=0;
    for(const source of session.inputSources){
      const pad=source.gamepad;if(!pad)continue;
      const axes=pad.axes.length>=4?pad.axes.slice(2,4):pad.axes;
      if(source.handedness==='left'){strafe=axes[0]||0;forward=-(axes[1]||0);}
      else {
        turn=axes[0]||0;
        const ray=frame.getPose(source.targetRaySpace,this.space);if(ray)[yaw,pitch]=angles(ray.transform.orientation);
      }
      const pressed=i=>!!pad.buttons[i]?.pressed;
      if(pressed(0))buttons|=source.handedness==='left'?2:1;
      if(pressed(3)){const node=this.module._advent_xr_target(yaw+this.turn,pitch);if(node)this.module._advent_xr_teleport(node);}
      if(pressed(1))buttons|=source.handedness==='left'?16:8;
      if(pressed(4))buttons|=source.handedness==='left'?32:4;
      if(pressed(5)) {if(source.handedness==='left')buttons|=64;else vertical=1;}
    }
    if(Math.abs(turn)<.3)this.latched=false;
    if(this.options.snap!==false){if(Math.abs(turn)>.7 && !this.latched){this.turn+=Math.sign(turn)*Math.PI/6;this.latched=true;}}
    else this.turn+=turn*dt*1.5;
    this.module._advent_xr_input(Math.abs(forward)>.15?forward:0,Math.abs(strafe)>.15?strafe:0,vertical,yaw+this.turn,pitch,buttons);
    this.module._advent_xr_step();
    const gl=this.module.adventGL;
    if(this.screen){gl.bindFramebuffer(gl.FRAMEBUFFER,this.screen.framebuffer);this.module._advent_xr_eye(0,0,960,600,0,0,0,0,1);}
    gl.bindFramebuffer(gl.FRAMEBUFFER,this.layer.framebuffer);
    for(const eye of pose.views){
      const v=this.layer.getViewport(eye);
      if(this.screen)this.screen.draw(eye,v,this.height);
      else {
        this.module.HEAPF32.set(eye.projectionMatrix,this.pointer/4);
        this.module.HEAPF32.set(eye.transform.inverse.matrix,this.pointer/4+16);
        this.module._advent_xr_eye(v.x,v.y,v.width,v.height,this.pointer,this.pointer+64,this.heightOffset,this.turn,0);
      }
    }
  }
}
