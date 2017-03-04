//https://jsfiddle.net/bign8/gpkf4dhk/
import java.util.Calendar;
Shape[] shapes = new Shape[1];

void setup(){
  size(700, 700, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  pixelDensity(2);
  noStroke();

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new Shape(width/2, height/2, 200);
  }
}

void draw(){
  background(0,0,100);
  for (Shape s : shapes){
    s.show();
  }
}

class Shape{
  PVector pos;
  float r;
  float a;
  int seg = 400;
  int i;
  color col1, col2;

  Shape(float _x, float _y, float _r){
    pos = new PVector(_x, _y);
    a = random(10);
    r =_r;
    col1 = color(random(360), 100, 100, 100);
    col2 = color(random(360), 100, 100, 100);
  }

  void show(){
    i=0;
    pushMatrix();
    translate(pos.x, pos.y);
    beginShape();
    for (float angle=0; angle<TWO_PI; angle+=TWO_PI/seg){

      float x = cos(angle);
      float y = sin(angle);
      float n = noise(x+1, y+1, a);
      float d = r + map(n, 0, 1, -50, 50);
      // if(i==1){
      //   fill(255,0,0);
      // } else if(i==5){
      //   fill(0,0,255);
      // }
       switch(i){
         case 1 : fill(col1);
         break;
         case 200 : fill(col2);
         break;

       }
      vertex(d*x, d*y);
      i++;
      // println(i);
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
