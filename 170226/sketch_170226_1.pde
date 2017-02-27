import java.util.Calendar;
int actRandomSeed = 0;
int count = 100;

void setup() {
  size(700, 700);
  cursor(CROSS);
  smooth();
}

void draw() {
  background(255);
  noStroke();

  float faderX = (float)mouseX/width;

  randomSeed(actRandomSeed);
  float angle = radians(360/float(count));
  for (int i=0; i<count; i++){
    // positions
    float randomX = random(0,width);
    float randomY = random(0,height);
    float circleX = width/2 + cos(angle*i)*300;
    float circleY = height/2 + sin(angle*i)*300;

    float x = lerp(randomX,circleX, faderX);
    float y = lerp(randomY,circleY, faderX);

    fill(0);
    ellipse(x,y,11,11);
  }
}

void mouseReleased() {
  actRandomSeed = (int) random(100000);
}
void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
