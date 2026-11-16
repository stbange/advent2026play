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
    if(uv.z>2.5) {
        vec3 axis=abs(normal);
        vec2 plane=axis.x>axis.y && axis.x>axis.z ? worldPosition.zy :
                   axis.y>axis.z ? worldPosition.xz : worldPosition.xy;
        vec2 tile=floor(uv.xy*vec2(8.0,16.0));
        coordinates=(tile*64.0+1.0+fract(plane*0.65)*62.0)/vec2(512.0,1024.0);
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
        surface*=light;
        surface=surface/(vec3(1.0)+surface);
        surface=pow(surface,vec3(0.75));
    }
    float haze=lighting==1?clamp((distanceFromEye-18.0)/100.0,0.0,0.55):0.0;
    vec3 lit=mix(surface,vec3(0.005,0.007,0.015),haze);
    float dither=mod(floor(gl_FragCoord.x)+floor(gl_FragCoord.y),2.0)/255.0;
    fragment=vec4(floor((lit+dither)*64.0)/64.0,1.0);
}
