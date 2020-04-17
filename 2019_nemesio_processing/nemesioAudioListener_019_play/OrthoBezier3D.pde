class OrthoBezier3D {// extends Abyss {

  boolean doOrtho, ytrans, doBlink, doCycle;
  boolean doXart, doYart, doZart, doSpinY, doSpinZ;
  boolean doSpin, doScaleUnit, boxMode, doGrid;
  boolean doLights;
  boolean doAlpha, doPolar;
  boolean doRandomPolar, doBlinkInvert, doInvert, doRadiox;
  boolean doSpinX;
  boolean doFirst, doRumble;
  int wlight = 0, wichView = 4, colorMood = 0; 


  float   unit;
  int cols, rows, zcols;

  ThreeDeeWalker walker;

  OrthoBezier3D() {
    cols = 8*4*4; 
    rows = 8*4*4;//*2*5; 
    zcols = 8*4*4;
    walker = new ThreeDeeWalker();
  }
  void draw(PGraphics pg, color clr) {
    if (doScaleUnit)unit = 16;
    else unit = 8;
    //pg.background(0);
    pg.camera();
    pg.translate(width/2, height/2);
    doView(pg);
    //if(frameCount%2==0)
    //if(random(100)>30)
    if (doGrid)doGrid(pg);
    //else{
    if (doLights)doLights(pg);
    walker.update();
    walker.draw(pg, clr);
    if (doBlink)doLights=!doLights;
    //}
  }
  void doView(PGraphics pg) {
    if (wichView==0) {
      pg.ortho();
      pg.rotateY(radians(+(doSpin?frameCount:0)));
    } else if (wichView==1) {
      pg.perspective();
      pg.rotateY(radians(+(doSpin?frameCount:0)));
    } else if (wichView==2) {
      pg.ortho();
      pg.rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//+frameCount));
      pg.rotateY(radians(45+(doSpin?frameCount:0)));
    } else if (wichView==3) {
      pg.perspective();
      pg.rotateX(-radians(45));//+(doSpin?frameCount:0)));//));//
      pg.rotateY(radians(45+(doSpin?frameCount:0)));//
    } else {
      pg.beginCamera();
      //ortho();
      pg.camera();
      pg.translate(width/2, height/2);
      pg.translate(-cols*unit/2, -rows*unit/2, -zcols*unit/2);
      pg.translate(
      walker.paths.get(walker.paths.size()-1).sx*unit, 
      walker.paths.get(walker.paths.size()-1).sy*unit, 
      walker.paths.get(walker.paths.size()-1).sz*unit
        );
      pg.rotateX(walker.paths.get(walker.paths.size()-1).tx);
      pg.rotateY(walker.paths.get(walker.paths.size()-1).ty+PI);
      pg.rotateZ(walker.paths.get(walker.paths.size()-1).tz);
      /*
    walker.paths.get(walker.paths.size()-1).direction.x,
       walker.paths.get(walker.paths.size()-1).direction.y,
       walker.paths.get(walker.paths.size()-1).direction.z
       */

      pg.endCamera();
    }
  }
  void doGrid(PGraphics pg) {
    pg.pushMatrix();
    pg.translate(-cols*unit/2, -rows*unit/2, -zcols*unit/2);
    pg.strokeWeight(2);
    pg.beginShape(POINTS);
    for (int i=0; i<cols; i++) {
      for (int j=0; j<rows; j++) {
        for (int k=0; k<cols; k++) {
          if (colorMood==0)
            pg.stroke(255);
          else if (colorMood==1) {
            pg.stroke(0, 255, 0);
          } else {
            pg.stroke(map(i, 0, cols, 0, 255), map(j, 0, rows, 0, 255), map(k, 0, zcols, 0, 255));
          }
          pg.vertex(i*unit, j*unit, k*unit);
        }
      }
    }
    pg.endShape();
    pg.popMatrix();
  }
  void doLights(PGraphics pg) {
    pg.directionalLight( 255, 0, 0, 1, 0, 0);
    pg.directionalLight(   0, 255, 0, 0, 1, 0);
    pg.directionalLight(   0, 0, 255, 0, 0, -1);
  }


  class Path {
    PVector from, to, current, speed, direction;
    PVector c1, c2;
    int maxlife = 100*10;
    int life = maxlife;
    ThreeDeeWalker root;
    boolean done, reallydone;

    Path(ThreeDeeWalker r, PVector f, PVector t, PVector d) {
      root = r;
      from = f;  
      to   = t; 
      current = new PVector(from.x, from.y, from.z);
      c1 = new PVector(from.x+random(-10, 10), from.y+random(-10, 10), from.z+random(-10, 10));
      c2 = new PVector(to.x+random(-10, 10), to.y+random(-10, 10), to.z+random(-10, 10));
      direction = d;
      speed = new PVector(d.x, d.y, d.z);
      steps = 1*int(dist(from.x, from.y, from.z, to.x, to.y, to.z));
      fromStep = 0;
      toStep   = steps;
      cStep = 0;
    }
    void update() {
      life--;
      if (!done) {
        current.x+=speed.x;
        current.y+=speed.y;
        current.z+=speed.z;
      } else if (life<0) {
        from.x+=speed.x;
        from.y+=speed.y;
        from.z+=speed.z;
      }
      //println(from+" "+current+" "+to);

      if ((to.x-current.x)+(to.y-current.y)+(to.z-current.z)==0.0 && !done) {
        //println("next!");
        root.addPath();
        //speed.x=0;speed.y=0;speed.z=0;
        done = true;
        println("done");
      }

      if ((to.x-from.x)+(to.y-from.y)+(to.z-from.z)==0.0) {
        //println("next!");
        speed.x=0;
        speed.y=0;
        speed.z=0;
        reallydone = true;
        println("dead");
      }
    }
    int steps, fromStep, toStep, cStep;

    void updateBezierMode() {
      life--;

      if (!done)cStep++;
      else if (life<0)    fromStep++;

      if (cStep>=steps && !done) {
        root.addPath();
        done = true;
      }
      if (fromStep>=toStep) {
        reallydone = true;
      }
    }
    void draw(PGraphics pg, color clr) {
      if (boxMode)
        boxDraw(pg, clr);
      else
        //lineDraw();
      bezierDraw(pg, clr);
    }
    void boxDraw(PGraphics pg, color clr) {
      pg.fill(clr);
      pg.pushMatrix();
      pg.noStroke();
      float w = (1+(abs(current.x-from.x)))*unit;
      float h = (1+(abs(current.y-from.y)))*unit;
      float d = (1+(abs(current.z-from.z)))*unit;
      float cx = (current.x-from.x)/2;
      float cy = (current.y-from.y)/2;
      float cz = (current.z-from.z)/2;
      pg.translate((from.x+cx)*unit, (from.y+cy)*unit, (from.z+cz)*unit);

      pg.box(w, h, d);
      pg.popMatrix();
    }
    void lineDraw(PGraphics pg) {
      //println("drawing?");
      //pushMatrix();vvv
      pg.line(from.x*unit, from.y*unit, from.z*unit, current.x*unit, current.y*unit, current.z*unit);
      //popMatrix();
    }
    float t, sx, sy, sz, sdiam;
    float tx, ty, tz, sa;

    void bezierDraw(PGraphics pg, color clr) {
      //println("drawing?");
      //pushMatrix();vvv
      //bezier(a.x, a.y, c1.x, c1.y, c2.x, c2.y, b.x, b.y);
      pg.strokeWeight(1.0);
      pg.stroke(255, map(constrain(life, -10, maxlife), -10, maxlife, 0, 255));
      pg.noFill();
      /*bezier(  
       from.x*unit, from.y*unit, from.z*unit, 
       c1.x*unit, c1.y*unit, c1.z*unit, 
       c2.x*unit, c2.y*unit, c2.z*unit, 
       to.x*unit, to.y*unit, to.z*unit);
       */
      //popMatrix();




      boolean itsMe;

      for (int i=fromStep; i<cStep+1; i++) {
        itsMe = i==cStep;//(frameCount)%steps==i;

        t = i/float(steps);
        sx = bezierPoint(from.x, c1.x, c2.x, to.x, t);
        sy = bezierPoint(from.y, c1.y, c2.y, to.y, t);
        sz = bezierPoint(from.z, c1.z, c2.z, to.z, t);

        /*
    sx    = map(sx, 10, width/3-10, -width/6+5, width/6-5);
         sy    = map(sy, 10, width/3-10, -width/6+5, width/6-5); 
         sz    = map(sz, 10, width/3-10, -width/6+5, width/6-5);
         */

        //sx-=width/6-5;
        //sy-=width/6-5;
        //sz-=width/6-5;

        //sz -= width/3;

        //sdiam = i%16==0?8:5;
        sdiam = 4;
        sdiam*=2;
        if (itsMe) sdiam*=1.8;

        //    stroke(220);
        //    line(sx,0,sx,height);
        //    line(0,sy,width,sy);
        float f = map(i, 0, steps+1, 0, 1);
        color cc = lerpColor(color(255, 0, 255), color(255, 255, 0), f);

        pg.fill(!itsMe? clr:clr);//255:255);
        pg.noStroke();
        pg.pushMatrix();
        pg.translate(sx*unit, sy*unit, sz*unit);
        //ellipse(0,0, sdiam, sdiam);

        tx = bezierTangent(from.x, c1.x, c2.x, to.x, t);
        ty = bezierTangent(from.y, c1.y, c2.y, to.y, t);
        tz = bezierTangent(from.z, c1.z, c2.z, to.z, t);

        sa = atan2(ty, tx);
        sa -= HALF_PI;
        //
        float xxx = atan2(ty, tx);
        float yyy = atan2(tz, ty);
        float zzz = atan2(tx, tz);
        //x=r*sin(theta)*cos(phi)
        //y=r*sin(theta)*sin(phi);
        //z=r*cos(theta); 
        //line(0, 0, 0, 2*sdiam*cos(sa)+sx, 2*sdiam*sin(sa)+sy, 0);
        pg.rotateX(xxx);
        pg.rotateY(yyy);
        pg.rotateZ(zzz);
        //rotateZ(radians(frameCount));
        pg.box(sdiam);
        pg.box(sdiam*.2, sdiam*4, sdiam*.2);
        pg.popMatrix();
      }
    }
  }


  class ThreeDeeWalker {
    ArrayList<Path> paths;
    int pathIndex;

    ThreeDeeWalker() {
      paths = new ArrayList<Path>();
      pathIndex = 0;
      addPath();
    }
    void addPath() {
      int c, r, z, tc, tr, tz, ll;

      if (pathIndex==0) {
        c = int(random(cols));
        r = int(random(rows));
        z = int(random(zcols));
      } else {
        c = int(paths.get(pathIndex-1).to.x);
        r = int(paths.get(pathIndex-1).to.y);
        z = int(paths.get(pathIndex-1).to.z);
        //debiera ser, evaluar en q eje se mueve y elejir solo los otros 2
      }
      /////////////
      float dice = random(100);
      if (dice<30) { 
        tc = int(random(cols));
        tr = r;
        tz = z;
      } else if (dice<60) {
        tc = c;
        tr = int(random(rows));
        tz = z;
      } else {
        tc = c;
        tr = r;
        tz = int(random(zcols));
      }
      /////////////
      int ddC = (tc-c);
      int ddR = (tr-r);
      int ddZ = (tz-z);
      int dC, dR, dZ;
      if (ddC==0) dC = 0;
      else dC = abs(ddC)/ddC;

      if (ddR==0) dR = 0;
      else dR = abs(ddR)/ddR;

      if (ddZ==0) dZ = 0;
      else dZ = abs(ddZ)/ddZ;
      ///////////////////
      paths.add(new Path(this, new PVector(c, r, z), new PVector(tc, tr, tz), new PVector(dC, dR, dZ)));
      pathIndex++;
    }
    void update() {
      for (int i=0; i<paths.size (); i++) {
        paths.get(i).updateBezierMode();
        if (paths.get(i).reallydone) {//<0){
          paths.remove(i);
          pathIndex--;
        }
      }
      //addPath();
    }
    void draw(PGraphics pg, color clr) {
      pg.noStroke();
      pg.pushMatrix();
      pg.translate(-cols*unit/2, -rows*unit/2, -zcols*unit/2);
      //box(unit*12);
      if (!boxMode)
      {
        pg.beginShape();
        pg.stroke(255);
        pg.strokeWeight(unit);
        pg.strokeCap(ROUND);
        pg.strokeJoin(ROUND);
      }
      for (int i=0; i<paths.size (); i++) {
        paths.get(i).draw(pg, clr);
      }
      if (!boxMode)pg.endShape();
      pg.popMatrix();
    }
  }
}

