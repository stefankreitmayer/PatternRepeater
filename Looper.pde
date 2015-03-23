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
      for (int iblob=0; iblob<clip.size (); iblob++) {
        head.addChildByCopy(clip.get(iblob));
        head.rotate((icopy+1)*clipRotation);
      }
    }
  }

  void pasteToHead() {
    for (int i=0; i<clip.size (); i++) {
      head.addChildByCopy(clip.get(i));
    }
  }
}

