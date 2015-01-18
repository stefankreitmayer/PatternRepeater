class Hexagon extends GeoShape {

  public Hexagon(PVector pos) {
    super.setPosition( pos);
  }

  public Hexagon( ) {
  }

  void drawShape() {
    if (position != null) {
      int x = (int)position.x;
      int y = (int) position.y;
      pushMatrix();
      translate(x, y);
      rotate(rotationAngle);
      beginShape( );
      vertex(-20, 0);
      vertex(-10, 20);
      vertex(10, 20);
      vertex(20, 0);
      vertex(10, -20);
      vertex(-10, -20);
      vertex(-20, 0);
      endShape();
      popMatrix();
    }
  }

  void setRotationAngle(float angle) {
    rotationAngle = angle;
  }
}
