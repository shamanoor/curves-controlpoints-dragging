Shape shape;

void setup() {
  size(800, 800);
  shape = new Shape(300, 15);
  shape.initialize();
}

void draw() {
  background(255);
  shape.display();
}

void mouseDragged() {
  // call update function, but it will only update if there is something
  // to be updated, i.e. if a dot is being dragged ;)
  shape.update();
}