float angle = 0;
float elevation = 0;
float zoom = 0;

float speed = 1f / 300;
float zoomIncrement = 0.1;

void mouseDragged() {
  int dx = mouseX - pmouseX;
  int dy = mouseY - pmouseY;
  
  float epsilon = 1e-6;
  
  angle = (angle + dx * speed) % (PI * 2);
  elevation = constrain(elevation + dy * speed, -PI / 2 + epsilon, PI / 2 - epsilon);
}

void mouseWheel(MouseEvent event) {
  zoom = constrain(zoom - event.getCount() * zoomIncrement, -3, 3);
}

void setCamera() {
  camera(-1000, 0, 0, 0, 0, 0, 0, 0, 1);
}

void resetCamera() {
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
}

void cameraMatrix() {
  rotateY(elevation);
  rotateZ(angle);
  scale(exp(zoom));
}
