/*
  4. Spherical
*/
void viz4() {
  drawGradient(#16282E, #000000);
  drawStars();

  pointLight(0, 0, 255, -3, 4, -3);
  pointLight(40, 33, 94, 6, 3, -3);

  camera(
  width*0.5, height*0.36, height*0.28, 
  width*0.5, height*0.25, 0, 
  0, 1, 0);

  pushMatrix();
  translate(width/2, height/4);
  rotateX(1);
  scale(400);

  for (int dy=0; dy<data.h; dy++) { //data.h
    for (int dx=0; dx<data.w; dx++) {
      float val = data.D[dx][dy];
      pushMatrix();

      rotateY(data.px(dx) * TWO_PI);
      rotateZ(data.py(dy) * TWO_PI);

      translate(0.1+val/4, 0, 0);
      
      noStroke();
      fill((-60+val * 256) % 512, sin(val * 10) * 128 + 128, sin(val * 7) * 100 + 150);
      box(0.1, 0.003, 0.003);

      if (val > data.topThreshold) {
        stroke(0, 255, 255, 40);
        strokeWeight(2/700.0);
        line(0, 0, 0, random(5), 0, 0);
      }

      popMatrix();
    }
  }
  popMatrix();
   
  rendered = true;
}
