Sand s1;

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(250);

  s1 = new Sand(100, 100, 600, 600);
}

void draw(){
  s1.show();
  s1.update();
  s1.between();
}


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
class Sand{
  PVector pos1;
  PVector pos2;
  float slength;

  // Sand(float a, float b, float c, float d){
  Sand(float x1, float y1, float x2, float y2){
    pos1 = new PVector(x1, y1);
    pos2 = new PVector(x2, y2);
  }

  void show(){
    point(pos1.x, pos1.y);
    point(pos2.x, pos2.y);
  }

  void between(){
    slength = dist(pos1.x, pos1.y, pos2.x, pos2.y);

    for (int i=0; i<slength; i++){
      stroke(random(0, 130), 50);
      point(lerp(pos1.x, pos2.x, i/slength), lerp(pos1.y, pos2.y, i/slength));
    }
  }

  void update(){
    int choice1 = int(random(4));
    switch(choice1){
      case 0: pos1.x ++;
      break;
      case 1: pos1.x --;
      break;
      case 2: pos1.y ++;
      break;
      case 3: pos1.y --;
      break;
    }
    // int choice2 = int(random(4));
    // switch(choice2){
    //   case 0: pos2.x ++;
    //   break;
    //   case 1: pos2.x --;
    //   break;
    //   case 2: pos2.y ++;
    //   break;
    //   case 3: pos2.y --;
    //   break;
    // }

    pos2.x = mouseX;
    pos2.y = mouseY;
  }

}
