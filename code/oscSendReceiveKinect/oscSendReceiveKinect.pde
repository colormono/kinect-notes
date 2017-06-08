// Valores para la profundidad en RAW:
// v1 = 0 y 2048
// v2 = 0 y 4500

import org.openkinect.processing.*;
import oscP5.*;
import netP5.*;

//Kinect2 kinect; 
Kinect kinect; 
OscP5 oscP5;
NetAddress myRemoteLocation;

// Imagen
PImage img;
PImage nuevaImg;

// Depth threshold
int threshold = 745;

// Contador de medios
int medios = 8;
int currentMediaSet = 0;

void setup() {
  size(640, 480);
  
  kinect = new Kinect(this);
  kinect.initDepth();
  //kinect.initDevice(); // Sólo para kinect2

  // crear una imagen en blanco
  nuevaImg = createImage(kinect.width, kinect.height, RGB);

  /* Escuchas mensaje en el puerto 9000 */
  oscP5 = new OscP5(this, 9000);

  /* Enviar mensajes "localmente" por el puerto 12000 */
  myRemoteLocation = new NetAddress("192.168.3.55", 12345);
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
    ellipse(sumX/count, sumY/count, 20, 20);
  }

  // Enviar mensajes
  
  // Opacidad (flotante entre 0 y 1)
  float opacidad = map(sumX/count, 0, width, 0, 1);
  OscMessage msgOpacidad = new OscMessage("/md8key/ctrl_layer_alpha/1");
  msgOpacidad.add(opacidad);
  oscP5.send(msgOpacidad, myRemoteLocation);
  
  // Media set
  int media = floor( map(sumY/count, 0, height, 0, medios) );

  // Cambiar sólo si es un video distinto al que se está reproduciendo
  if( media != currentMediaSet ){
    currentMediaSet = media;
    OscMessage myY = new OscMessage("/md8key/ctrl_layer_media/1");
    myY.add(currentMediaSet);
    oscP5.send(myY, myRemoteLocation);
  }
  
  // Dibujar grilla
  int paso = int(height/medios);
  for(int y=paso; y<height; y+=paso){
    stroke(255);
    strokeWeight(3);
    line(0, y, width, y);
  }
}


// Recibir mensajes
void oscEvent(OscMessage mensaje) {
  if( ! mensaje.equals(" /127.0.0.1:49549 | /md8key/ctrl_layer_alpha/0 f") ){
    println(" pattern: "+mensaje);
    println(" tipo: "+mensaje.typetag());
    println("-----");
  }
}