import java.util.Calendar;

float xmag, ymag = 0;
float newXmag, newYmag = 0;
int[] rc = new int[24];

void setup() {
  size(700, 700, P3D);
  pixelDensity(2);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  for (int i=0; i < rc.length; i++){
    rc[i] = floor(random(360));
  }
}

void draw() {
  background(0,0,10);
  pushMatrix();
  translate(width/2, height/2, -30);

  rotateX(frameCount/100.0);
  rotateY(frameCount/100.0);

  scale(110);
  beginShape(QUADS);
  fill(rc[0], 100, 100); vertex(-1,  1,  1);
  fill(rc[1], 100, 100); vertex( 1,  1,  1);
  fill(rc[2], 100, 100); vertex( 1, -1,  1);
  fill(rc[3], 100, 100); vertex(-1, -1,  1);

  fill(rc[4], 100, 100); vertex( 1,  1,  1);
  fill(rc[5], 100, 100); vertex( 1,  1, -1);
  fill(rc[6], 100, 100); vertex( 1, -1, -1);
  fill(rc[7], 100, 100); vertex( 1, -1,  1);

  fill(rc[8], 100, 100); vertex( 1,  1, -1);
  fill(rc[9], 100, 100); vertex(-1,  1, -1);
  fill(rc[10], 100, 100); vertex(-1, -1, -1);
  fill(rc[11], 100, 100); vertex( 1, -1, -1);

  fill(rc[12], 100, 100); vertex(-1,  1, -1);
  fill(rc[13], 100, 100); vertex(-1,  1,  1);
  fill(rc[14], 100, 100); vertex(-1, -1,  1);
  fill(rc[15], 100, 100); vertex(-1, -1, -1);

  fill(rc[16], 100, 100); vertex(-1,  1, -1);
  fill(rc[17], 100, 100); vertex( 1,  1, -1);
  fill(rc[18], 100, 100); vertex( 1,  1,  1);
  fill(rc[19], 100, 100); vertex(-1,  1,  1);

  fill(rc[20], 100, 100); vertex(-1, -1, -1);
  fill(rc[21], 100, 100); vertex( 1, -1, -1);
  fill(rc[22], 100, 100); vertex( 1, -1,  1);
  fill(rc[23], 100, 100); vertex(-1, -1,  1);
  endShape();

  popMatrix();

}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
