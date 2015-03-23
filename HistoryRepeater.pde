Blob head;
Painter painter = new Painter();

void setup() {
  size(400, 400);
  noLoop();
}

void draw() {
  background(127);
  if (head!=null) {
    painter.paintBlob(head);
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

