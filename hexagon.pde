class Hexagon extends GeoShape{
  
  public Hexagon(PVector pos){
    position = pos;
  }

  void drawShape(int x, int y){
    pushMatrix();
    translate(x, y);
    rotate(rotationAngle);
    beginShape( );
    vertex(-40,0);
    vertex(-20,20);
    vertex(20,20);
    vertex(40,0);
    vertex(20,-20);
    vertex(-20,-20);
    vertex(-40,0);
    endShape();
    popMatrix();
  }
  
  void setRotationAngle(float angle){
    rotationAngle = angle;
  }
}
