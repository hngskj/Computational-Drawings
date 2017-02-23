Sand[] sands = new Sand[5];
float a, b, c, d;

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(250);

  for (int i=0; i<sands.length; i++){
    a = random(width);
    b = random(height);
    c = random(width);
    d = random(height);
    sands[i] = new Sand(a, b, c, d);
  }
}

void draw(){
  for(Sand s : sands){
    s.show();
    s.update();
    s.between();
    s.edge();
  }
}


//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
class Sand{
  PVector pos1;
  PVector pos2;
  PVector vel1;
  PVector vel2;
  float slength;
  float n1 = 1.1;
  float n2 = 2.3;
  float m1, m2;

  Sand(float x1, float y1, float x2, float y2){
    pos1 = new PVector(x1, y1);
    pos2 = new PVector(x2, y2);

    vel1 = PVector.random2D();
    vel2 = PVector.random2D();

    vel1.mult(random(-0.5, 0.5));
    vel2.mult(random(-0.5, 0.5));
  }

  void show(){
    point(pos1.x, pos1.y);
    point(pos2.x, pos2.y);
  }

  void update(){
    vel1.add((sin(n1)-0.5)/100, (sin(n1)-0.5)/100);
    vel2.add((sin(n2)-0.5)/100, (sin(n2)-0.5)/100);

    vel1.add(m1, m1);
    vel2.add(m2, m2);

    pos1.add(vel1);
    pos2.add(vel2);

    n1 += 0.001;
    n2 += 0.001;
    // n1++;
    // n2++;
  }

  void between(){
    slength = dist(pos1.x, pos1.y, pos2.x, pos2.y);
    for (int i=0; i<slength; i++){
      stroke(random(0, 80), 20);
      point(lerp(pos1.x, pos2.x, i/slength), lerp(pos1.y, pos2.y, i/slength));
    }
  }

  void edge(){
    if (pos1.x > width || pos1.x < 0){ vel1.x *= -1; }
    if (pos1.y > height || pos1.y < 0){ vel1.y *= -1; }

    if (pos2.x > width || pos2.x < 0){ vel2.x *= -1; }
    if (pos2.y > height || pos2.y < 0){ vel2.y *= -1; }
  }
}
