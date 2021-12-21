PShape createBranch(PMatrix3D origin, int len) {
  float radius = 30;
  float spacing = 5;
  float stemDist = 50;
  len /= spacing;
  
  
  PShape b = createShape();
  b.beginShape(TRIANGLES);
  
  b.fill(color(256, 212, 30));
  
  PMatrix3D frontier = origin.get();
  PMatrix3D curve = new PMatrix3D();
  
  PVector leafVec = new PVector(-radius, 0, 0);
  PVector tempVec = new PVector();
  PVector nextVert;
  
  for(int i = 0; i < len; i++) {
    curve.rotateZ(random(PI * 2));
    curve.rotateX(random(0.008));
    frontier.apply(curve);
    frontier.translate(0, 0, -spacing);
    PMatrix3D leafMat = frontier.get();
    leafMat.rotateZ(random(PI * 2));
    leafMat.translate(stemDist, 0, 0);
    leafMat.rotateX((random(1) - 0.5) * 2);
    leafMat.rotateY((random(1)) / 2);
    
    nextVert = leafMat.mult(leafVec, tempVec);
    b.vertex(nextVert.x, nextVert.y, nextVert.z);
    leafMat.rotateZ(PI * 2 / 3);
    
    nextVert = leafMat.mult(leafVec, tempVec);
    b.vertex(nextVert.x, nextVert.y, nextVert.z);
    leafMat.rotateZ(PI * 2 / 3);
    
    nextVert = leafMat.mult(leafVec, tempVec);
    b.vertex(nextVert.x, nextVert.y, nextVert.z);
    leafMat.rotateZ(PI * 2 / 3);
  }
  
  b.endShape();
  return b;
}

// doesn't work
/*
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
*/
