import java.util.Calendar;
CustomShape[] shapes = new CustomShape[10];

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(0);

  // fill(255, 5);
  noFill();
  stroke(255, 5);
  strokeWeight(0.5);
  // noStroke();

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new CustomShape(random(width), random(height),
                                random(width), random(height),
                                random(width), random(height),
                                random(width), random(height),
                                random(width), random(height),
                                random(width), random(height));
  }
}

void draw(){
  // background(0);
  for(CustomShape s : shapes){
    s.show();
    s.update();
  }
}


class CustomShape{
  PVector pos1, pos2, pos3, pos4, pos5, pos6;
  PVector vel1, vel2, vel3, vel4, vel5, vel6;

  CustomShape(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float x5, float y5, float x6, float y6){
    pos1 = new PVector(x1, y1);
    pos2 = new PVector(x2, y2);
    pos3 = new PVector(x3, y3);
    pos4 = new PVector(x4, y4);
    pos5 = new PVector(x5, y5);
    pos6 = new PVector(x6, y6);

    vel1 = PVector.random2D();
    vel2 = PVector.random2D();
    vel3 = PVector.random2D();
    vel4 = PVector.random2D();
    vel5 = PVector.random2D();
    vel6 = PVector.random2D();

    vel1.mult(random(0.1,1));
    vel2.mult(random(0.1,1));
    vel3.mult(random(0.1,1));
    vel4.mult(random(0.1,1));
    vel5.mult(random(0.1,1));
    vel6.mult(random(0.1,1));
  }

  void show(){
    // line(pos1.x, pos1.y, pos2.x, pos2.y);
    // line(pos2.x, pos2.y, pos3.x, pos3.y);
    // line(pos3.x, pos3.y, pos4.x, pos4.y);
    // line(pos4.x, pos4.y, pos1.x, pos1.y);

    // curve(pos1.x,pos1.y, pos2.x,pos2.y, pos3.x,pos3.y, pos4.x,pos4.y);
    // bezier(pos1.x,pos1.y, pos2.x,pos2.y, pos3.x,pos3.y, pos4.x,pos4.y);
    beginShape();
    vertex(pos1.x, pos1.y);
    bezierVertex(pos2.x, pos2.y, pos3.x, pos3.y, pos4.x, pos4.y);
    bezierVertex(pos3.x, pos3.y, pos4.x, pos4.y, pos1.x, pos1.y);
    endShape();
    // quad(pos1.x,pos1.y, pos2.x,pos2.y, pos3.x,pos3.y, pos4.x,pos4.y);

    // fill(255, 100);
    // beginShape(TRIANGLE_STRIP);
    // vertex(pos1.x, pos1.y);
    // vertex(pos2.x, pos2.y);
    // vertex(pos3.x, pos3.y);
    // vertex(pos4.x, pos4.y);
    // vertex(pos5.x, pos5.y);
    // vertex(pos6.x, pos6.y);
    // endShape();
  }


  void update(){
    pos1.add(vel1);
    pos2.add(vel2);
    pos3.add(vel3);
    pos4.add(vel4);
    pos5.add(vel5);
    pos6.add(vel6);

    if (pos1.x > width || pos1.x < 0){ vel1.x *= -1; }
    if (pos1.y > height || pos1.y < 0){ vel1.y *= -1; }

    if (pos2.x > width || pos2.x < 0){ vel2.x *= -1; }
    if (pos2.y > height || pos2.y < 0){ vel2.y *= -1; }

    if (pos3.x > width || pos3.x < 0){ vel3.x *= -1; }
    if (pos3.y > height || pos3.y < 0){ vel3.y *= -1; }

    if (pos4.x > width || pos4.x < 0){ vel4.x *= -1; }
    if (pos4.y > height || pos4.y < 0){ vel4.y *= -1; }

    if (pos5.x > width || pos5.x < 0){ vel5.x *= -1; }
    if (pos5.y > height || pos5.y < 0){ vel5.y *= -1; }

    if (pos6.x > width || pos6.x < 0){ vel6.x *= -1; }
    if (pos6.y > height || pos6.y < 0){ vel6.y *= -1; }
  }
}
void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
