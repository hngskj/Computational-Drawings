float x, y, a, b, c, d, r, n, m;
float w = 1.0;

void setup(){
  pixelDensity(2);
  size(800, 800);
  background(20);
  
  stroke(255);
}

void draw(){
  background(20);
  
  
  pushMatrix();
  translate(width/2, 0);
  a = (cos(x*9)*sin(x*3)*sin(x*-2))*width/4*noise(x)*2.7;
  b = (cos(-x*7)*sin(x*5)*cos(x*3))*width/4*noise(x)*2.3;
  strokeWeight(noise(n)*2);
  line(a, 0, b, height);
  popMatrix();
  
  translate(0, height/2);
  c = (sin(y*7)*cos(y*7.4)*sin(y*3))*height/4*noise(y)*2.4;
  d = (sin(y*3.7)*cos(-y*11)*cos(y*-7))*height/4*noise(y)*2.9;
  strokeWeight(noise(m+1.7)*100);
  line(0, c, width, d);
  
  x+= 0.0057;
  y+= 0.0061;
  n+= 0.013;
  m+= 0.017;
}