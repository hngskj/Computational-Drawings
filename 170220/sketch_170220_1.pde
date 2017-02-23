void setup(){
  size(700, 700);
  pixelDensity(2);
  smooth();
  background(50);
  // stroke(255);


  grad(100, 200, 100, 200);
  grad(300, 500, 300, 350);
}

void grad(float xpos1, float xpos2, float ypos1, float ypos2){
  for (float i=xpos1; i<xpos2; i++){
    stroke(255, map(i, xpos1, xpos2, 0, 255));
    line(i, ypos1, i, ypos2);
  }
}
