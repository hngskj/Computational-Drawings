int step = 50;

void setup(){
  size(800, 800);
  pixelDensity(2);
  smooth();
  background(50);


    // for (int u=0; u < width; u+= 100){
    //     line(u,0,u,height);
    //   for (int v=0; v < height; v+= 100){
    //     line(0,v,width,v);
    //   }
    // }


  drawLine(100, 0);
  drawLine(200, 2);
}


void drawLine(int x, float n){

  stroke(255);
  noFill();

  beginShape();
  curveVertex(x, 0);
  curveVertex(x, 0);
  for (int i=step; i < height; i+= step){
    curveVertex(x+noise(n)*200, i);
    n+= 0.1;
  }
  curveVertex(x, height);
  curveVertex(x, height);
  endShape();
}
