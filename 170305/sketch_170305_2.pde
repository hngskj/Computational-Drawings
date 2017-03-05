//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;

float r = 300;

void setup(){
  size(700, 700);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 0);
  noStroke();

  pushMatrix();
  translate(width/2, height/2);
  beginShape(TRIANGLE_FAN);
  vertex(0,0);
  for (float angle=0; angle<TWO_PI; angle+=TWO_PI/50){
    float x = cos(angle);
    float y = sin(angle);
    float col = map(angle, 0, TWO_PI, 0, 360);

    stroke(col, 100, 100, 100);
    fill(col, 100, 100, 100);
    vertex(r*x, r*y);
  }
  vertex(r*cos(TWO_PI), r*sin(TWO_PI));
  endShape(CLOSE);
  popMatrix();
}

void draw(){
  // background(0,0,0);

}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
