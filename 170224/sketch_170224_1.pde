import java.util.Calendar;
PImage[] emoji = new PImage[58];

void setup(){
  size(700, 700);
  pixelDensity(2);
  background(0);
  imageMode(CENTER);

  for (int i=0; i<emoji.length; i++){
    emoji[i] = loadImage("Emoji Smiley-"+i+".png");
    emoji[i].resize(100,0);
    image(emoji[i], random(width), random(height));
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
