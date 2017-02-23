float thick = 5;
float linel = 70;
int num = 50;

void setup(){
  size(700, 700);
  pixelDensity(2);
  smooth();
  background(50);
  // stroke(255);

  for (int i = 0; i < num; i++){
    grad2(random(-linel, width-linel/2), linel, random(0, height-thick), thick);
  }
}

// void grad1(float xpos1, float xpos2, float ypos1, float ypos2){
//   for (float i=xpos1; i<xpos2; i++){
//     stroke(255, map(i, xpos1, xpos2, 0, 255));
//     line(i, ypos1, i, ypos2);
//   }
// }

void grad2(float xpos, float xlen, float ypos, float yheight){
  for (float i=xpos; i<xpos+xlen; i++){

    stroke(255, map(i, xpos, xpos+xlen, 0, 255));
    line(i, ypos, i, ypos+yheight);
  }
}
