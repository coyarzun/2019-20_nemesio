#define PROCESSING_COLOR_SHADER

#define PI 3.14159265358979323846
#define sq3         1.73205080757

uniform sampler2D texture;
uniform sampler2D textureMap;

uniform float time;
uniform vec2 resolution;
uniform sampler2D ppixels;

/////////////////////////////////////
// uniform float leftGlitch, rightGlitch;
// uniform float interlaceF;
// uniform float hueCyclingF;
// uniform float hShearAmp, vShearAmp;
// uniform float micLevel;
// uniform float doH;
/////////////////////////////////////

vec3 rgb2hsv(vec3 c)
{
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
}
vec3 hsv2rgb(vec3 c)
{
    vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}
float map(float x, float in_min, float in_max, float out_min, float out_max)
{
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
float rand(float n){return fract(sin(n) * 43758.5453123);}

/////////////////////////////

void main(){
vec2 p = (gl_FragCoord.xy*2.0-resolution)/min(resolution.x,resolution.y);


for(float i=1.0; i<=6.0; ++i){
 p = abs(p*1.5)-1.0;
 float a = time*0.25*i;
 float c = 1.2*sin(8.0*a), s = cos(0.5*a);
 p*=mat2(c,s,-s,c);
}

vec2 axis = 1.0-smoothstep(10.1,1.0,abs(p));
vec2 color = mix(p,vec2(1),axis.x+axis.y);
gl_FragColor = vec4(color*0.85, 0.5, 0.25);
}
