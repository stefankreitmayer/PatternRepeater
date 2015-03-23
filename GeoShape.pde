abstract class GeoShape implements Comparable<GeoShape> {

  protected PVector distanceToParent ;
  protected GeoShape child;
  protected PVector position;
  protected float rotationAngle;

  public void setPosition(PVector pos) {
    position = pos;
  }

  public PVector getPosition() {
    return position;
  }

  public PVector getDistanceToParent() {
    return distanceToParent;
  }

  public void setRotationAngle(float angle) {
    rotationAngle = angle;
  }

  public void setChild(GeoShape _child) {
    child = _child;
  }  

  public void determineDistanceToParent(GeoShape parent) {       
    distanceToParent = new PVector();
    distanceToParent.x = abs(parent.position.x - position.x);
    distanceToParent.y = abs(parent.position.y - position.y);
    //println("---");
    //println("distanceToParent: "+distanceToParent.x +", "+distanceToParent.y);
    //println("parent: "+parent.position.x +", "+parent.position.y);
    //println("child: "+position.x +", "+position.y);
    //println("---");
  }

  @Override
    public int compareTo(GeoShape other) {

    if (other.position.x > position.x && other.position.y >= other.position.y) {
      return -1;
    } else if (other.position.x == position.x && other.position.y == other.position.y) {
      return 0;
    } else {
      return 1;
    }
  }

  public void draww(PVector parentPos) {
    println("drawwing shape @ "+parentPos.x+", "+parentPos.y);
    if (position!=null) {      
      int x = (int)(parentPos.x);//.x + (distanceToParent != null ? distanceToParent.x : 0));
      int y = (int)(parentPos.y);// + (distanceToParent != null ? distanceToParent.y : 0));
      rectMode(CENTER);
      pushMatrix();
      translate(x, y);      
      drawShape( );
      popMatrix();
      drawChild(new PVector(x, y));
    }
  }

  abstract void drawShape() ;

  protected void drawChild(PVector parentPos) { 
    if (child != null) {
      child.draww(parentPos);
    }
  }

  protected float getRotationAngle() {
    return rotationAngle;
  }
}
