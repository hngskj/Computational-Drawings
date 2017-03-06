//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;


float[] r = new float[4];
float[] g = new float[4];
float[] b = new float[4];
color color1, color2, color3, color4;
float w, x, y, z;

void setup(){
  size(700, 700, P2D);
  pixelDensity(2);

  for (int i=0; i<r.length; i++){
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
  }


}

void draw(){
  color1 = color(r[0]+w, g[0]+w, b[0]+w);
  color2 = color(r[1]+x, g[1]+x, b[1]+x);
  color3 = color(r[2]+y, g[2]+y, b[2]+y);
  color4 = color(r[3]+z, g[3]+z, b[3]+z);

  background(0);

  beginShape();
  fill(color1);
  vertex(0,0);
  fill(color2);
  vertex(width,0);
  fill(color3);
  vertex(width,height);
  fill(color4);
  vertex(0,height);
  endShape();

}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
