class Rectangel extends GeoShape{
  public Rectangel(PVector pos){
   position = pos; 
  }
  
 void drawShape(int x, int y){
  rectMode(CENTER );
  pushMatrix();
  translate(x,y);
  rotate(rotationAngle);
  rect(0,0,40,40);
  popMatrix();
  
 }

void setRotationAngle(float angle){
  rotationAngle = angle;
} 
}
