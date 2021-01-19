class Shape {
  // the shape will start out as circle, concsisting of curve vertices

  // the shape of the Shape class can be modified by moving around the control
  // points for the curve vertex
  Ellipse[] points;
  int radius;
  int pointSize;

  Shape(int radius_, int pointSize_) {
    radius = radius_;
    pointSize = pointSize_;
    // to create a circle we need 11 points: two at the start, two at the end, and 
    // 7 for the other locations
    points = new Ellipse[11];
  }

  void initialize() {
    // create the initial spots for the Ellipses
    int[] xcoords = {-radius/2, -radius, -radius/2, 0, radius/2, radius, radius/2, 0, -radius/2, -radius, -radius/2};
    int[] ycoords = {radius/2, 0, -radius/2, -radius, -radius/2, 0, radius/2, radius, radius/2, 0, -radius/2};

    for (int i=0; i<points.length; i++) {
      points[i] = new Ellipse(xcoords[i] + width/2, ycoords[i] + height/2, pointSize);
    }
  }

  // check if any of the ellipses have been dragged
  void update() {
    for (int i=0; i<points.length; i++) {
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
      fill(125, 125, 125, 100);
      curveVertex(points[i].x, points[i].y);
    }
    endShape();
  }
}
