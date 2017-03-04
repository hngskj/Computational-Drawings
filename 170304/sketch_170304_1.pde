//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;
Shape[] shapes = new Shape[1];

void setup(){
  size(700, 700);
  pixelDensity(2);

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new Shape(width/2, height/2, 200);
  }
}

void draw(){
  background(255);
  for (Shape s : shapes){
    s.show();
  }
}

class Shape{
  PVector pos;
  float r;
  float a;

  Shape(float _x, float _y, float _r){
    pos = new PVector(_x, _y);
    a = random(10);
    r =_r;
  }

  void show(){
    pushMatrix();
    translate(pos.x, pos.y);
    beginShape();
    for (float angle=0; angle<TWO_PI; angle+=PI/100){
      float x = cos(angle);
      float y = sin(angle);
      float n = noise(x+1, y+1, a);
      float d = r + map(n, 0, 1, -25, 25);
      fill(0);
      vertex(d*x, d*y);
    }
    endShape();
    popMatrix();
    a += 0.01;
  }
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
