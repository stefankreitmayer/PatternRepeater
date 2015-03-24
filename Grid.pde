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

  boolean isEmptyAt(float x, float y, Blob searchStartBlob) {
    Blob b = searchStartBlob;
    while (b!=null) {
      if (abs(x-b.positionX())<pixelSize/2 &&
        abs(y-b.positionY())<pixelSize/2) {
        return false;
      }
      b = b.getParent();
    }
    return true;
  }
}

