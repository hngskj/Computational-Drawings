int step = 50;
float lineSpace = 5;

void setup(){
  size(800, 800);
  pixelDensity(2);
  smooth();
  background(50);
  strokeWeight(0.5);
  stroke(255);
  noFill();

  for (int i = 1; i < width; i+=lineSpace){
    drawLine(i, i/1000, i/2);
  }
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
