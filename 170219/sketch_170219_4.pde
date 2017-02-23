int step = 50;
float lineSpace = 5;
float move = 0;

void setup(){
  size(800, 800);
  pixelDensity(2);
  smooth();
  stroke(255);
  noFill();
}

void draw(){
  background(50);

  // for (int i = 1; i < width; i+=lineSpace){
  //   drawLine(i, i/1000, i/2);
  // }

  // drawLine(100, 0.1, noise(move)*100);
  // drawLine(200, 0.2, noise(move)*200);

  for (int i = 0; i < width; i+= lineSpace){
      // drawLine(i, i/1000, noise(move)*100);
      drawLine(i, i/1000, move);
  }

  move+=0.03;
}

void drawLine(int xpos, float noise, float wave){
  beginShape();
  curveVertex(xpos, 0);
  curveVertex(xpos, 0);
  for (int i=step; i < height; i+= step){
    curveVertex(xpos + noise(noise) * wave, i);
    // curveVertex(xpos + noise(noise) * wave, i + noise(noise)*100);
    noise+= 1;
  }
  curveVertex(xpos, height);
  curveVertex(xpos, height);
  endShape();
}
