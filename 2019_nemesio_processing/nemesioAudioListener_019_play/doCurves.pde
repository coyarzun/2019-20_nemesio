void doCurves(){
  curves       = createImage(256, 1, RGB);
  float v, vv, vvv;
  for (int i=0; i<curves.width; i++) {
    for (int j=0; j<curves.height; j++) {
      //first test
      /*
      v   = 256-i;//random(256);//map(i,0,curves.width,0,4);
      vv  = int(random(256))*1;
      vvv = 32*int(map(i,0,curves.width,0,8));
      */
      //v = i; vv= i; vvv=i;
      //v = random(256-i); vv= i; vvv=i;
      //v = random(256-i); vv= random(i); vvv=i;
      //vvv = random(256); vv= i; v=i;
      //vv = random(256); vvv= i; v=i;
      //vv = random(i); vvv= i; v=i;
      v = random(i); vv = random(i); vvv = random(i);
      curves.set(i, j, color(v, vv, vvv));
    }
  }
}
