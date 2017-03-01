import java.util.Calendar;

Shape[] shapes = new Shape[5];

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();

  for (int i=0; i<shapes.length; i++){
    // radius, npoints, speed
    shapes[i] = new Shape(random(width/4, width*2/3),
                          ceil(random(10, 50)),
                          random(0.1,2));
  }
}

void draw(){
  background(0);
  for (Shape s : shapes){
    s.update();
  }
}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////

class Shape{
  float r, n, s;

  Shape(float radius, float npoints, float speed){
    r = radius;
    n = npoints;
    s = speed;
  }

  void update(){
      pushMatrix();
      translate(width*0.5, height*0.5);
      rotate(frameCount / 100.0 * s);
      polygon(0, 0);  // Icosahedron
      popMatrix();
    }

  void polygon(float x, float y) {
    float angle = TWO_PI / n;
    // beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      float sx = x + cos(a) * r;
      float sy = y + sin(a) * r;
      // vertex(sx, sy);
      line(sx, sy, 0, 0);
    }
    // endShape(CLOSE);
  }
}



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
