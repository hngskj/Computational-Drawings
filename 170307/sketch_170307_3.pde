import java.util.Calendar;
// http://www.ricardmarxer.com/geomerative/documentation/geomerative/RCommand.html
//
// Use this to set the segmentator type.
//
// ADAPTATIVE segmentator minimizes the number of segments avoiding perceptual
// artifacts like angles or cusps. Use this in order to have Polygons and Meshes
// with the fewest possible vertices. This can be useful when using or drawing a
// lot the same Polygon or Mesh deriving from this Shape.
//
// UNIFORMLENGTH segmentator is the slowest segmentator and it segments the curve
// on segments of equal length. This can be useful for very specific applications
// when for example drawing incrementaly a shape with a uniform speed.
//
// UNIFORMSTEP segmentator is the fastest segmentator and it segments the curve
// based on a constant value of the step of the curve parameter, or on the number
// of segments wanted. This can be useful when segmpointsentating very often a
// Shape or when we know the amount of segments necessary for our specific application.
import geomerative.*;

RFont font;
String myText = "alt";

void setup() {
  size(700, 700, P2D);
  pixelDensity(2);
  background(255);
  noStroke();

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  RCommand.setSegmentLength(50);//TRY DIFFERENT VALUES HERE
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  // RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  RPoint[] myPoints = myGroup.getPoints();

  translate(width/2.2, height/1.4);
  beginShape();
  for (int i=0; i<myPoints.length; i++) {
    if(i%4 == 0){
      fill(245, 235, 201);
    } else if (i%4 == 1) {
      fill(191, 213, 232);
    } else if (i%4 == 2) {
      fill(204, 236, 239);
    } else {
      fill(253, 222, 238);
    }
    vertex(myPoints[i].x, myPoints[i].y);
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
