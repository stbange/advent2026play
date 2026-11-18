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
    bool basin=uv.z>0.5 && pixel.x>=512.0;
    bool sky=basin && uv.z>1.5 && uv.z<2.5 && pixel.x<1536.0 && pixel.y>=384.0 && pixel.y<640.0;
    if(uv.z>2.5 && uv.z<3.5) {
        vec3 axis=abs(normal);
        vec2 plane=axis.x>axis.y && axis.x>axis.z ? worldPosition.zy :
                   axis.y>axis.z ? worldPosition.xz : worldPosition.xy;
        if(!basin) {
            vec2 tile=floor(pixel/64.0);
            coordinates=(tile*64.0+1.0+fract(plane*0.65)*62.0)/dimensions;
        } else if(pixel.y>=640.0 && pixel.y<768.0) {
            // Fine stone courses, larger wind ripples and long sediment beds use metre-based UVs.
            float tile=floor((pixel.x-512.0)/128.0);
            vec2 repeatRate=tile==2.0 ? vec2(.095,.13) :
                            tile==3.0 || tile==4.0 ? vec2(.13,.16) : vec2(.24);
            coordinates=(floor(pixel/128.0)*128.0+.5+fract(plane*repeatRate)*127.0)/dimensions;
        }
    }
    if(sky) {
        vec3 ray=normalize(worldPosition-eyePosition);
        float u=fract(atan(ray.z,ray.x)/6.2831853);
        float v=clamp(.89-1.07*ray.y,0.0,1.0);
        coordinates=(vec2(512.5,384.5)+vec2(u*1023.0,v*255.0))/dimensions;
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
        if(basin) {
            float cavern=smoothstep(177.0,193.0,worldPosition.x)*(1.0-smoothstep(236.0,251.0,worldPosition.x))*
                         smoothstep(59.0,76.0,worldPosition.z)*(1.0-smoothstep(97.0,104.0,worldPosition.z))*
                         (1.0-smoothstep(14.0,16.0,worldPosition.y));
            vec3 twilight=mix(vec3(.45,.34,.53),vec3(.86,.76,1.0),normal.y*.5+.5);
            float face=dot(normal,normalize(vec3(-.76,.32,.48)));
            twilight*=mix(vec3(.72,.80,1.13),vec3(1.16,1.04,.92),smoothstep(-.5,.8,face));
            twilight=mix(twilight,vec3(.045,.095,.14),cavern);
            if(pixel.y>=640.0 && pixel.y<768.0 && pixel.x>=768.0 && pixel.x<896.0) {
                float drift=sin(worldPosition.z*.17+worldPosition.x*.07+2.7*sin(worldPosition.x*.035));
                surface*=mix(vec3(.87,.83,.91),vec3(1.04,1.02,.98),smoothstep(-.5,.8,drift));
            }
            surface=pow(surface,vec3(2.2))*(twilight+light*.90);
            float peak=max(surface.r,max(surface.g,surface.b));
            surface=1.23*surface/(1.0+.68*peak);
        } else {
            surface*=light*1.25;
            surface=surface/(vec3(1.0)+surface);
        }
        surface=pow(surface,vec3(1.0/2.2));
    }
    float haze=lighting==1?clamp((distanceFromEye-24.0)/140.0,0.0,0.32):0.0;
    vec3 lit=mix(surface,vec3(0.005,0.007,0.015),haze);
    if(basin && lighting==1) {
        float dust=sky?0.0:.84*smoothstep(18.0,360.0,distanceFromEye);
        lit=mix(surface,vec3(.67,.51,.69),dust);
    }
    lit=mix(lit,vec3(0.45,0.48,0.5),clamp(float(flashAmount)/90.0,0.0,0.9));
    float dither=mod(floor(gl_FragCoord.x)+floor(gl_FragCoord.y),2.0)/255.0;
    fragment=vec4(floor((lit+dither)*64.0)/64.0,1.0);
}
