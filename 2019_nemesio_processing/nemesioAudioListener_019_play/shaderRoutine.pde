void shaderRoutine(){
  if(cycleShader) wShaderV = int(random(10));
  //shader   = loadShader("../_data/pollockShader_001.glsl");//solo por mientras
  shader.set("resolution", float(width), float(height));
  shader.set("time", radians(millis()*timeScale));
  shader.set("textureMap", curves);
  shader.set("micIn", micIn);
  shader.set("mode", float(mode));
  shader.set("doCurves", doCurves? 1.0:0.0 );//wShaderV
  shader.set("wichShadeVariation", float(wShaderV));//doCurves? 1.0:0.0 );//wShaderV
  shader.set("pCycles", pCycles);
  //println("shader"+float(wShaderV));
  
  float doLGlitch = 0.0, doRGlitch = 0.0;
  if(doGlitch){
    if(mode==100){
      doLGlitch = 1.0;
      doRGlitch = 1.0;
    }else{
      doLGlitch = random(100)>70? 1.0:0.0;
      doRGlitch = random(100)>70? 1.0:0.0;
    }
  }
  
  shader.set("doLGlitch", doLGlitch);
  shader.set("doRGlitch", doRGlitch);
  shader.set("lGlitch", mode==1?0.25:random(0.5));
  shader.set("rGlitch", mode==1?0.75:random(0.5,1));
}
void doShaderVariation(int i){
  wShaderV = i;
}
