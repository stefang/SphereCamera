import processing.opengl.*;

SphereCamera sCam;

void setup() {
  setupRender();
  sCam = new SphereCamera();
}

void draw() {
  render();
}

void mousePressed() {
  sCamPosition();
}

void sCamPosition() {
  sCam.camAzimuthTarget = random(-85,85);
  sCam.camZenithTarget = random(0,360);
  sCam.camSphereRadiusTarget = random(400)+500;
  sCam.camTargTarget = random(1,10);
}
