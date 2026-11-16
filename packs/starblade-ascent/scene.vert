precision highp float;
layout(location=0) in vec3 position;
layout(location=1) in vec3 color;
layout(location=2) in vec3 textureCoordinates;
uniform mat4 viewProjection;
out vec3 shade;
out vec3 uv;
out vec3 worldPosition;
out float distanceFromEye;
void main() {
    gl_Position = viewProjection * vec4(position, 1.0);
    shade = color;
    uv=textureCoordinates;
    worldPosition=position;
    distanceFromEye = gl_Position.w;
}
