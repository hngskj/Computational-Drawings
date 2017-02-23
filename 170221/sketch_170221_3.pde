
PVector pos1;
PVector pos2;

void setup(){
  size(700, 700);
  smooth();

  pos1 = new PVector(100, 100);
  pos2 = new PVector(600, 600);
}

void draw(){
  background(0, 0, 255);

  loadPixels();
  for (int x=0; x<width; x++){
    for (int y=0; y<height; y++){
      int index = x + y * width;

      float d1 = dist(x, y, pos1.x, pos1.y);
      float d2 = dist(x, y, pos2.x, pos2.y);

      // float d = dist(x, y, mouseX, mouseY);
      // float col = map(d, 0, width/4, 255, 0);
      float col1 =  map(d1, 0, width/4, 255, 0);
      float col2 =  map(d2, 0, width/4, 255, 0);


      //fucking errors
      pixels[index] = color(col1);
      pixels[index] = color(col2);
    }
  }
  updatePixels();
}
