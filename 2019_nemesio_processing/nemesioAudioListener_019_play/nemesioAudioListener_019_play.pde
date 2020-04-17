//////////////////////////////////////////////
import processing.video.*;
import ddf.minim.*;
import oscP5.*;
import netP5.*;
//////////////////////////////////////////////
Minim       minim;
AudioInput  in;
OscP5       oscP5;
NetAddress  myRemoteLocation;
//////////////////////////////////////////////
PImage    dotsLayer;
PShader   shader;
PImage    curves;
PImage    micIn;
PImage[]  graficas;
Movie     pollock, pacos;
OrthoBezier3D snake;
Vulcano vulcano;
//////////////////////////////////////////////
// keda implementar osc protocol
//////////////////////////////////////////////
//GLOBAL CONTROL//////////////////////////////
//////////////////////////////////////////////
int mode, submode;
//mode>> 0: portada; 1-5: paginas; 6:contraportada
//submode>> 0: piola; 1:groover; 2:darker; 3:aggressive; 5:outro
//determinan en global:
boolean doGlitch, doFlat, doCurves, doSnake, doVulcano;
boolean doIcon, doJapo, doSpanish;
boolean randInAll, randInMe;
boolean waveFormResponse;
int wShaderV;
float lGlitch, rGlitch;
float inputGain, timeScale = 0.015;
float pCycles = 2.0;
color snakeColor;
color bgcolor;
boolean cycleShader;
//determinar parámetros más finos de shader
//cambiar rain video
//////////////////////////////////////////////
//////////////////////////////////////////////
void setup(){
  shader   = loadShader("../_data/pollockShader_001.glsl");
  size(displayWidth, displayHeight/2, P3D);
  background(0);
  setupGraficas();
  dotsLayer = createImage(width/32,height/32,RGB);
  
  pollock    = new Movie(this, "/Users/coyarzun/Documents/Processing/2019_n3M3510/videoAudioListener/_data/pollockClean.mov");
  //pacos      = new Movie(this, "/Users/coyarzun/Documents/Processing/2019_n3M3510/videoAudioListener/_data/rain.mp4");
  pollock.loop();
  //pacos.loop();
  
  
  doCurves();
  
  minim = new Minim(this);
  in = minim.getLineIn();
  micIn = createImage(in.bufferSize()/4,1,RGB);
  
  snake = new OrthoBezier3D();
  vulcano = new Vulcano();
  
  doGreenLayer();
  
  wShaderV = 0;
  setMode(6,0);
  
  oscSetup();
}
void doMicIn(){
  for(int i = 0; i < micIn.width; i++)  {//crear var independiente para resolucion de audio
    float c = abs(in.left.get(i))*255*inputGain;
    micIn.set(i, 0, color(c,c,c));
  }
}
void draw(){
  if(mode!=6){
  doMicIn();
  background( bgcolor );
  ////////////////////
  if(doSnake){
    pushMatrix();
    resetShader();noStroke();//stroke(0);
    translate(width/2,height/2);
    snake.draw(g, 
               snakeColor
    );
    popMatrix();
  }
  if(mode==5 && doVulcano){
  stroke(0);
  vulcano.draw(g);
  noStroke();
  }
  ////////////////////
  shaderRoutine();
  noStroke();
  shader(shader);
  beginShape(QUAD_STRIP);
  texture(mode==1?pollock:mode==2?micIn:mode==3?dotsLayer:mode==4?pollock:mode==5?wichGraph():g);
  //vertex(0,0,-4);
  //vertex(0,height,-4);
  int s = 128;
  for(int i=0; i<width; i+=s){
    float z = mode==1?
    -200*abs(in.left.get(i/s))
    :mode==2?
    0//-8000*abs(in.left.get(i/s))
    :mode==3?
    0:0;
    vertex(i,0,z-4);
    vertex(i,height,z-4);
  }
  //vertex(width,0,-4);
  //vertex(width,height,-4);
  endShape();
  //if(doGraphLayer)
  doGraphLayer();
  if(randInAll)
  setMode(int(random(6)),int(random(4)) );
  else if(randInMe)
  setMode(mode,int(random(4)) );
  }else{
    background(0);
    doCarton();
  }
  
  if(quickRec)doQuickRecording();
}




