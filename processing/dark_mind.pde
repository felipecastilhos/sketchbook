void setup() {
  size(500, 500);
  background(255);
  smooth();
  noFill();
  stroke(0);
  strokeWeight(2);
}

void draw() {
  int numCircles = 2;
  
  for (int i = 0; i < numCircles; i++) {
    float x = random(width);
    float y = random(height);
    float size = random(20, 100);
    
    // Draw the circle
    ellipse(x, y, size, size);
    
    // Connect the circles with lines
    for (int j = 0; j < numCircles; j++) {
      if (i != j && random(1) < 0.5) {
        float x2 = random(width);
        float y2 = random(height);
        line(x, y, x2, y2);
      }
    }
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    // Save a screenshot of the canvas
    save("interconnected_circles.png");
  }
}
