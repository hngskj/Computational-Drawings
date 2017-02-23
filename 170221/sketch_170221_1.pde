// Daniel Shiffman - Metaballs
Blob b;

void setup(){
  size(700, 700);
  smooth();
  b = new Blob(100, 100);
}

void draw(){
  background(0);

  loadPixels();
  for (int x=0; x < width; x++){
    for (int y=0; y < height; y++){
      int index = x + y * width;;
      float d = dist(x, y, b.pos.x, b.pos.y);
      float col = 300 * b.r / d;
      pixels[index] = color(col);
    }
  }
  updatePixels();

  b.update();
  b.show();
}
///////////////////////
///////////////////////
class Blob{
  PVector pos;
  PVector vel;
  float r;

  Blob(float x, float y){
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 5));
    r = 40;
  }

  void update(){
    pos.add(vel);

    if (pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }

  void show(){
    noFill();
    strokeWeight(4);
    stroke(0);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
