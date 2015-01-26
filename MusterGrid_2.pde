import java.util.Iterator; 


GeoShape[][]grid;
GeoShape current;
ArrayList<GeoShape>shapes;
Hexagon initialHex;
Rectangel initialRect;
final int GRID_SIZE = 40;
final int FIELDS = 18;
final int OFFSET = 0;
float rotationAngle = PI/2;
boolean rotate = false;
boolean hex = true;
boolean hexFirst;


//************************************+

void setup() {
  size(FIELDS*GRID_SIZE, FIELDS*GRID_SIZE);
  grid = new GeoShape[18][18];
  shapes = new ArrayList<GeoShape>();
}

//************************************+

void draw() {
  background(128 );
  drawShapes();
}


//************************************+

void mouseReleased( ) {
  PVector pos = getCurrentPosition();  
  GeoShape shape = setUpShape(pos);
  addToGrid(pos, shape);
  createPattern();
}

//************************************+

void keyPressed( ) {
  if (key == 'r'|| key == 'R') {
    rotate = !rotate;
  } else if (key == 'q'|| key == 'Q') {
    hex = !hex;
  }
}

//************************************+

void drawShapes() {
//FIXME mel hier noch unterschiedliche F

    for (int i = 0; i < 18; i++) {
      for (int j = 0; j < 18; j++) {
        if (grid[i][j] != null) {
          if (initialShape(grid[i][j])) {
            fill(220);
          } else {
            fill(255);
          }
          grid[i][j] .drawShape();
        }
      }
    }
}

//************************************+

boolean initialShape(GeoShape shape) {
  if (initialHex != null && initialHex.getPosition() != null && shape.getPosition().equals(initialHex.getPosition() )) {
    return true;
  } else if (initialRect != null && initialRect.getPosition() != null && shape.getPosition().equals(initialRect.getPosition() )) {
    return true;
  }

  return false;
}

//************************************+

PVector getCurrentPosition() {

  int x = (int((mouseX+GRID_SIZE/2)/GRID_SIZE))*GRID_SIZE;
  int y =  (int((mouseY+GRID_SIZE/2)/GRID_SIZE))*GRID_SIZE;    
  return new PVector(x+OFFSET, y+OFFSET);
}

//************************************+

GeoShape setUpShape(PVector pos) {
  GeoShape shape;  
  if (hex) {      
    shape = new Hexagon(pos);
    if (initialHex == null) {
      initialHex  = new Hexagon(pos);
      println("new initial hex at: "+pos.x+":"+pos.y);
      initialHex.setRotationAngle(rotationAngle);
    }
    if (initialRect != null && initialRect.position.equals(pos )) {
      initialRect = null;
    }
  } else {
    shape = new Rectangel(pos);
    if (initialRect == null) {
      initialRect = new Rectangel(pos);
      println("new initial rect at: "+pos.x+":"+pos.y);
      initialRect.setRotationAngle(rotationAngle);
    }
    if (initialHex != null && initialHex.position.equals(pos )) {
      initialHex = null;
    }
  }
  if (rotate) {
    shape.setRotationAngle(rotationAngle);
  }    
  return shape;
}

//************************************+

void addToGrid(PVector pos, GeoShape shape) {

  int xIndex = (int)pos.x/GRID_SIZE;
  int yIndex = (int)pos.y/GRID_SIZE;
  GeoShape gridShape = grid[xIndex][yIndex];

  if (gridShape == null) {
    grid[xIndex][yIndex] = shape;
  } else if (gridShape.getClass() != shape.getClass() || gridShape.getRotationAngle() != shape.getRotationAngle()) {
    grid[xIndex][yIndex] = shape;
  }
}

//************************************+

void createPattern() {
  if (initialHex == null && initialRect == null) {
    return ;
  }
  if (initialHex != null && initialRect != null) {
    int xOffset = getXOffset();
    int yOffset = getYOffset();
    setShapeOrder();
       
    if (yOffset != 0 ) {
      //für yOffset == 0 und xOffset == 0??? 
      //if(pos %(2*Offset == 0)){drawFirstShape)else if (pos%offset == null){drawSecondShape}
      // und wenn beide != 0 ????
      int counter = 0;
      for (int y = 1; y < FIELDS; y++) {
        for (int x = 1; x < FIELDS; x++) {

          if (counter%(2*yOffset) == 0) {
            drawFirstShape(x, y);
          } else if (counter %yOffset == 0) {
            drawSecondShape(x, y);
          }
          counter++;
        }
      }        
      }else if( xOffset != 0){
    int counter = 0;
      for (int y = 1; y < FIELDS; y++) {
        for (int x = 1; x < FIELDS; x++) {

          if (counter%(2*xOffset) == 0) {
            drawFirstShape(x, y);
          } else if (counter %xOffset == 0) {
            drawSecondShape(x, y);
          }
          counter++;
        }
      }
    } else {
    }
  }
}

void drawFirstShape(int x, int y) {
  if (hexFirst) {
    grid[y][x] = new Hexagon(new PVector(y*GRID_SIZE, x*GRID_SIZE));
  } else {
    grid[y][x] = new Rectangel(new PVector(y*GRID_SIZE, x*GRID_SIZE));
  }
}
void drawSecondShape(int x, int y) {
  if (hexFirst) {
    grid[y][x] = new Rectangel(new PVector(y*GRID_SIZE, x*GRID_SIZE));
  } else {
    grid[y][x] = new Hexagon(new PVector(y*GRID_SIZE, x*GRID_SIZE));
  }  
}



//************************************+

private int getYOffset()
{

  int offset = int(Math.abs(initialHex.getPosition().y - initialRect.getPosition().y) )/GRID_SIZE;
  return offset;
}

//************************************+

private int getXOffset()
{
  int offset = int(Math.abs(initialHex.getPosition().x - initialRect.getPosition().x) )/GRID_SIZE;
  return offset;
}

void setShapeOrder() {
  if (initialHex.position.x > initialRect.position.x && initialHex.position.y < initialRect.position.y) {

    hexFirst = true;
  } else if (initialHex.position.x < initialRect.position.x && initialHex.position.y > initialRect.position.y) {
    hexFirst = false;
  }
}
