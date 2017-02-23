float thick = 5;
float linel = 70;
int num = 50;
int arr = 0;

void setup(){
  size(700, 700);
  pixelDensity(2);
  smooth();
  colorMode(HSB, 360, 100, 100);
  background(50);
  // stroke(255);

  for (int i = 0; i < num; i++){
    grad2(random(-linel, width-linel/2), linel, random(0, height-thick), thick, floor(random(arr, arr+50)));
  }
}

void grad2(float xpos, float xlen, float ypos, float yheight, int col){
  for (float i=xpos; i<xpos+xlen; i++){
    stroke(col, 100, 100, map(i, xpos, xpos+xlen, 0, 255));
    line(i, ypos, i, ypos+yheight);
  }
}
