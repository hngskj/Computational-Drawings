import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "S";
RPoint[] myPoints;
float a,b;

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  noFill();

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 700, CENTER);

  RCommand.setSegmentLength(10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();
}

void draw() {
  background(255);

  translate(width/2.2, height/1.2);

  float addToAngle = map(cos(b), -1,1, -TWO_PI,TWO_PI);
  float curveHeight = map(sin(a), -1,1, 0,3);

  for (int i = 0; i < myPoints.length-1; i++ ) {
    float d = dist(myPoints[i].x, myPoints[i].y, myPoints[i+1].x, myPoints[i+1].y);
    // create a gap between each letter
    if (d > 20) continue;
    // alternate in every step from -1 to 1
    float stepper = map(i%2,0,1,-1,1);
    float angle = atan2(myPoints[i+1].y-myPoints[i].y, myPoints[i+1].x-myPoints[i].x);
    angle = angle + addToAngle;

    float cx = myPoints[i].x + cos(angle*stepper) * d*4 * curveHeight;
    float cy = myPoints[i].y + sin(angle*stepper) * d*3 * curveHeight;

    bezier(myPoints[i].x,myPoints[i].y,  cx,cy, cx,cy,  myPoints[i+1].x,myPoints[i+1].y);
  }

  a += 0.02;
  b += 0.01;
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
