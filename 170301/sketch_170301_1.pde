import java.util.Calendar;

color colorA, colorB, colorC;
PVector posA, posB, posC;

void setup(){
  size(700, 700, P2D);
  pixelDensity(2);
  background(255);
  noStroke();

  posA = new PVector(50, 50);
  posB = new PVector(600, 100);
  posC = new PVector(300, 650);

  colorA = color(200, 0, 100);
  colorB = color(100, 0, 200);
  colorC = color(0, 200, 100);

  // translate(width/2, height/2);
  beginShape(TRIANGLES);

  fill(colorA);
  vertex(posA.x, posA.y);

  fill(colorB);
  vertex(posB.x, posB.y);

  fill(colorC);
  vertex(posC.x, posC.y);

  endShape();
}

void draw(){

}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////




void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
