float llength = 300;

void setup(){
  size(700, 700);
  background(255);

  // for (int i=0; i<500; i++){
  //   stroke(0, random(255));
  //   point(200,i);
  // }
  drawLine();
}

void draw(){

}

void drawLine(){
  for (int i=0; i<llength; i++){
    stroke(0, random(255));
    point(200,i);
  }
}
