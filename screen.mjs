// SPDX-License-Identifier: MIT
export async function virtualScreen(gl, fetch) {
  const owned=[];
  const own=(kind,value)=>{if(!value)throw new Error('Virtual screen allocation failed.');owned.push([kind,value]);return value;};
  const dispose=()=>{for(const [kind,value] of owned)gl[`delete${kind}`](value);owned.length=0;};
  try {
    const program=own('Program',gl.createProgram());
    for(const [file,type] of [['screen.vert',gl.VERTEX_SHADER],['screen.frag',gl.FRAGMENT_SHADER]]) {
      const response=await fetch(file);if(!response.ok)throw new Error(`Could not load ${file}.`);
      const shader=own('Shader',gl.createShader(type));gl.shaderSource(shader,await response.text());gl.compileShader(shader);
      if(!gl.getShaderParameter(shader,gl.COMPILE_STATUS))throw new Error(gl.getShaderInfoLog(shader));
      gl.attachShader(program,shader);
    }
    gl.linkProgram(program);if(!gl.getProgramParameter(program,gl.LINK_STATUS))throw new Error(gl.getProgramInfoLog(program));
    const texture=own('Texture',gl.createTexture());gl.bindTexture(gl.TEXTURE_2D,texture);
    gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA,960,600,0,gl.RGBA,gl.UNSIGNED_BYTE,null);
    gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.LINEAR);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.LINEAR);
    const depth=own('Renderbuffer',gl.createRenderbuffer());gl.bindRenderbuffer(gl.RENDERBUFFER,depth);gl.renderbufferStorage(gl.RENDERBUFFER,gl.DEPTH_COMPONENT16,960,600);
    const framebuffer=own('Framebuffer',gl.createFramebuffer());gl.bindFramebuffer(gl.FRAMEBUFFER,framebuffer);
    gl.framebufferTexture2D(gl.FRAMEBUFFER,gl.COLOR_ATTACHMENT0,gl.TEXTURE_2D,texture,0);gl.framebufferRenderbuffer(gl.FRAMEBUFFER,gl.DEPTH_ATTACHMENT,gl.RENDERBUFFER,depth);
    if(gl.checkFramebufferStatus(gl.FRAMEBUFFER)!==gl.FRAMEBUFFER_COMPLETE)throw new Error('Virtual screen framebuffer is incomplete.');
    const vao=own('VertexArray',gl.createVertexArray());gl.bindVertexArray(vao);
    const buffer=own('Buffer',gl.createBuffer());gl.bindBuffer(gl.ARRAY_BUFFER,buffer);gl.bufferData(gl.ARRAY_BUFFER,new Float32Array([-1,-1,1,-1,-1,1,-1,1,1,-1,1,1]),gl.STATIC_DRAW);
    gl.enableVertexAttribArray(0);gl.vertexAttribPointer(0,2,gl.FLOAT,false,0,0);
    const projection=gl.getUniformLocation(program,'projection'),view=gl.getUniformLocation(program,'view'),height=gl.getUniformLocation(program,'eyeHeight');
    return {framebuffer,dispose,draw(eye,viewport,eyeHeight){
      gl.viewport(viewport.x,viewport.y,viewport.width,viewport.height);gl.scissor(viewport.x,viewport.y,viewport.width,viewport.height);gl.enable(gl.SCISSOR_TEST);
      gl.clearColor(.02,.025,.04,1);gl.clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT);gl.disable(gl.DEPTH_TEST);
      gl.useProgram(program);gl.bindVertexArray(vao);gl.activeTexture(gl.TEXTURE0);gl.bindTexture(gl.TEXTURE_2D,texture);
      gl.uniformMatrix4fv(projection,false,eye.projectionMatrix);gl.uniformMatrix4fv(view,false,eye.transform.inverse.matrix);gl.uniform1f(height,eyeHeight);
      gl.drawArrays(gl.TRIANGLES,0,6);
    }};
  } catch(error) {dispose();throw error;}
}
