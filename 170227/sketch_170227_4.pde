import java.util.Calendar;

Dot[] dots = new Dot[5000];
float x, y;

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(0);
  stroke(255, 50);
  strokeWeight(0.5);

  for (int i=0; i<dots.length; i++){
    dots[i] = new Dot(0.7, random(1), random(1), random(0.01, 0.02), random(0.01, 0.02));
    dots[i].check();
  }
}

void draw(){
  // background(0);
  for (Dot d : dots){
    d.show();
  }
}


////////////////////////////////////
////////////////////////////////////
class Dot{
  float a;
  PVector pos = new PVector();
  PVector bound1, bound2;
  float n, m, s1, s2;

  Dot(float _a, float _n, float _m, float _s1, float _s2){
    a = _a;
    n = _n;
    m = _m;
    s1 = _s1;
    s2 = _s2;


    bound1 = new PVector(200, 200);
    bound2 = new PVector(500, 500);
  }

  void check(){
    float r = random(1);
    if(a > r){
      in();
    } else {
      out();
    }
  }

  void in(){
    for (int i=0; i<100; i++){
        float _x = random(width);
        if (_x > bound1.x && _x < bound2.x){
          pos.x = _x;
          break;
        }
    }
    for (int i=0; i<100; i++){
        float _y = random(height);
        if (_y > bound1.y && _y < bound2.y){
          pos.y = _y;
          break;
        }
    }
  }

  void out(){
    pos.x = random(width);
    pos.y = random(height);
  }

  void show(){
    pos.x += noise(n)-0.5*2;
    pos.y += noise(m)-0.5*2;

    point(pos.x, pos.y);


    n += s1;
    m += s2;

    if(pos.x < 0) pos.x = width;
    if(pos.x > width) pos.x = 0;
    if(pos.y < 0) pos.y = height;
    if(pos.y > height) pos.y = 0;
  }
}





void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
