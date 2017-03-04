//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;
Shape[] shapes = new Shape[3];

void setup(){
  size(700, 700, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(2);
  noStroke();

  shapes[0] = new Shape(width/2, height/2, 300, 50);
  shapes[1] = new Shape(width/2, height/2, 200, 30);
  shapes[2] = new Shape(width/2, height/2, 100, 10);
}

void draw(){
  background(0,0,100);
  for (Shape s : shapes){
    s.show();
    s.move();
  }
}

class Shape{
  PVector pos;
  PVector vel;
  float r, a, f;
  int seg = 300;
  int i;
  color col1, col2;

  Shape(float _x, float _y, float _r, float _f){
    pos = new PVector(_x, _y);
    vel = PVector.random2D();
    vel.mult(random(0.5, 2));
    a = random(100);
    r = _r;
    f = _f;
    col1 = color(random(360), 100, 100, 100);
    col2 = color(random(360), 100, 100, 100);
  }

  void show(){
    i=0;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(frameCount/100.0 * 1);
    beginShape();
    for (float angle=0; angle<TWO_PI; angle+=TWO_PI/seg){
      float x = cos(angle);
      float y = sin(angle);
      float n = noise(x+1, y+1, a);
      float d = r + map(n, 0, 1, -1*f, f);

       switch(i){
         case 0 : fill(col1);
         break;
         case 150 : fill(col2);
         break;
       }
      vertex(d*x, d*y);
      i++;
    }
    endShape();
    popMatrix();
    a += 0.01;
  }

  void move(){
    pos.add(vel);

    if(pos.x-r < 0 || pos.x+r > width) vel.x *= -1;
    if(pos.y-r < 0 || pos.y+r > height) vel.y *= -1;
  }
}



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
