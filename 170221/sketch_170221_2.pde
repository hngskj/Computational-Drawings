// Daniel Shiffman - Metaballs

Blob[] blobs = new Blob[5];

void setup(){
  size(700, 700);
  smooth();
  for (int i=0; i < blobs.length; i++){
    blobs[i] = new Blob(random(width), random(height));
  }
}

void draw(){
  background(0);

  loadPixels();
  for (int x=0; x < width; x++){
    for (int y=0; y < height; y++){
      int index = x + y * width;;
      float sum = 0;
      for (Blob b : blobs){
        float d = dist(x, y, b.pos.x, b.pos.y);
        sum += 10 * b.r / d;
      }
      pixels[index] = color(sum);
    }
  }
  updatePixels();

  for (Blob b : blobs){
    b.update();
    // b.show();
  }
}

///////////////////////
///////////////////////
///////////////////////
class Blob{
  PVector pos;
  PVector vel;
  float r;

  Blob(float x, float y){
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(5, 10));
    r = random(400, 800);
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
    // fill(0);
    noFill();
    strokeWeight(4);
    stroke(0);
    // noStroke();
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
