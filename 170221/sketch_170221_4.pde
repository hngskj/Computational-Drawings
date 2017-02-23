// Daniel Shiffman - Metaballs

Blob[] blobs = new Blob[5];

void setup(){
  size(700, 700);
  smooth();
    blobs[0] = new Blob(random(width), random(height));
    blobs[1] = new Blob(random(width), random(height));

    float f = 1.0;
    for (int i=2; i < blobs.length; i++){
      blobs[i] = new Blob(lerp(blobs[0].pos.x, blobs[1].pos.x, f/float(blobs.length-1)),
                          lerp(blobs[0].pos.y, blobs[1].pos.y, f/float(blobs.length-1)));
      f = f + 1.0;
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
    vel.mult(random(2, 5));
    r = 400;
  }

  void update(){
    // pos.add(vel);

    if (pos.x > width || pos.x < 0){
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0){
      vel.y *= -1;
    }
  }
}
