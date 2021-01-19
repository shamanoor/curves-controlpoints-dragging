class Ellipse {
  int x, y, size;

  Ellipse(int x_, int y_, int size_) {
    x = x_;
    y = y_;
    size = size_;
  }

  // make four anchor points that are the start and end for each of the 
  // four quadrants
  // then make four points in between four of those anchor points that
  // fall onto a circle radius

  // and make that those points can be moved by the user


  boolean hovering() {
    if (mouseX >= (x - size/2) && mouseX <= (x + size/2)
      && mouseY >= (y - size/2) && mouseY <= (y + size/2)) {
      return true;
    }
    return false;
  }

  void display() {
    fill(0);
    ellipse(x, y, size, size);
  }
  
  void update(int newX, int newY) {
    x = newX;
    y = newY;
  }
}
