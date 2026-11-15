#version 300 es
precision highp float;
layout(location=0) in vec2 position;
uniform mat4 projection;
uniform mat4 view;
uniform float eyeHeight;
out vec2 uv;
void main(){uv=position*0.5+0.5;gl_Position=projection*view*vec4(position.x*1.6,position.y+eyeHeight,-2.5,1.0);}
