import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "X";
String myText2 = "y";
RPoint[] myPoints;
RPoint[] myPoints2;
float[] x, y, rx, ry;
float[] x2, y2, rx2, ry2;
int rs = 0;
int m = millis();

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  strokeWeight(3);
  stroke(0, 100);

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  RGroup myGroup2 = font.toGroup(myText2);
  myPoints = myGroup.getPoints();
  myPoints2 = myGroup2.getPoints();

  x = new float[myPoints.length];
  y = new float[myPoints.length];
  rx = new float[myPoints.length];
  ry = new float[myPoints.length];

  x2 = new float[myPoints2.length];
  y2 = new float[myPoints2.length];
  rx2 = new float[myPoints2.length];
  ry2 = new float[myPoints2.length];

  for (int i=0; i<myPoints.length; i++) {
    x[i] = myPoints[i].x;
    y[i] = myPoints[i].y;
  }
  for (int i=0; i<myPoints2.length; i++) {
    x2[i] = myPoints2[i].x;
    y2[i] = myPoints2[i].y;
  }

}

void draw() {
  background(255);

  if(millis()-m > 1000){
      rs = floor(random(10000));
      m = millis();
  }
  randomSeed(rs);
  for (int i=0; i<myPoints.length; i++) {
    int r = int(random(myPoints.length));
    // int r1 = 1;
    // int r2 = 1;
    rx[i] = x[r];
    ry[i] = y[r];
  }
  for (int i=0; i<myPoints2.length; i++) {
    int r = int(random(myPoints2.length));
    // int r1 = 1;
    // int r2 = 1;
    rx2[i] = x2[r];
    ry2[i] = y2[r];
  }
  pushMatrix();
  translate(width/3.1, height/1.3);
  beginShape();
  for (int i=0; i<myPoints.length; i++) {
    line(x[i], y[i], rx[i], ry[i]);
  }
  endShape();
  popMatrix();


  pushMatrix();
  translate(width/1.4, height/1.3);
  beginShape();
  for (int i=0; i<myPoints2.length; i++) {
    line(x2[i], y2[i], rx2[i], ry2[i]);
  }
  endShape();
  popMatrix();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
