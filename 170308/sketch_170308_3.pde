import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "a";
RPoint[] myPoints;
float[] x, y;
PVector pos1, pos2;
PVector vel1, vel2;

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  strokeWeight(2);

  pos1 = new PVector(100, 100);
  pos2 = new PVector(600, 600);
  vel1 = PVector.random2D();
  vel2 = PVector.random2D();
  vel1.mult(3);
  vel2.mult(3);

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 700, CENTER);

  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();

  x = new float[myPoints.length];
  y = new float[myPoints.length];

  for (int i=0; i<myPoints.length; i++) {
    x[i] = myPoints[i].x;
    y[i] = myPoints[i].y;
  }
}

void draw() {
  background(70);

  pos1.add(vel1);
  pos2.add(vel2);

  float px1 = map(pos1.x, 0, width, -318, 382);
  float py1 = map(pos1.y, 0, height, -500, 200);
  float px2 = map(pos2.x, 0, width, -318, 382);
  float py2 = map(pos2.y, 0, height, -500, 200);

  translate(width/2.2, height/1.4);
  beginShape();
  for (int i=0; i<myPoints.length; i++) {
    switch(i%2){
      case 0 :
        stroke(0, 70);
        line(x[i], y[i], px1, py1);
        break;
      case 1 :
        stroke(255, 70);
        line(x[i], y[i], px2, py2);
        break;
    }
  }
  endShape();

  if(pos1.x < 0 || pos1.x > width) vel1.x *= -1;
  if(pos1.y < 0 || pos1.y > height) vel1.y *= -1;
  if(pos2.x < 0 || pos2.x > width) vel2.x *= -1;
  if(pos2.y < 0 || pos2.y > height) vel2.y *= -1;
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
