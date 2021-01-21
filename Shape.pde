class Shape {
  /* The shape will start out as circle, concsisting of curve vertices
     Th shape's form will change over time
  */
  Ellipse[] points;
  int radius;
  int pointSize;
  int numPoints;
  int numCoords;

  Shape(int radius_, int pointSize_, int numPoints_) {
    this.radius = radius_;
    this.pointSize = pointSize_;
    this.numPoints = numPoints_;
    this.numCoords = numPoints + 3; // we need to do +3 to get a closed shape
    this.points = new Ellipse[numCoords];
  }

  void initialize() {
    for (int i=0; i<points.length; i++) {
      int xcoord = int(radius * sin(TWO_PI/numPoints * i));
      int ycoord = int(radius *cos(TWO_PI/numPoints * i));
      points[i] = new Ellipse(xcoord + width/2, ycoord + height/2, pointSize);
    }
  }

  void move() {
    for (int i=0; i<points.length; i++) {
      // update control points with their new locations
      println("i: ", i);
      points[i].update();
      points[i].display();
    }
  }

  void update() {
    for (int i=0; i<points.length; i++) {
      // update control points with where they have been dragged to
      if (points[i].hovering()) {
        points[i].update(mouseX, mouseY);
        points[i].display();
      }
    }
  }

  void display() {
    beginShape();
    for (int i=0; i<points.length; i++) {
      points[i].display();
      fill(255, 0, 0, 100);
      curveVertex(points[i].x, points[i].y);
    }
    endShape();
  }
}
