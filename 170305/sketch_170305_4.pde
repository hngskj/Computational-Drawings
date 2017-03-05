//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;

float r = 300;
float a;
float _x, _y;

void setup(){
  size(700, 700);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);

  a = random(100);
}

void draw(){
  background(0,0,100);

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount/100.0 * 0.5);
  beginShape(TRIANGLE_FAN);
  vertex(0,0);
  for (float angle=0; angle<TWO_PI; angle+=TWO_PI/40){
    float x = cos(angle);
    float y = sin(angle);
    float n = noise(x+1, y+1, a);
    float d = r + map(n, 0, 1, -50, 50);
    float col = map(angle, 0, TWO_PI, 0, 360);

    stroke(col, 100, 100, 100);
    fill(col, 100, 100, 100);
    if(angle == 0){
      _x = d*x;
      _y = d*y;
    }
    vertex(d*x, d*y);
  }
  vertex(_x, _y);
  endShape();
  popMatrix();

  a += 0.01;
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
