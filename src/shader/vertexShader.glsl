attribute vec3 aRandom;
varying vec3 vPosition;
uniform float uTime;
uniform float uScale;
void main(){
    vPosition=position;
    float time = uTime *4.0;
    vec3 pos=position;
    pos.z+=sin(time*aRandom.z)*0.01;
    pos.y+=sin(time*aRandom.y)*0.01;
    pos.x+=sin(time*aRandom.x)*0.01;
    pos.x *=uScale+(sin(pos.y*4.0+time)*(1.0-uScale));
    pos.y *=uScale+(cos(pos.z*4.0+time)*(1.0-uScale));
    pos.z *=uScale+(sin(pos.x*4.0+time)*(1.0-uScale));
    pos *=uScale;
    
    vec4 mvPosition = modelViewMatrix * vec4( pos, 1.0);
    gl_Position = projectionMatrix * mvPosition;
    gl_PointSize = 6.0/ -mvPosition.z;
}