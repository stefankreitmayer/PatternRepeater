abstract class GeoShape {
  
  protected PVector position;
  protected float rotationAngle;

  public void setPosition(PVector pos) {
    position = pos;
  }

  PVector getPosition() {
    return position;
  }

  abstract void drawShape(int x, int y);
  abstract void setRotationAngle(float angle); 
  void drawShape() {
    drawShape((int)position.x, (int)position.y) ;
  }

  protected float getRotationAngle() {
    return rotationAngle;
  }
}
