Shape shape;

void setup() {
  fullScreen();
  shape = new Shape(300, 15, 14);
  shape.initialize();
}

void draw() {
  background(255);
  shape.move();
  shape.display();
}

void mouseDragged() {
  // call update function, it will only update if there is something
  // to be updated, i.e. if a dot is being dragged ;)
  shape.update();
}
