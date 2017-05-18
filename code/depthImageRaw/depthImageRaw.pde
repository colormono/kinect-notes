// Valores para la profundidad en RAW:
// v1 = 0 y 2048
// v2 = 0 y 4500

import org.openkinect.processing.*;

//Kinect2 kinect; 
Kinect kinect; 

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  //kinect.initDevice(); // Sólo para kinect2
}

void draw() {
  background(0);

  PImage img = kinect.getDepthImage();
  image(img, 0, 0);

  // RAW data
  int[] depth = kinect.getRawDepth();

  noStroke();
  int size = 5;
  for (int x=0; x<img.width; x+=size) {
    for (int y=0; y<img.height; y+=size) {
      int index = x + y * img.width;

      // profundidad del punto
      int d = depth[index];
      float p = map(d, 0, 2048, 0, 255);

      fill(p);
      rect(x, y, size, size);
    }
  }
}