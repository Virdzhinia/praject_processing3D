int cols, rows;
int scale = 20;
float[][] heights;
color[] pastelColors = {
  color(255, 255, 153), // pastel yellow
  color(173, 216, 230), // pastel blue
  color(255, 182, 193)  // pastel pink
};

void setup() {
  size(800, 800, P3D);
  noStroke();
  cols = width / scale;
  rows = height / scale;
  heights = new float[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      heights[i][j] = random(20, 100); // Initialize heights randomly within a range
    }
  }
}

void draw() {
  background(135, 206, 235); // Light blue background
  lights();

  // Control the angle of view based on mouse position
  float angleX = map(mouseX, 0, width, -PI, PI);
  float angleY = map(mouseY, 0, height, -PI, PI);
  translate(width / 2, height / 2);
  rotateX(-angleX);
  rotateY(-angleY);

  // Draw the grid of rectangles
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      pushMatrix();
      float x = i * scale - width / 2;
      float y = j * scale - height / 2;
      float h = heights[i][j];
      translate(x, y, h / 2); // Center the blocks vertically
      fill(pastelColors[(i + j) % pastelColors.length]); // Use a deterministic pattern for coloring
      box(scale, scale, h); // Create the box
      popMatrix();
    }
  }
}
