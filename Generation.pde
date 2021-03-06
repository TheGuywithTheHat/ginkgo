PShape createBranch(PMatrix3D origin, float len, float stickRadius) {
  float radius = 30;
  float spacing = 5;
  float stemDist = 50;
  float stickSpacing = 200;
  float stickRadFalloff = 0.85;
  int stickSides = 5;
  
  color lightColor = color(256, 192, 30);
  color darkColor = color(140, 108, 10);
  
  PShape b = createShape(GROUP); // branch
  PShape s; // stick
  PShape l = createShape(); // leaves
  l.beginShape(TRIANGLES);
  
  l.fill(lightColor);
  
  PMatrix3D frontier = origin.get();
  PMatrix3D lastStickMat = frontier.get();
  float lastStickLen = 0;
  boolean shouldOffset = false;
  
  PVector leafVec = new PVector(-radius, 0, 0);
  PVector tempVec = new PVector();
  PVector nextVert;
  
  PVector centerVec = new PVector(0, 0, -1500);
  
  for(float currLen = 0; currLen < len; currLen += spacing) {
    
    // update frontier
    float rotation = random(PI * 2);
    frontier.rotateZ(rotation);
    frontier.rotateY(random(0.08));
    frontier.rotateZ(-rotation);
    frontier.translate(0, 0, -spacing);
    
    // draw leaves
    PMatrix3D leafMat = frontier.get();
    leafMat.rotateZ(random(PI * 2));
    leafMat.translate(stemDist + stickRadius, 0, 0);
    leafMat.rotateX((random(1) - 0.5) * 2);
    leafMat.rotateY((random(1)) / 2);
    
    float dist = 0;
    for(int j = 0; j < 3; j++) {
      nextVert = leafMat.mult(leafVec, tempVec);
      dist = centerVec.dist(nextVert);
      l.fill(lerpColor(darkColor, lightColor, dist / 2000));
      l.vertex(nextVert.x, nextVert.y, nextVert.z);
      leafMat.rotateZ(PI * 2 / 3);
    }
    
    // draw stick
    if(currLen - lastStickLen >= stickSpacing || currLen + spacing >= len) {
      s = createShape();
      s.beginShape(TRIANGLE_STRIP);
      s.fill(color(54, 39, 27));
      //s.fill(color(200));
      
      PMatrix3D currStickMat = frontier.get();
      
      if(shouldOffset) {
        currStickMat.rotateZ(TWO_PI / stickSides / 2);
      } else {
        lastStickMat.rotateZ(TWO_PI / stickSides / 2);
      }
      
      PVector lastStickVec = new PVector(stickRadius, 0, 0);
      PVector currStickVec = new PVector(stickRadius * stickRadFalloff, 0, 0);
      
      for(int i = 0; i <= stickSides; i++) {
        nextVert = lastStickMat.mult(lastStickVec, tempVec);
        s.vertex(nextVert.x, nextVert.y, nextVert.z);
        lastStickMat.rotateZ(TWO_PI / stickSides);
        
        nextVert = currStickMat.mult(currStickVec, tempVec);
        s.vertex(nextVert.x, nextVert.y, nextVert.z);
        currStickMat.rotateZ(TWO_PI / stickSides);
      }
      s.endShape();
      b.addChild(s);
    
      shouldOffset = !shouldOffset;
      lastStickLen = currLen;
      stickRadius *= stickRadFalloff;
      lastStickMat = frontier.get();
    }
  }
  
  l.endShape();
  b.addChild(l);
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
