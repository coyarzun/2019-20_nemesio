#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_TEXTURE_SHADER

#define PI 3.14159265358979323846
#define sq3         1.73205080757

uniform sampler2D texture;
uniform sampler2D textureMap;

uniform float time;
uniform vec2 resolution;
uniform sampler2D ppixels;
uniform sampler2D micIn;

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

void main(void) {
    
    vec2 p = gl_FragCoord.xy/ resolution.xy;
    p.y = 1.0 - p.y;//<--vertical correction!!

    //p.y += sin((p.x)*PI+time*10.5);
    //p.y+=0.0;//rand(10.0);

    /////////sideGlitches
    if(rand(1.0)>0.5){
    float leftGlitch = 0.15;
    float rightGlitch = 0.85;

    if(p.x<leftGlitch){
        p.x = leftGlitch;
    }
    if(p.x>rightGlitch){
        p.x = rightGlitch;
    }
    }
    ////////////////////////
    //mic levels    
    vec4 levels = texture2D(micIn, p);
    float hhh = levels.r*0.1;
    p.y+=hhh*1.0;
    /////////sideGlitches
    
     float tleftGlitch = levels.g*1.0;
     float trightGlitch = 1.0-levels.b*1.0;

    if(p.y<tleftGlitch){
        p.y = tleftGlitch;
    }
    if(p.y>trightGlitch){
        p.y = trightGlitch;
    }
    
    ////////////////da color
    vec4 color       = texture2D(texture, p);//factor = zoom <1 aumenta >1 achica


    //curves
    color.r         = 1.0*texture2D(textureMap, vec2(color.r, 1)).r;
    //color.r  = mod(color.r +time,1.0);
    color.g         = 1.0*texture2D(textureMap, vec2(color.g, 1)).g;
    color.b         = 1.0*texture2D(textureMap, vec2(color.b, 1)).b;

    //gl_FragColor    = color*1.0;//*factor 0-1 brillo 1>>+brillo

    float h = rgb2hsv(vec3(color.rgb)).r;
    h = mod(h+time,1.0);

    /////////////////////
    vec2 ppp = (gl_FragCoord.xy*2.0-resolution)/min(resolution.x,resolution.y);
    for(float i=1.0; i<=1.0; ++i){
        ppp = abs(ppp*1.5)-1.0;
        float a = time*0.25*i;
        float c = 1.0*sin(8.5*a), s = cos(0.5*a);
        ppp*=mat2(c,s,-s,c);
    }
    
    vec2 axis = 1.0-smoothstep(10.1,1.0,abs(p));
    vec2 colors = mix(ppp,vec2(1),axis.x+axis.y);
    vec4 cc = vec4(colors*0.85, 0.5, 0.25) ;

    //////////////////////
    gl_FragColor = 0.175*cc+levels*0.0+vec4(color)+0.015*vec4(hsv2rgb(vec3(h,1.0,1.0)), 1.0);//vec4(color);// 
}




