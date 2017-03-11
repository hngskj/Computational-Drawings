import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "한";
RPoint[] myPoints;
float[] x, y;
float[] rx, ry;
int r = 0;
int m = millis();

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  // stroke(0, 50);
  strokeWeight(0.7);
  noFill();

  RG.init(this);
  // font = new RFont("hakidame.ttf", 500, CENTER);
  font = new RFont("Spoqa Han Sans Bold_subset.ttf", 600, CENTER);

  RCommand.setSegmentLength(5);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();

  x = new float[myPoints.length];
  y = new float[myPoints.length];
  rx = new float[myPoints.length];
  ry = new float[myPoints.length];

  for (int i=0; i<myPoints.length; i++) {
    x[i] = myPoints[i].x;
    y[i] = myPoints[i].y;
  }
}

void draw() {
  background(0, 0, 100);

  if(millis()-m > 50){
      r ++;
      if(r > myPoints.length-2) r = 0;
      m = millis();
  }

  for (int i=0; i<myPoints.length; i++) {
    rx[i] = x[r];
    ry[i] = y[r];
  }

  translate(width/2.2, height/1.2);
  beginShape();
  for (int i=0; i<myPoints.length-1; i++) {
    stroke(map(i, 0, myPoints.length, 300, 360), 100, 100, 40);
    curveVertex(x[i], y[i]);
    curveVertex(rx[i], ry[i]);
    curveVertex(rx[i+1], ry[i+1]);
    curveVertex(x[i+1], y[i+1]);
  }
  endShape();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
