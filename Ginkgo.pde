PShape branch;

void settings() {
  //fullScreen(P3D);
}

void setup() {
  setCamera();
  frameRate(30);
  //noStroke();
  
  PVector r = PVector.random3D();
  randomRotateVector(r, 0);
  
  branch = createBranch(null);
}

//void draw() {
//  background(color(128, 192, 256));
  
//  pushMatrix();
//  cameraMatrix();
  
//  ambientLight(118, 128, 138);
//  directionalLight(138, 128, 118, 0.5, -0.3, 1);
  
//  //fill(256, 212, 30);
//  //box(100);
  
//  shape(branch);
  
  
//  popMatrix();
//}
