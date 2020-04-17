void setMode(int m, int n){
  mode = m;
  submode = n;
  
  //submode>> 0: piola; 1:groover; 2:darker; 3:aggressive; 
  if(submode==0){       //0: piola;
    doGlitch = false;
    doFlat   = true;
    doCurves = false;
    doSnake  = false;
    waveFormResponse = true;
    inputGain = 1.0;
    doIcon    = false;
    doJapo    = true;
    doSpanish = false;
    //wShaderV = 0;
  }else if (submode==1){//1:groover;
    doGlitch = true;
    doFlat   = true;
    doCurves = false;
    doSnake  = true;
    waveFormResponse = true;
    inputGain = 0.4;
    doIcon    = true;
    doJapo    = true;
    doSpanish = false;
    //wShaderV = 1;
  }else if (submode==2){//2:darker;
    doGlitch = true;
    doFlat   = false;
    doCurves = true;
    doSnake  = true;
    waveFormResponse = true;
    inputGain = 0.8;
    doIcon    = true;
    doJapo    = true;
    doSpanish = false;
    //wShaderV = 2;
  }else if (submode==3){//3:outro;
    doGlitch = true;
    doFlat   = false;
    doCurves = true;
    doSnake  = true;
    waveFormResponse = true;
    inputGain = 1.2;
    doIcon    = true;
    doJapo    = true;
    doSpanish = true;
    //wShaderV = 3;
  }
  
  //pollock////waveform//naturaleza//zamorano//upside down//contraportada//portada
  if(mode==0){
    bgcolor = color(0);
    snakeColor = color(255,0,121);
  }else if(mode==1){
    bgcolor = color(0);
    snakeColor = color(0);
  }else if(mode==2){
    bgcolor = color(255);
    snakeColor = color(0);
    doIcon = false;
    doJapo = false;
    doSnake = true;
  }else if(mode==3){
    bgcolor = color(0,255,0);
    snakeColor = color(255,0,121);
    doSnake = true;
  }else if(mode==4){
    bgcolor = color(255,0,121);
    snakeColor = color(0,255,0);
  }else if(mode==5){
    bgcolor = color(0);
    snakeColor = color(255);
  }else if(mode==6){
    bgcolor = color(0);
    snakeColor = color(255,0,121);
    
  }
}
