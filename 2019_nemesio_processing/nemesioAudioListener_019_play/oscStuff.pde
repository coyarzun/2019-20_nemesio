void oscSetup(){
  oscP5 = new OscP5(this, 12000);
  String ip = "localhost";
  myRemoteLocation = new NetAddress(ip, 12000);//

  oscP5.plug(this, "setMode",   "/setMode");
  oscP5.plug(this, "doGlitch",  "/doGlitch");
  oscP5.plug(this, "doFlat",    "/doFlat");
  oscP5.plug(this, "doCurves",  "/doCurves");
  oscP5.plug(this, "doSnake",   "/doSnake");
  oscP5.plug(this, "doVulcano", "/doVulcano");
  oscP5.plug(this, "doIcon",    "/doIcon");
  oscP5.plug(this, "doJapo",    "/doJapo");
  oscP5.plug(this, "doSpanish", "/doSpanish");
  oscP5.plug(this, "randInAll", "/randInAll");
  oscP5.plug(this, "randInMe",  "/randInMe");
  oscP5.plug(this, "wShaderV",  "/wShaderV");
  oscP5.plug(this, "lGlitch",   "/lGlitch");
  oscP5.plug(this, "rGlitch",   "/rGlitch");
  oscP5.plug(this, "inputGain", "/inputGain");
  oscP5.plug(this, "timeScale", "/timeScale");
  oscP5.plug(this, "pCycles", "/pCycles");
  oscP5.plug(this, "cycleShader", "/cycleShader");
  oscP5.plug(this, "quickRec", "/quickRec");
}
void oscEvent(OscMessage theOscMessage) {
  /* with theOscMessage.isPlugged() you check if the osc message has already been
   * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
   * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
   * be used for double posting but is not required.
   */
  if (theOscMessage.isPlugged()==false) {
    /* print the address pattern and the typetag of the received OscMessage */
    println("### received an osc message.");
    println("### addrpattern\t"+theOscMessage.addrPattern());
    println("### typetag\t"+theOscMessage.typetag());
  }
}
//add time multiplier
//
void setMode  (float v, 
               float w){    setMode(int(v),int(w));println("echo");}
void doGlitch (float v){    doGlitch  = v==1.0;    }
void doFlat   (float v){    doFlat    = v==1.0;    }
void doCurves (float v){    doCurves  = v==1.0;    }
void doSnake  (float v){    doSnake   = v==1.0;    }
void doVulcano(float v){    doVulcano = v==1.0;    }
void doIcon   (float v){    doIcon    = v==1.0;    }
void doJapo   (float v){    doJapo    = v==1.0;    }
void doSpanish(float v){    doSpanish = v==1.0;    }
void randInAll(float v){    randInAll = v==1.0;    }
void randInMe (float v){    randInMe  = v==1.0;    }
void wShaderV (float v){    wShaderV  = int(v);  println("shader "+v);  }
void lGlitch  (float v){    lGlitch   = v;         }
void rGlitch  (float v){    rGlitch   = v;         }
void inputGain(float v){    inputGain = v;         }
void timeScale(float v){    timeScale = v;         }
void pCycles  (float v){      pCycles = v;         }
void cycleShader(float v){cycleShader  = v==1.0;    }
void quickRec (float v){      beginQuickRecording();         }

boolean quickRec = false;
int quickFrames = 0;

void beginQuickRecording(){
  quickRec = true;
  quickFrames = 0;
}
void doQuickRecording(){
  saveFrame("../render/test2/nm5_"+nf(quickFrames++, 3)+".png");
  println("saved..."+quickFrames);
  if(quickFrames>=300)quickRec=false;
}


