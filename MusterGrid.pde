import java.util.Iterator;

//HashMap<PVector, GeoShape> grid;    //dann halt 2d array....
GeoShape[][]grid;
ArrayList<GeoShape>shapes;

final int GRID_SIZE = 40;
final int OFFSET = 10;
float rotationAngle = PI/2;
boolean rotate = false;
boolean hex = true;

void setup() {
  size(18*GRID_SIZE, 18*GRID_SIZE);
  grid = new GeoShape[18][18];
  shapes = new ArrayList<GeoShape>();
  //setUpGrid();
}

void draw() {
  background(128 );
  //drawGrid();
  drawShapes();
}
/*
void setUpGrid() {
 grid = new HashMap<PVector, GeoShape>();
 for (int y =0; y <   height/GRID_SIZE; y++) {
 for (int x = 0; x < width/GRID_SIZE; x++) {
 int posX = (x*GRID_SIZE)+OFFSET;//+GRID_SIZE/2;      +Offset = r bzw höhe jeder form
 
 int posY = (y*GRID_SIZE)+OFFSET;//+GRID_SIZE/2;
 grid.put(new PVector(posX, posY), null);
 //      ellipse(posX, posY,5,5);
 }
 }
 }
 
 */

void mouseReleased( ) {
  PVector pos = getCurrentPosition();
  GeoShape shape = setUpShape(pos);
  addToGrid(pos, shape);
 
}


void keyPressed( ) {
  if (key == 'r'|| key == 'R') {
    rotate = !rotate;
  }
  if (key == 'q'|| key == 'Q') {
    hex = !hex;
  }
}
/*                        HashMap
 void drawGrid() {
 fill(255, 0, 0);
 Iterator it = grid.keySet().iterator();
 while (it.hasNext ()) {
 PVector pos = (PVector)it.next();
 ellipse(pos.x, pos.y, 5, 5);
 }
 fill(128);
 }
 
 void drawShapes() {
 Iterator it = grid.keySet().iterator();
 while (it.hasNext ()) {
 PVector pos = (PVector)it.next();
 GeoShape shape = grid.get(pos);
 if (shape!= null) {
 shape.drawShape();
 }
 }
 }
 */


void drawShapes() {

  for (int i = 0; i < 18; i++) {
    for (int j = 0; j < 18; j++) {
      if (grid[i][j] != null) {
        grid[i][j] .drawShape();
      }
    }
  }
}


PVector getCurrentPosition() {

  int x = (int((mouseX+GRID_SIZE/2)/GRID_SIZE))*GRID_SIZE;
  int y =  (int((mouseY+GRID_SIZE/2)/GRID_SIZE))*GRID_SIZE;    
  return new PVector(x+OFFSET, y+OFFSET);
}

GeoShape setUpShape(PVector pos){
  GeoShape shape;  
  if (hex)
    shape = new Hexagon(pos);
  else 
    shape = new Rectangel(pos);

  if (rotate)
    shape.setRotationAngle(rotationAngle);
    
    return shape;
}

void addToGrid(PVector pos, GeoShape shape){
 
  int xIndex = (int)pos.x/GRID_SIZE;
  int yIndex = (int)pos.y/GRID_SIZE;
  GeoShape gridShape = grid[xIndex][yIndex];
  
   if (gridShape == null) {
    grid[xIndex][yIndex] = shape;
  } 
  else if (gridShape.getClass() != shape.getClass() || gridShape.getRotationAngle() != shape.getRotationAngle()) {
    //addToGrid(pos, shape);
    //shape.drawShape();
    grid[xIndex][yIndex] = shape;
  } 
}

/*
void addToGrid(PVector pos, GeoShape shape){
 if (grid.get(pos ) != null && grid.get(pos ).getClass() != shape.getClass()) {
 grid.put(pos ,shape);
 }
 
 }*/
