import java.util.Calendar;

int number = 1000;
float x, y;

void setup(){
  size(700, 700);
  background(0);
  stroke(255);
  strokeWeight(5);

  for (int i=0; i<number; i++){

    int r1 = floor(random(10));
    if(r1 > 2){
      x = random(200, 500);
    } else {
      x = random(700);
    }

    int r2 = floor(random(10));
    if(r2 > 2){
      y = random(200, 500);
    } else {
      y = random(700);
    }

    point(x, y);
  }

}

void draw(){

}






void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
