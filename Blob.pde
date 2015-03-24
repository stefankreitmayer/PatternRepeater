class Blob {
  private Blob parent;
  private boolean isPositionAbsolute; // only the root stores its absolute position
  private int absoluteX;
  private int absoluteY;
  private float angle;
  private float distance;
  private int radius = grid.pixelSize/2;

  private boolean isPositionXCached;
  private boolean isPositionYCached;

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

  void addChild(int childX, int childY) {
    float angle = atan2(childY-positionY(), childX-positionX());
    float distance = dist(childX, childY, positionX(), positionY());
    head = new Blob(head, angle, distance);
  }

  void addChildByCopy(Blob other) {
    head = new Blob(head, other.angle, other.distance);
  }

  float positionX() {
    if (isPositionXCached) {
      return absoluteX;
    }
    isPositionXCached = true;
    return absoluteX = grid.quantize(isPositionAbsolute ? absoluteX : parent.positionX() + distance * cos(angle));
  }

  float positionY() {
    if (isPositionYCached) {
      return absoluteY;
    }
    isPositionYCached = true;
    return absoluteY = grid.quantize(isPositionAbsolute ? absoluteY : parent.positionY() + distance * sin(angle));
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

  float getAngle() {
    return angle;
  }

  void rotate(float rotationAngle) {
    angle += rotationAngle;
    invalidatePositionCache();
  }

  private void invalidatePositionCache() {
    isPositionXCached = false;
    isPositionYCached = false;
  }
}

