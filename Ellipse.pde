class Ellipse {
  int x, y, size;
  float moveX, moveY;
  float speed;

  Ellipse(int x_, int y_, int size_) {
    x = x_;
    y = y_;
    size = size_;
    this.moveX = random(2);
    this.moveY = random(2);
    speed = 0.5;
  }
  
  // display control points
  void display() {
    fill(0, 0, 0, 0);
    noStroke();
    ellipse(x, y, size, size);
  }

  void update() {
    this.x += moveX;
    this.y += moveY;

    if (x <= 0 || x >= width) {
      this.moveX *= -1;
      println("x too large or too small: ", x);
    }


    if (y <= 0 || y >= height) {
      moveY *= -1;
      println("y too large or too small: ", y);
    }
  }

  void update(int newX, int newY) {
    x = newX;
    y = newY;
  }

  boolean hovering() {
    if (mouseX >= (x - size/2) && mouseX <= (x + size/2)
      && mouseY >= (y - size/2) && mouseY <= (y + size/2)) {
      return true;
    }
    return false;
  }
}
