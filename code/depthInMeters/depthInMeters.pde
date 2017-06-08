// Valores para la profundidad en RAW:
// v1 = 0 y 2048
// v2 = 0 y 4500

import org.openkinect.processing.*;

//Kinect2 kinect; 
Kinect kinect; 

// Depth threshold
int threshold = 1500;

// Imagen
PImage img;
PImage nuevaImg;

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  kinect.initDepth();
  // crear una imagen en blanco
  nuevaImg = createImage(kinect.width, kinect.height, RGB);
}

void draw() {
  background(0);

  // RAW data
  int[] depth = kinect.getRawDepth();

  // Imagen
  img = kinect.getDepthImage();

  // Contadores
  float distancia = 2;
  int record = 0;  
  float sumX = 0;
  float sumY = 0;
  float count = 0;

  nuevaImg.loadPixels();
  for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
      int index = x + y * img.width;

      // profundidad del punto
      int d = depth[index];
      //distancia = rawDepthToMeters(d);

      // si está en el rango visible
      if (d < threshold) {
        // pintar verde
        nuevaImg.pixels[index] = color(0, 255, 0);

        // Evaluar el punto más cerca
        if (d > record) {
          // hay un nuevo record!
          record = d;
          distancia = d;
        }

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
    fill(255, 0, 0);
    line(sumX/count, 0, sumX/count, height);
    line(0, sumY/count, width, sumY/count);
    ellipse(sumX/count, sumY/count, 50, 50);

    fill(255);
    textSize(18);
    text(distancia, 20, 40);
    text(record, 20, 80);
  }
}

// These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}

// Debug
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      threshold += 10;
    } else if (keyCode == DOWN) {
      threshold -= 10;
    }
    println(threshold);
  }
}