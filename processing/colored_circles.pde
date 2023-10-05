void setup() {
  size(500, 500);
  background(0);
  noStroke();
  smooth();
}

void draw() {
  // Generate random position and size for the circle
  float x = random(width);
  float y = random(height);
  float size = random(10, 100);
  
  // Generate random color for the circle
  float r = random(255);
  float g = random(255);
  float b = random(255);
  
  // Draw the circle
  fill(r, g, b, 100);
  ellipse(x, y, size, size);
}

void keyPressed() {
  if (key == 's' || key == 'S') {
    // Save a screenshot of the canvas
    save("generative_art.png");
  }
}
