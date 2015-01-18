class Rectangel extends GeoShape {
  public Rectangel(PVector pos) {
    super.setPosition( pos);
  }

  public Rectangel( ) {
  }  
  void drawShape() {
    if (position!=null) {
      int x = (int)position.x;
      int y = (int)position.y;
      rectMode(CENTER );
      pushMatrix();
      translate(x, y);
      rotate(rotationAngle);
      rect(0, 0, 40, 40);
      popMatrix();
    }
  }

  void setRotationAngle(float angle) {
    rotationAngle = angle;
  }
}
