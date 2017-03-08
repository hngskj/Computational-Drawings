import java.util.Calendar;
import geomerative.*;

RFont font;
String myText = "alt";
RPoint[] myPoints;
int rs;
int m = millis();
int lineLenght = 10;

void setup() {
  size(700, 700);
  pixelDensity(2);
  background(255);
  noFill();
  rectMode(CENTER);

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  RCommand.setSegmentLength(15);//TRY DIFFERENT VALUES HERE
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  myPoints = myGroup.getPoints();
}

void draw() {
  background(255);
  if(millis()-m > 500){
      rs = floor(random(10000));
      m = millis();
  }
  randomSeed(rs);
  translate(width/2.2, height/1.4);
  beginShape();
  for (int i=0; i<myPoints.length; i++) {
    // ellipse(myPoints[i].x, myPoints[i].y, 5, 5);
    // rect(myPoints[i].x, myPoints[i].y, 5, 5);
    line(myPoints[i].x, myPoints[i].y,
         myPoints[i].x+random(-lineLenght,lineLenght), myPoints[i].y+random(-lineLenght,lineLenght));
  }
  endShape();

}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
