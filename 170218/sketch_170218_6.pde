float x, y, a1, a2, a3, b1, b2, b3, c, d, r, n, m;
float w = 1.0;

void setup(){
  pixelDensity(2);
  size(800, 800, P3D);
  strokeWeight(1);
}

void draw(){
  background(20);

  a1 = (cos(x*9)*sin(x*3)*sin(x*-2))*width/3*noise(x)*1.7;
  b1 = (cos(-x*7)*sin(x*5)*cos(x*3))*width/3*noise(x)*1.3;
  a2 = (-sin(x*3.6)*sin(x*3)/1.3*cos(x*-5))*width/3*noise(x)*3.7;
  b2 = (sin(x*2.7)*-cos(x*5)*-cos(x*-7)*1.7)*width/3*noise(x)*3.8;
  a3 = (sin(-x*7.3)*1.5*cos(x*-3.2)*sin(x*3)/2.1)*width/3*noise(x)*5.9;
  b3 = (cos(x*4.3)*-cos(-x*5)/1.3*-sin(x*3)*1.32)*width/3*noise(x)*5.6;

  c = (sin(y*7)*cos(y*7.4)*sin(y*3))*height/4*noise(y)*10;
  d = (sin(y*3.7)*cos(-y*11)*cos(y*-7))*height/4*noise(y)*10;
  w = noise(m+1.7)*200;
  stroke(255, 200);
  noFill();

  ellipse(width/2, height/2, a1, b1);
  ellipse(width/2, height/2, b1, a1);
  ellipse(width/2, height/2, a2, b2);
  ellipse(width/2, height/2, b2, a2);
  ellipse(width/2, height/2, a3, b3);
  ellipse(width/2, height/2, b3, a3);
  ellipse(width/2, height/2, c, d);
  ellipse(width/2, height/2, d, c);

  x+= 0.0057;
  y+= 0.0021;
  n+= 0.021;
  m+= 0.011;
}
