class Painter {
  private final color BLOB_COLOR_NORMAL = color(255);
  private final color BLOB_COLOR_HEAD = color(255, 220, 0);

  void paintBlob(Blob b) {
    if (!b.isRoot()) {
      line(b.positionX(), b.positionY(), b.getParent().positionX(), b.getParent().positionY());
      paintBlob(b.getParent());
    }
    ellipseMode(RADIUS);
    fill(b==head ? BLOB_COLOR_HEAD : BLOB_COLOR_NORMAL);
    ellipse(b.positionX(), b.positionY(), b.getRadius(), b.getRadius());
  }
}

