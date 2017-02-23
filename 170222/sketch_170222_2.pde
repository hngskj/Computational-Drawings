Walker[] walker = new Walker[16];

int col = 4;
int row = 4;
float space = 100;

void setup(){
  size(700, 700);
  background(255);

  // walker[0] = new Walker(0, 0);
  // walker[1] = new Walker(0, 1);
  // walker[2] = new Walker(0, 2);
  // walker[3] = new Walker(1, 0);
  // walker[4] = new Walker(1, 1);
  // walker[5] = new Walker(1, 2);
  // walker[6] = new Walker(2, 0);
  // walker[7] = new Walker(2, 1);
  // walker[8] = new Walker(2, 2);


  for (int i=0; i<walker.length; i++){
    walker[i] = new Walker();
  }
  for (Walker w : walker){
    for (int i=0; i<col; i++){
      for (int j=0; j<row; j++){
        w.init(i*space, j*space);
      }
    }

  }
}

void draw(){
  background(255);

  for (Walker w : walker){
    w.walk();
  }
}



class Walker{
  PVector pos;
  PVector vel;
  float x, y;
  float r;

  Walker(){
    pos = new PVector(x, y);
    // vel = PVector.random2D();
    // vel.mult(1);
    r = 10;
  }

  void init(float x, float y){
    pos.x = x;
    pos.y = y;
    noStroke();
    fill(0, 150);
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
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
