import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "alt";
RPoint[] myPoints;

void setup() {
  size(700, 700);
  pixelDensity(2);
  background(255);
  stroke(0, 100);


  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  RCommand.setSegmentLength(15);//TRY DIFFERENT VALUES HERE
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();

  translate(width/2.2, height/1.4);
      beginShape();
      for (int i=0; i<myPoints.length; i++) {
        line(myPoints[i].x, myPoints[i].y, -318, -500);
        line(myPoints[i].x, myPoints[i].y, -318, 200);
        line(myPoints[i].x, myPoints[i].y, 382, 200);
        line(myPoints[i].x, myPoints[i].y, 382, -500);
      }
      endShape();
}

void draw() {
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
