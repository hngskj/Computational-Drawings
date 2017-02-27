import java.util.Calendar;
CustomShape[] shapes = new CustomShape[1];

void setup(){
  size(700, 700);
  background(0);
  stroke(255);
  strokeWeight(10);

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new CustomShape(random(width), random(height),
                                random(width), random(height),
                                random(width), random(height),
                                random(width), random(height));
  }

  // for (int i=0; i<count; i++){
  //   line(100, 100+i*spaceing, 100+llength, 200+i*spaceing);
  //   point(100, 100+i*spaceing);
  //   point(100+llength, 200+i*spaceing);
  // }
}

void draw(){
  background(0);
  for(CustomShape s : shapes){
    s.show();
    s.update();
  }
}


class CustomShape{
  PVector pos1, pos2, pos3, pos4;
  PVector vel1, vel2, vel3, vel4;

  int count = 10;
  float spaceing = 10;
  float llength = 100;
  float x, y;
  float speed = 1.0;

  CustomShape(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4){
    pos1 = new PVector(x1, y1);
    pos2 = new PVector(x2, y2);
    pos3 = new PVector(x3, y3);
    pos4 = new PVector(x4, y4);

    vel1 = PVector.random2D();
    vel2 = PVector.random2D();
    vel3 = PVector.random2D();
    vel4 = PVector.random2D();

    vel1.mult(random(1,4));
    vel2.mult(random(1,4));
    vel3.mult(random(1,4));
    vel4.mult(random(1,4));
  }

  void show(){
    // point(pos1.x, pos1.y);
    // point(pos2.x, pos2.y);
    // point(pos3.x, pos3.y);
    // point(pos4.x, pos4.y);
    line(pos1.x, pos1.y, pos2.x, pos2.y);
    line(pos3.x, pos3.y, pos4.x, pos4.y);
  }

  void update(){
    pos1.add(vel1);
    pos2.add(vel2);
    pos3.add(vel3);
    pos4.add(vel4);

    if (pos1.x > width || pos1.x < 0){ vel1.x *= -1; }
    if (pos1.y > height || pos1.y < 0){ vel1.y *= -1; }

    if (pos2.x > width || pos2.x < 0){ vel2.x *= -1; }
    if (pos2.y > height || pos2.y < 0){ vel2.y *= -1; }

    if (pos3.x > width || pos3.x < 0){ vel3.x *= -1; }
    if (pos3.y > height || pos3.y < 0){ vel3.y *= -1; }

    if (pos4.x > width || pos4.x < 0){ vel4.x *= -1; }
    if (pos4.y > height || pos4.y < 0){ vel4.y *= -1; }
  }
}
void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
