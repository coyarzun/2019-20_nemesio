////////////////////////////////////////////////////////////////////////////////////
void setupGraficas(){
  graficas = new PImage[138];
  
  String[] nameRoot = new String[3];
    nameRoot[0] = "n3m3510_allGraphics_960_";
    nameRoot[1] = "n3m3510_allGraphics_pink_960_";
    nameRoot[2] = "n3m3510_allGraphics_white_960_";
  
  for(int grupo=0; grupo<3; grupo++){
    for(int i=0; i<46; i++){
      println(grupo+" "+i+" "+(grupo*46+i));
      graficas[grupo*46+i] = loadImage("../_data/pngSrcs_trim/"+nameRoot[grupo]+nf(i,3)+"_trim.png");
    }
  }
}
void doGraphLayer(){
  //define colors first
  int first = int(random(30)/10);
  int second = first;
  int third = first;
  
  while(first==second){
    second = int(random(30)/10);
  }
  
  while(third==first || third==second ){
    third = int(random(30)/10);
  }
  int zmode = mode==0?(int(random(1,5))-1)*9+1:(mode-1)*9+1;//mode 2 >>1 10 19 ...
  // icon first
  int icon =  first*46+zmode;//int(random(20)/10);
  // spanish second
  int spanish = second*46+zmode+(mode==0? 1+int(random(8)):1+(2*int(random(40)/10)+1));
  // japo third
  int japo = third*46+zmode+(mode==0? 1+int(random(8)):1+(2*int(random(40)/10)));
  //define index of each
  //display them
  resetShader();
  imageMode(CENTER);
  float f1 = random(0.5, 2.0);
  float f2 = random(0.5, 2.0);
  float f3 = random(0.5, 2.0);
  if(random(100)>50 && doIcon)    image(graficas[icon],    width/2,height/2,graficas[icon].width*f1,graficas[icon].height*f1);
  if(random(100)>50 && doSpanish) image(graficas[spanish], width/2,height/2,graficas[spanish].width*f2,graficas[spanish].height*f2);
  if(random(100)>50 && doJapo)    image(graficas[japo],    width/2,height/2,graficas[japo].width*f3,graficas[japo].height*f3);
}
PImage wichGraph(){
  return graficas[int(random(graficas.length))];
}

void doGreenLayer(){
   for(int i=0; i<dotsLayer.width; i++){//
    for(int j=0; j<dotsLayer.height; j++){
      dotsLayer.set(i,j,color(color(0,255,0)));//nature
    }
   }
}

void movieEvent(Movie m) {
  m.read();
}

void doCarton(){
  resetShader();
  imageMode(CENTER);
  image(
  graficas[46],    
  width/2,height/2,graficas[46].width,graficas[46].height);
}


