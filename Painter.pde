class Painter {

  void paintBlob(Blob b) {
    if (!b.isRoot()) {
      line(b.positionX(), b.positionY(), b.getParent().positionX(), b.getParent().positionY());
      paintBlob(b.getParent());
    }
    ellipseMode(RADIUS);
    ellipse(b.positionX(), b.positionY(), b.getRadius(), b.getRadius());
  }
}

