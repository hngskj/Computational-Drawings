int step = 20;
float lineSpace = 0.5;
float more =1;

void setup(){
  size(700, 700);
  pixelDensity(2);
  smooth();
  background(50);
  strokeWeight(0.5);
  stroke(255);
  noFill();

  for (float i = 0; i < width; i+=lineSpace){
    drawVerticalLine(i+more, i/1000+random(-0.2,0.2), i+random(2));
    drawHorizontalLine(i+more, i/1000+random(-0.2,0.2), i+random(2));
    more*=1.1;
  }
}

void drawVerticalLine(float pos, float noise, float wave){
  beginShape();
  curveVertex(pos, 0);
  curveVertex(pos, 0);
  for (int i=step; i < height; i+= step){
    curveVertex(pos + noise(noise) * wave, i);
    noise+= 1;
  }
  curveVertex(pos, height);
  curveVertex(pos, height);
  endShape();
}

void drawHorizontalLine(float pos, float noise, float wave){
  beginShape();
  curveVertex(0, pos);
  curveVertex(0, pos);
  for (int i=step; i < width; i+= step){
    curveVertex(i, pos + noise(noise) * wave);
    noise+= 1;
  }
  curveVertex(width, pos);
  curveVertex(width, pos);
  endShape();
}
