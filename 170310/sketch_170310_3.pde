import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "g";
RPoint[] myPoints;
float[] x, y;
float[] rx, ry;
int r = 0;
int m = millis();

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  stroke(0, 100);
  strokeWeight(0.7);

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 900, CENTER);

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
  background(255);

  if(millis()-m > 40){
      r ++;
      if(r > myPoints.length-2) r = 0;
      m = millis();
  }

  for (int i=0; i<myPoints.length; i++) {
    rx[i] = x[r];
    ry[i] = y[r];
  }

  translate(width/2.2, height/1.37);
  beginShape();
  for (int i=0; i<myPoints.length-2; i++) {
    line(x[i], y[i], rx[i], ry[i]);
  }
  endShape();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
