precision highp float;
in vec3 shade;
in vec3 uv;
in vec3 worldPosition;
uniform sampler2D atlas;
in float distanceFromEye;
out vec4 fragment;
void main() {
    vec2 coordinates=uv.xy;
    if(uv.z>2.5) {
        vec3 normal=abs(cross(dFdx(worldPosition),dFdy(worldPosition)));
        vec2 plane=normal.x>normal.y && normal.x>normal.z ? worldPosition.zy :
                   normal.y>normal.z ? worldPosition.xz : worldPosition.xy;
        vec2 tile=floor(uv.xy*vec2(8.0,16.0));
        coordinates=(tile*64.0+1.0+fract(plane*0.65)*62.0)/vec2(512.0,1024.0);
    }
    vec4 texel=texture(atlas,coordinates);
    if(uv.z>0.5&&texel.a<0.5)discard;
    vec3 surface=mix(shade,shade*texel.rgb,step(0.5,uv.z));
    vec3 fog = vec3(0.035, 0.045, 0.065);
    float dither = mod(floor(gl_FragCoord.x) + floor(gl_FragCoord.y), 2.0) / 255.0;
    float haze=clamp((distanceFromEye-16.0)/90.0,0.0,0.72);
    if(uv.z>1.5 && uv.z<2.5)haze*=0.3;
    vec3 lit = mix(surface, fog, haze);
    fragment = vec4(floor((lit + dither) * 64.0) / 64.0, 1.0);
}
