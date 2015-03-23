Blob head;
Painter painter = new Painter();
Looper looper = new Looper();
Grid grid = new Grid(20);

void setup() {
  size(700, 700);
  noLoop();
}

void draw() {
  background(127);
  painter.paintGrid();
  if (head!=null) {
    painter.paintBlob(head);
  }
}

void mouseReleased() {
  int x = mouseX;
  int y = mouseY;
  if (head==null)
  {
    head = new Blob(x, y);
  } else {
    head.addChild(x, y);
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

