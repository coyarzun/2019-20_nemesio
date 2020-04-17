class Vulcano{
  PShape babel;
  
  Vulcano(){
  }
  void draw(PGraphics pg){
    pg.pushMatrix();
    pg.translate(width/2,height/2);
  
    int rounds = 8;
    float radius = 100;
    int steps = 7*5*rounds;
    float w = 10, h = 10, d = 20;
    pg.rotateX(-radians(45));
    pg.rotateY(-radians(frameCount));
    float dAngle = rounds*TWO_PI/steps;
    for(int i=0; i<steps; i++){
      d = (TWO_PI*radius)/(steps/rounds);
      pg.pushMatrix();
      pg.rotateY(i*dAngle);
      pg.translate(radius,0,0);
      pg.translate(0,-h/2,0);
      //pg.noStroke();
      pg.fill((i)%2==0?0:255);
      pg.box(w,h,d);
      pg.popMatrix();
      h+=0.5;
      radius-=0.325;
    }
    pg.popMatrix();
  }
}
