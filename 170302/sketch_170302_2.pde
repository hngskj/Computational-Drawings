import java.util.Calendar;

Shape[] shapes = new Shape[5];

void setup(){
  size(700, 700, P2D);
  pixelDensity(2);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  for (int i=0; i<shapes.length; i++){
    shapes[i] = new Shape();
  }
}

void draw(){
  background(0, 0, 100);
  for (Shape s : shapes){
    s.show();
    s.move();
    s.check();
  }

}

///////////////////////////////////////////
///////////////////////////////////////////
///////////////////////////////////////////
class Shape{
  color colorA, colorB, colorC, colorD;
  PVector posA, posB, posC, posD, posE, posF, posG, posH, posI;
  PVector velA, velB, velC, velD, velE, velF, velG, velH, velI;

  Shape(){
    posA = new PVector(random(width), random(height));
    posB = new PVector(random(width), random(height));
    posC = new PVector(random(width), random(height));
    posD = new PVector(random(width), random(height));
    posE = new PVector(random(width), random(height));
    posF = new PVector(random(width), random(height));
    posG = new PVector(random(width), random(height));
    posH = new PVector(random(width), random(height));
    posI = new PVector(random(width), random(height));

    velA = PVector.random2D();
    velB = PVector.random2D();
    velC = PVector.random2D();
    velD = PVector.random2D();
    velE = PVector.random2D();
    velF = PVector.random2D();
    velG = PVector.random2D();
    velH = PVector.random2D();
    velI = PVector.random2D();

    velA.mult(random(1, 3));
    velB.mult(random(1, 3));
    velC.mult(random(1, 3));
    velD.mult(random(1, 3));
    velE.mult(random(1, 3));
    velF.mult(random(1, 3));
    velG.mult(random(1, 3));
    velH.mult(random(1, 3));
    velI.mult(random(1, 3));

    colorA = color(random(360), 100, 100, 1);
    colorB = color(random(360), 100, 100, 1);
    colorC = color(random(360), 100, 100, 1);
    colorD = color(random(360), 100, 100, 50);
  }

  void show(){
    beginShape();

    fill(colorA);
    vertex(posA.x, posA.y);

    fill(colorB);
    bezierVertex(posB.x, posB.y, posC.x, posC.y, posD.x, posD.y);

    fill(colorC);
    bezierVertex(posE.x, posE.y, posF.x, posF.y, posG.x, posG.y);

    fill(colorD);
    bezierVertex(posH.x, posH.y, posI.x, posI.y, posA.x, posA.y);

    endShape();
  }

  void move(){
    posA.add(velA);
    posB.add(velB);
    posC.add(velC);
    posD.add(velD);
    posE.add(velE);
    posF.add(velF);
    posG.add(velG);
    posH.add(velH);
    posI.add(velI);
  }

  void check(){
    if(posA.x < 0 || posA.x > width){ velA.x *= -1; }
    if(posA.y < 0 || posA.y > height){ velA.y *= -1; }

    if(posB.x < 0 || posB.x > width){ velB.x *= -1; }
    if(posB.y < 0 || posB.y > height){ velB.y *= -1; }

    if(posC.x < 0 || posC.x > width){ velC.x *= -1; }
    if(posC.y < 0 || posC.y > height){ velC.y *= -1; }

    if(posD.x < 0 || posD.x > width){ velD.x *= -1; }
    if(posD.y < 0 || posD.y > height){ velD.y *= -1; }

    if(posE.x < 0 || posE.x > width){ velE.x *= -1; }
    if(posE.y < 0 || posE.y > height){ velE.y *= -1; }

    if(posF.x < 0 || posF.x > width){ velF.x *= -1; }
    if(posF.y < 0 || posF.y > height){ velF.y *= -1; }

    if(posG.x < 0 || posG.x > width){ velG.x *= -1; }
    if(posG.y < 0 || posG.y > height){ velG.y *= -1; }

    if(posH.x < 0 || posH.x > width){ velH.x *= -1; }
    if(posH.y < 0 || posH.y > height){ velH.y *= -1; }

    if(posI.x < 0 || posI.x > width){ velI.x *= -1; }
    if(posI.y < 0 || posI.y > height){ velI.y *= -1; }
  }
}



void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
