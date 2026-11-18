precision highp float;
in vec3 shade;
in vec3 uv;
in vec3 worldPosition;
in float distanceFromEye;
uniform sampler2D atlas;
uniform sampler2D shadowAtlas;
uniform vec4 lightPosition[6];
uniform vec4 lightColor[6];
uniform vec3 eyePosition;
uniform int lightCount;
uniform int shadowPass;
uniform int lighting;
uniform int flashAmount;
out vec4 fragment;
float visibility(int index,vec3 delta,float range) {
    vec3 a=abs(delta);
    float face,major;
    vec2 plane;
    if(a.x>=a.y && a.x>=a.z) {
        major=a.x;
        face=delta.x>0.0?0.0:1.0;
        plane=vec2(delta.x>0.0?-delta.z:delta.z,-delta.y);
    } else if(a.y>=a.z) {
        major=a.y;
        face=delta.y>0.0?2.0:3.0;
        plane=vec2(delta.x,delta.y>0.0?delta.z:-delta.z);
    } else {
        major=a.z;
        face=delta.z>0.0?4.0:5.0;
        plane=vec2(delta.z>0.0?delta.x:-delta.x,-delta.y);
    }
    vec2 local=clamp((plane/max(major,0.001)*0.5+0.5)*128.0,vec2(1.0),vec2(127.0));
    float depth=range/(range-0.1)-range*0.1/((range-0.1)*max(major,0.1));
    float result=0.0;
    for(int y=0;y<2;y++)for(int x=0;x<2;x++) {
        vec2 at=(vec2(face*128.0,float(index)*128.0)+local+vec2(float(x),float(y))-0.5)/768.0;
        result+=depth-0.003<texture(shadowAtlas,at).r?0.25:0.0;
    }
    return result;
}
void main() {
    vec2 coordinates=uv.xy;
    vec3 normal=normalize(cross(dFdx(worldPosition),dFdy(worldPosition)));
    vec2 dimensions=vec2(textureSize(atlas,0));
    vec2 pixel=uv.xy*dimensions;
    bool painted=pixel.x>=512.0;
    bool mineral=painted && pixel.y<256.0;
    bool sky=painted && pixel.y>=928.0;
    if((uv.z>2.5 && !painted) || mineral) {
        vec3 axis=abs(normal);
        vec2 plane=axis.x>axis.y && axis.x>axis.z ? worldPosition.zy :
                   axis.y>axis.z ? worldPosition.xz : worldPosition.xy;
        float span=mineral ? 128.0 : 64.0;
        float repeatRate=mineral ? (pixel.y<128.0 && pixel.x<640.0 ? .19 : .31) : .65;
        coordinates=(floor(pixel/span)*span+1.0+fract(plane*repeatRate)*(span-2.0))/dimensions;
    }
    if(sky) {
        vec3 ray=normalize(worldPosition-eyePosition);
        float u=fract(atan(ray.z,ray.x)/6.2831853);
        float v=clamp(.86-ray.y*1.22,0.0,1.0);
        coordinates=(vec2(512.5,928.5)+vec2(u*511.0,v*95.0))/dimensions;
    }
    vec4 texel=texture(atlas,coordinates);
    float coverage=(mod(floor(gl_FragCoord.x)+floor(gl_FragCoord.y)*2.0,4.0)+0.5)/4.0;
    if(uv.z>0.5 && texel.a<coverage)discard;
    bool emissive=uv.z>1.5 && uv.z<2.5;
    if(shadowPass==1) {
        if(emissive)discard;
        fragment=vec4(1.0);return;
    }
    vec3 surface=mix(shade,shade*texel.rgb,step(0.5,uv.z));
    if(lighting==1 && !emissive) {
        if(dot(normal,eyePosition-worldPosition)<0.0)normal=-normal;
        vec3 light=vec3(0.0);
        for(int i=0;i<6;i++) {
            if(i>=lightCount)break;
            vec3 delta=lightPosition[i].xyz-worldPosition;
            float distance=length(delta),range=lightPosition[i].w;
            float falloff=pow(max(0.0,1.0-pow(distance/range,4.0)),2.0)/max(1.0,distance*distance);
            float lambert=max(0.0,dot(normal,normalize(delta)));
            light+=lightColor[i].rgb*lightColor[i].w*falloff*lambert*visibility(i,-delta,range);
        }
        if(painted) {
            float facing=dot(normal,normalize(vec3(-.55,.70,.40)));
            vec3 fill=true
                ? (.48+.40*max(0.0,facing))*mix(vec3(.66),vec3(0.4118,0.3961,0.5569),.38)
                : (.15+.09*max(0.0,facing))*mix(vec3(.8),vec3(0.0941,0.1412,0.2824),.45);
            bool portrait=pixel.x<768.0 && pixel.y>=440.0 && pixel.y<680.0;
            if(portrait) {
                float intensity=dot(light,vec3(.30,.49,.21));
                light=mix(vec3(intensity),light,.46);
                fill+=vec3(.29,.24,.22);
            }
            vec3 linear=pow(surface,vec3(2.2))*(fill+light*.95);
            surface=1.24*linear/(1.0+.65*max(linear.r,max(linear.g,linear.b)));
        } else {
            surface*=light*1.25;
            surface=surface/(vec3(1.0)+surface);
        }
        surface=pow(surface,vec3(1.0/2.2));
    }
    float haze=lighting==1?clamp((distanceFromEye-24.0)/140.0,0.0,0.32):0.0;
    vec3 lit=mix(surface,vec3(0.005,0.007,0.015),haze);
    if(painted && lighting==1) {
        float depth=sky?0.0:(true?.49:.20)*smoothstep(22.,230.,distanceFromEye);
        lit=mix(surface,vec3(0.4118,0.3961,0.5569),depth);
    }
    lit=mix(lit,vec3(0.45,0.48,0.5),clamp(float(flashAmount)/90.0,0.0,0.9));
    float dither=mod(floor(gl_FragCoord.x)+floor(gl_FragCoord.y),2.0)/255.0;
    fragment=vec4(floor((lit+dither)*64.0)/64.0,1.0);
}
