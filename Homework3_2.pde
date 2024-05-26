int cols, rows;
int scale = 20;
float[][] heights;
color[] pastelColors = {
  color(255, 255, 153), 
  color(173, 216, 230), 
  color(255, 182, 193) 
};
int snapshotsTaken = 0; 
boolean saveNextFrame = false; 

void setup() {
  size(800, 800, P3D);
  noStroke();
  cols = width / scale;
  rows = height / scale;
  heights = new float[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      heights[i][j] = random(20, 100); 
    }
  }
}

void draw() {
  background(135, 206, 235); 
  lights();

 
  float angleX = map(mouseX, 0, width, -PI, PI);
  float angleY = map(mouseY, 0, height, -PI, PI);
  translate(width / 2, height / 2);
  rotateX(-angleX);
  rotateY(-angleY);

 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      pushMatrix();
      float x = i * scale - width / 2;
      float y = j * scale - height / 2;
      float h = heights[i][j];
      translate(x, y, h / 2); 
      fill(pastelColors[(i + j) % pastelColors.length]); 
      box(scale, scale, h); 
      popMatrix();
    }
  }


  if (saveNextFrame && snapshotsTaken < 9) {
    saveFrame("snapshot-######.png");
    snapshotsTaken++;
    saveNextFrame = false; 
  }
}


void mousePressed() {
  if (snapshotsTaken < 9) {
    saveNextFrame = true;
  }
}
