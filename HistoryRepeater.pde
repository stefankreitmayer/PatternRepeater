Blob head;
Painter painter = new Painter();
Looper looper = new Looper();

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
    head.addChild(mouseX, mouseY);
  }
  redraw();
}

void keyPressed() {
  if (key>='0' && key<='9') {
    looper.copyHistory(head);
    looper.appendCopiesToHead(key-'0');
    redraw();
  }
}

void warn(String message) {
  println("WARNING: "+message);
}

