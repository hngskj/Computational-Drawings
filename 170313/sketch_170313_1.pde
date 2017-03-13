import java.util.Calendar;
//
// https://github.com/wblut/HE_Mesh
// http://www.wblut.com
// HE_Mesh Examples > geom > create > Ref_WB_Mesh
//
import wblut.core.*;
import wblut.geom.*;
import wblut.hemesh.*;
import wblut.math.*;
import wblut.nurbs.*;
import wblut.processing.*;

WB_Render3D render;
WB_Mesh mesh1, mesh2, mesh3, mesh4;

void setup() {
  size(700, 700, P3D);
  pixelDensity(2);
  noFill();
  stroke(255, 200);
  strokeWeight(0.8);

  render = new WB_Render3D(this);
  WB_MeshCreator geo1 = new WB_Geodesic(170,1,1);
  WB_MeshCreator geo2 = new WB_Geodesic(170,1,2);
  WB_MeshCreator geo3 = new WB_Geodesic(170,2,1);
  WB_MeshCreator geo4 = new WB_Geodesic(170,2,2);
  mesh1 = geo1.create();
  mesh2 = geo2.create();
  mesh3 = geo3.create();
  mesh4 = geo4.create();
}

void draw() {
  background(30);

  pushMatrix();
  translate(width/3, height/3);
  rotateX(sin(frameCount / 150.0));
  rotateY(cos(frameCount / 150.0));
  render.drawMesh(mesh1);
  popMatrix();

  pushMatrix();
  translate(width*2/3, height/3);
  rotateX(cos(frameCount / 120.0));
  rotateY(sin(frameCount / 120.0));
  render.drawMesh(mesh2);
  popMatrix();

  pushMatrix();
  translate(width/3, height*2/3);
  rotateX(sin(frameCount / 90.0));
  rotateY(cos(frameCount / 90.0));
  render.drawMesh(mesh3);
  popMatrix();

  pushMatrix();
  translate(width*2/3, height*2/3);
  rotateX(cos(frameCount / 60.0));
  rotateY(sin(frameCount / 60.0));
  render.drawMesh(mesh4);
  popMatrix();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame(timestamp()+".png");
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
