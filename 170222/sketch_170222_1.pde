Walker w1;

void setup(){
  size(700, 700);
  background(255);

  w1 = new Walker(200, 200);
}

void draw(){
  background(255);
  w1.show();
  w1.walk();
}



class Walker{
  PVector pos;
  PVector vel;
  float r;

  Walker(float x, float y){
    pos = new PVector(x, y);
    // vel = PVector.random2D();
    // vel.mult(1);
    r = 10;
  }

  void show(){
    noStroke();
    fill(0, 150);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void walk(){
    int choice = int(random(4));

    switch(choice){
      case 0: pos.x ++;
      break;
      case 1: pos.x --;
      break;
      case 2: pos.y ++;
      break;
      case 3: pos.y --;
      break;
    }
  }
}
