import java.util.Calendar;
PImage[] images = new PImage[55];
Emoji[] emojis = new Emoji[55];
int n = 1;

void setup(){
  size(700, 700);
  imageMode(CENTER);

  for (int i=0; i<images.length; i++){
    images[i] = loadImage("Emoji Smiley-"+i+".png");
  }
  for (int i=0; i<emojis.length; i++){
    emojis[i] = new Emoji(i, width/2, height/2);
  }
}

void draw(){
  background(0);
    for(Emoji e : emojis){
      e.show();
      e.move();
      e.check();
    }
}

////////////////////////////////////////////////////
////////////////////////////////////////////////////
class Emoji{

  PVector pos;
  PVector vel;
  int n;

  Emoji(int _n,float _x, float _y){
    n = _n;
    pos = new PVector(_x, _y);
    vel = PVector.random2D();
    vel.mult(random(0.5,6));
  }

  void show(){
    // image(images[floor(random(55))], pos.x, pos.y);
    image(images[n], pos.x, pos.y);
  }

  void move(){
    pos.add(vel);
  }

  void check(){
    // if (pos.x > width || pos.x < 0){ vel.x *= -1; }
    // if (pos.y > height || pos.y < 0){ vel.y *= -1; }
    if (pos.x > width || pos.x < 0){ vel.x *= -1; }
    if (pos.y > height || pos.y < 0){ vel.y *= -1; }
  }
}
void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
