PShape createBranch(PVector direction) {
  int radius = 30;
  
  
  
  PShape b = createShape();
  b.beginShape(TRIANGLES);
  
  b.fill(color(256, 212, 30));
  
  for(int i = 0; i < 100; i += 10) {
    b.vertex(30, 0, i);
    //b.rotateZ(PI * 2 / 3 / 10);
    b.vertex(30, 30, i);
    //b.rotateZ(PI * 2 / 3 / 10);
    b.vertex(0, 30, i);
    //b.rotateZ(-PI * 4 / 3 / 10);
    b.rotateX(0.01);
  }
  
  b.endShape();
  return b;
}

PVector randomRotateVector(PVector original, float amount) {
  original = original.normalize();
  PVector unitZ = new PVector(0, 0, 1);
  PVector xAxis = unitZ.cross(original).normalize();
  PVector yAxis = original.cross(xAxis).normalize();
  
  
  PMatrix3D matrix = new PMatrix3D(xAxis.x, xAxis.y, xAxis.z, 0,
                            yAxis.x, yAxis.y, yAxis.z, 0,
                            original.x, original.y, original.z, 0,
                            0, 0, 0, 1);
  
  println(original);
  println(xAxis);
  println(yAxis);
  println(matrix.mult(unitZ, null));
  
  return original;
}
