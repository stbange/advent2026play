#version 300 es
precision mediump float;
in vec2 uv;
uniform sampler2D picture;
out vec4 color;
void main(){color=texture(picture,uv);}
