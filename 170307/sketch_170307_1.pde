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
  size(700, 700);
  pixelDensity(2);
  background(255);

  RG.init(this);
  font = new RFont("System San Francisco Display Regular.ttf", 500, CENTER);

  stroke(0);
  noFill();
  translate(width/2.2, height/1.4);

  RCommand.setSegmentLength(20);//TRY DIFFERENT VALUES HERE
  // RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  // RCommand.setSegmentator(RCommand.ADAPTATIVE);

  RGroup myGroup = font.toGroup(myText);
  RPoint[] myPoints = myGroup.getPoints();

  //HERE WE DRAW LINES USING VERTEX.

  beginShape();
  //TRY ADDING DIFFERENT MODES HERE LIKE LINES OR TRIANGLES.
  // beginShape(QUAD_STRIP);//THIS CHANGES DRAMATICALLY THE FORM.
  // beginShape(TRIANGLE_STRIP);
  for (int i=0; i<myPoints.length; i++) {
    vertex(myPoints[i].x, myPoints[i].y);
    ellipse(myPoints[i].x, myPoints[i].y, 5, 5);
    //TRY CURVEVERTEX TOO BUT CHOOSE POLYGON MODE IN BEGINSHAPE()
    // curveVertex(myPoints[i].x, myPoints[i].y);
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
