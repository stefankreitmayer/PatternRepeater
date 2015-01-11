class GridPoint {
  PVector position;
  GeoShape shape; 

  public GridPoint(int x, int y) {
    position = new PVector(x, y);
  }
  GeoShape getShape() {
    return shape;
  }

  void setShape(GeoShape  shape) {

    this.shape = shape;
  }
}
