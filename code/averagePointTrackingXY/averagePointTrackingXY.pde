// Valores para la profundidad en RAW:
// v1 = 0 y 2048
// v2 = 0 y 4500

import org.openkinect.processing.*;

//Kinect2 kinect; 
Kinect kinect; 

// Imagen
PImage img;
PImage nuevaImg;

// Depth threshold
int threshold = 745;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  //kinect.initDevice(); // Sólo para kinect2

  // crear una imagen en blanco
  nuevaImg = createImage(kinect.width, kinect.height, RGB);
}

void draw() {
  background(0);

  // RAW data
  int[] depth = kinect.getRawDepth();
  
  // Contadores
  float sumX = 0;
  float sumY = 0;
  float count = 0;
  
  // Imagen
  img = kinect.getDepthImage();
  
  nuevaImg.loadPixels();
  for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
      int index = x + y * img.width;

      // profundidad del punto
      int d = depth[index];

      // si está en el rango visible
      if (d < threshold) {
        // pintar verde
        nuevaImg.pixels[index] = color(0, 255, 0);
        // incrementar contadores
        sumX += x;
        sumY += y;
        count++;
      } else {
        nuevaImg.pixels[index] = color(0, 0, 255);
      }
    }
  }
  nuevaImg.updatePixels();
  image(nuevaImg, 0, 0);

  // Si encontró algo
  if (count != 0) {
    fill(255,0,0);
    ellipse(sumX/count, sumY/count, 50, 50);
  }
}