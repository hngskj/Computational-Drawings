import java.util.Calendar;
int actRandomSeed = 0;
int count = 500;
float s = 1.5;
// float s = -0.5;
float randomX, randomY;
float circleX, circleY;
float x, y;

void setup() {
  size(700, 700);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  noStroke();
  // fill(0, 10);
}

void draw() {
  background(0, 0, 100);

  float faderX = (sin(s)+1)/2;

  randomSeed(actRandomSeed);
  float angle = radians(360/float(count));

  for (int i=0; i<count; i++){
    randomX = random(0,width);
    randomY = random(0,height);
    circleX = width/2 + cos(angle*i)*20;
    circleY = height/2 + sin(angle*i)*20;

    x = lerp(randomX,circleX, faderX);
    y = lerp(randomY,circleY, faderX);

    fill(random(270,330), 100, 100, 10);
    rect(x, y, random(10, 100), random(10, 100));
  }
  s += 0.01;
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
