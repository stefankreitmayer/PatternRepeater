Blob head;

void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  background(127);
  if (head!=null) {
    head.display();
  }
}

void mouseReleased() {
  if (head==null)
  {
    head = new Blob(mouseX, mouseY);
  } else {
    head.addBlob(mouseX, mouseY);
  }
  redraw();
}

