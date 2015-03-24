class Looper {
  private ArrayList<Blob> clip;
  private float clipRotation;

  void copyHistory(Blob blob) {
    if (blob==null || blob.isRoot()) {
      warn("nothing to copy");
      return;
    }
    clip = new ArrayList<Blob>();
    do {
      clip.add(0, blob);
      blob = blob.getParent();
    }
    while (!blob.isRoot ());
    clipRotation = clip.get(clip.size()-1).getAngle() - clip.get(0).getAngle();
  }

  void appendCopiesToHead(int numberOfCopies) {
    for (int icopy=0; icopy<numberOfCopies; icopy++) {
      int fillColor = icopy % 2 == 0 ? color(100, 250, 200) : color(100, 200, 250);
      for (int iblob=0; iblob<clip.size (); iblob++) {
        Blob b = clip.get(iblob);
        Blob newBlob = new Blob(head, b.angle, b.distance);
        newBlob.rotate((icopy+1)*clipRotation);
        newBlob.setFillColor(fillColor);
        if (grid.isEmptyAt(newBlob.positionX(), newBlob.positionY(), head)) {
          head = newBlob;
        } else {
          warn("Collision on grid. Aborting copy action.");
          return;
        }
      }
    }
  }
}

