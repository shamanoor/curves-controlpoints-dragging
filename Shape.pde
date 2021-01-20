class Shape {
  // the shape will start out as circle, concsisting of curve vertices

  // the shape of the Shape class can be modified by moving around the control
  // points for the curve vertex
  Ellipse[] points;
  int radius;
  int pointSize;
  int numPoints;
  int numCoords;

  Shape(int radius_, int pointSize_, int numPoints_) {
    radius = radius_;
    pointSize = pointSize_;
    numPoints = numPoints_;
    numCoords = numPoints + 3; // we need to do +3 to get a closed, smoothe shape
    // to create a circle we need 11 points: two at the start, two at the end, and 
    // 7 for the other locations
    points = new Ellipse[numCoords];
  }

  void initialize() {

    /* now compute point locations automatically
     to do this we need to:
     
     1. determin how many points we need. this is decided by numPoints + 2
     2. the location for these points however will be numPoints unique locations.
     3. compute the unique locations by doing: x = r*sin(theta/numPoints*i), where i is the numPoint
     4. print them out and see what happens
     
     */
    int[] xcoords = new int[numCoords];
    int[] ycoords = new int[numCoords];

    for (int i=0; i<points.length; i++) {
      println("x,y location for point ", i, " :");
      println("x: ", radius * sin(TWO_PI/numPoints * i), "y: ", radius *cos(TWO_PI/numPoints * i));
      xcoords[i] = int(radius * sin(TWO_PI/numPoints * i));
      ycoords[i] = int(radius *cos(TWO_PI/numPoints * i));
    }
    
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
