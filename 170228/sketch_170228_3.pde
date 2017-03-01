import java.util.Calendar;

Shape[] shapes = new Shape[10];

void setup(){
  size(700, 700);
  pixelDensity(2);
  stroke(255, 150);
  strokeWeight(0.7);

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new Shape(random(width/5, width/3),
                          ceil(random(100, 150)),
                          random(0.5,2));
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
  float r, n, s, x, y;
  PVector pos = new PVector();
  float a;
  float b;

  Shape(float radius, float npoints, float speed){
    r = radius;
    n = npoints;
    s = speed;
    pos.x = random(r*2/3);
    pos.y = random(r*2/3);
    a = random(0.1, 0.9);
    b = random(0.1, 0.9);
  }

  void update(){
      pushMatrix();
      translate(width*0.5, height*0.5);
      rotate(frameCount / 100.0 * s);
      polygon();
      popMatrix();
    }

  void polygon() {
    float angle = TWO_PI / n;
    for (float a = PI+HALF_PI; a < TWO_PI; a += angle) {
      float sx = pos.x + cos(a) * r;
      float sy = pos.y + sin(a) * r;
      // ellipse(sx, sy, 5, 5);
      line(sx+(noise(a)*20), sy+(noise(b)*20), 0, 0);
    }
    a += 0.033;
    b += 0.039;
  }

}



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
