import java.util.Calendar;

Shape[] shapes = new Shape[2];

void setup(){
  size(700, 700, P2D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new Shape();
  }
}

void draw(){
  background(0, 0, 100);
  for (Shape s : shapes){
    s.show();
    s.move();
    s.check();
  }

}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
class Shape{
  color colorA, colorB, colorC;
  PVector posA, posB, posC;
  PVector velA, velB, velC;

  Shape(){
    posA = new PVector(random(width), random(height));
    posB = new PVector(random(width), random(height));
    posC = new PVector(random(width), random(height));

    velA = PVector.random2D();
    velB = PVector.random2D();
    velC = PVector.random2D();

    velA.mult(random(1, 5));
    velB.mult(random(1, 5));
    velC.mult(random(1, 5));

    colorA = color(random(360), 100, 100);
    colorB = color(random(360), 100, 100);
    colorC = color(random(360), 100, 100);
  }

  void show(){
    beginShape(TRIANGLES);

    fill(colorA);
    vertex(posA.x, posA.y);

    fill(colorB);
    vertex(posB.x, posB.y);

    fill(colorC);
    vertex(posC.x, posC.y);

    endShape();
  }

  void move(){
    posA.add(velA);
    posB.add(velB);
    posC.add(velC);
  }

  void check(){
    if(posA.x < 0 || posA.x > width){ velA.x *= -1; }
    if(posA.y < 0 || posA.y > height){ velA.y *= -1; }

    if(posB.x < 0 || posB.x > width){ velB.x *= -1; }
    if(posB.y < 0 || posB.y > height){ velB.y *= -1; }

    if(posC.x < 0 || posC.x > width){ velC.x *= -1; }
    if(posC.y < 0 || posC.y > height){ velC.y *= -1; }
  }
}



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
