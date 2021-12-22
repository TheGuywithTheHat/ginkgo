import java.util.List;

List<PShape> branches = new ArrayList<>();

void settings() {
  fullScreen(P3D);
}

void setup() {
  setCamera();
  frameRate(30);
  noStroke();
  
  PVector r = PVector.random3D();
  
  for(int i = 0; i < 100; i++) {
    branches.add(createBranch(new PMatrix3D(), 4000));
  }
}

void draw() {
  background(color(128, 192, 256));
  
  pushMatrix();
  cameraMatrix();
  
  
  ambientLight(178, 188, 198);
  //directionalLight(138, 128, 118, 0.5, -0.3, 1);
  directionalLight(88, 78, 68, 0.5, -0.3, 1);
  directionalLight(58, 48, 38, -0.5, 0.3, -1);
  
  fill(256, 212, 30);
  box(100);
  
  for(PShape b : branches) {
    shape(b);
  }
  
  
  popMatrix();
}
