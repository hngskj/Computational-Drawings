//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;

float[] col = new float[4];
color color1, color2, color3, color4;
float w, x, y, z;

void setup(){
  size(700, 700, P2D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  for (int i=0; i<col.length; i++){
    col[i] = random(360);
  }
  w = random(0.5,1);
  x = random(0.5,1);
  y = random(0.5,1);
  z = random(0.5,1);
}

void draw(){
  background(0,0,100);

  col[0]+=w;
  col[1]+=x;
  col[2]+=y;
  col[3]+=z;

  color1 = color(col[0], 100, 100);
  color2 = color(col[1], 100, 100);
  color3 = color(col[2], 100, 100);
  color4 = color(col[3], 100, 100);

  beginShape();
  fill(color1);
  vertex(50,50);
  fill(color2);
  vertex(width-50,50);
  fill(color3);
  vertex(width-50,height-50);
  fill(color4);
  vertex(50,height-50);
  endShape();

  if(col[0] > 360 || col[0] < 0) w *= -1;
  if(col[1] > 360 || col[1] < 0) x *= -1;
  if(col[2] > 360 || col[2] < 0) y *= -1;
  if(col[3] > 360 || col[3] < 0) z *= -1;
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
