class Painter {
  private final color BLOB_COLOR_HEAD = color(255, 220, 0);

  void paintGrid() {
    stroke(255, 20);
    for (int x=0; x<width; x+=grid.getPixelSize ()) {
      line(x, 0, x, height);
    }
    for (int y=0; y<height; y+=grid.getPixelSize ()) {
      line(0, y, width, y);
    }
  }

  void paintBlob(Blob b) {
    stroke(0, 140);
    if (!b.isRoot()) {
      line(b.positionX(), b.positionY(), b.getParent().positionX(), b.getParent().positionY());
      paintBlob(b.getParent());
    }
    fill(b==head ? BLOB_COLOR_HEAD : b.getFillColor());
    //    ellipseMode(RADIUS);
    //    ellipse(b.positionX(), b.positionY(), b.getRadius(), b.getRadius());
    drawPolygon(b.positionX(), b.positionY(), b.getRadius(), b.getPolygonNumberOfSides());
  }

  void drawPolygon(float x, float y, float radius, int numberOfSides) {
    beginShape();
    for (int i=0; i<numberOfSides; i++) {
      float angle = TWO_PI*i/numberOfSides;
      vertex(x+cos(angle)*radius, y+sin(angle)*radius);
    }
    endShape();
  }
}

