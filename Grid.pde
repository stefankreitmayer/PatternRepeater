class Grid {
  private int pixelSize;
  Grid(int pixelSize) {
    this.pixelSize = pixelSize;
  }

  int getPixelSize() {
    return pixelSize;
  }

  int quantize(float coordinate) {
    return int(coordinate / pixelSize) * pixelSize + pixelSize/2;
  }

}

