// Valores para la profundidad en RAW:
// v1 = 0 y 2048
// v2 = 0 y 4500
import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

// Limites
int minDepth =  50;
int maxDepth = 350;

// Imagenes
PImage depthImg;
PImage videoImg;
boolean showIr = false;
float motorTilt;


void setup() {
  size(640, 480);
  kinect = new Kinect(this);  
  kinect.initVideo();
  kinect.initDepth();
  kinect.enableMirror(true);
  motorTilt = kinect.getTilt();

  // Imagen de profundidad
  depthImg = new PImage(kinect.width, kinect.height);
}

void draw() {
  // Dibujar el fondo
  kinect.enableIR(showIr);
  image(kinect.getVideoImage(), 0, 0);


  // RAW data
  int[] depth = kinect.getRawDepth();

  noStroke();
  int size = 5;
  for (int x=0; x<depthImg.width; x+=size) {
    for (int y=0; y<depthImg.height; y+=size) {
      int index = x + y * depthImg.width;

      // profundidad del punto
      int d = depth[index];
      float p = map(d, 0, 2048, 0, 1000);

      // Pintar sólo lo que está dentro del rango
      if (p >= minDepth && p <= maxDepth) {
        int r = floor(random(0, 255));
        int g = floor(random(0, 255));
        int b = floor(random(0, 255));
        fill(r,g,b);
        rect(x, y, size, size);
      }
    }
  }

  // Notas para debug
  fill(0,255,0);
  text("TILT: " + motorTilt, 10, 20);
  text("LIMITES: [adelante: " + minDepth + ", fondo: " + maxDepth + "]", 10, 36);
}

// Debug
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      motorTilt++;
    } else if (keyCode == DOWN) {
      motorTilt--;
    }
    motorTilt = constrain(motorTilt, 0, 30);
    kinect.setTilt(motorTilt);
  } else if (key == 'd') {
    showIr = !showIr;
  } else if (key == 'a') {
    minDepth = constrain(minDepth+10, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-10, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+10, minDepth, 2047);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-10, minDepth, 2047);
  }
}