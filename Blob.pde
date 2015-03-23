class Blob {
  private Blob parent;
  private boolean isPositionAbsolute; // only the root stores its absolute position
  private int absoluteX;
  private int absoluteY;
  private float angle;
  private float distance;
  private int radius = 5;

  /* Constructor for root */
  Blob(int absoluteX, int absoluteY) {
    this.absoluteX = absoluteX;
    this.absoluteY = absoluteY;
    isPositionAbsolute = true;
  }

  /* Constructor for child */
  Blob(Blob parent, float angle, float distance) {
    this.parent = parent;
    this.angle = angle;
    this.distance = distance;
    isPositionAbsolute = false;
  }

  void addBlob(int childX, int childY) {
    float angle = atan2(childY-positionY(), childX-positionX());
    float distance = dist(childX, childY, positionX(), positionY());
    head = new Blob(head, angle, distance);
  }

  float positionX() {
    return isPositionAbsolute ? absoluteX : parent.positionX() + distance * cos(angle);
  }

  float positionY() {
    return isPositionAbsolute ? absoluteY : parent.positionY() + distance * sin(angle);
  }

  boolean isRoot() {
    return parent == null;
  }

  Blob getParent() {
    return parent;
  }

  float getRadius() {
    return radius;
  }
}
