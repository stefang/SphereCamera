void setupRender() {
  size(800,600,OPENGL);
}

void render() {
  background(0);
  sCam.axis();
  sCam.drawCamera(64);
}
