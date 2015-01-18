abstract class GeoShape {
  
  protected PVector position;
  protected float rotationAngle;

  public void setPosition(PVector pos) {
    position = pos;
  }

  PVector getPosition() {
    return position;
  }

  
  abstract void setRotationAngle(float angle); 
  abstract void drawShape() ;

  protected float getRotationAngle() {
    return rotationAngle;
  }
  
  
}
