import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int currentMediaSet = 1;

void setup() {
  size(100, 10);
  frameRate(25);

  /* Escuchas mensaje en el puerto 9000 */
  oscP5 = new OscP5(this, 12347);

  /* Enviar mensajes "localmente" por el puerto 12000 */
  myRemoteLocation = new NetAddress("localhost", 7000);
}

void draw() {
  background(0);  

  // Enviar mensaje: Strobo (flotante entre 0 y 1)
  float x = map(mouseX, 0, width, 0, 1);
  OscMessage msgStrobo = new OscMessage("/composition/link3/values");
  msgStrobo.add(x);
  oscP5.send(msgStrobo, myRemoteLocation);
}

void mousePressed() {
  // Enviar mensaje
  // Cambiar media set (int < 16)
  OscMessage layer = new OscMessage("/layer1/clip"+currentMediaSet+"/connect");
  layer.add(1);
  oscP5.send(layer, myRemoteLocation);

  currentMediaSet++;
  if(currentMediaSet>5){ currentMediaSet = 1; }
}

// Recibir mensajes
void oscEvent(OscMessage mensaje) {
  if( ! mensaje.equals(" /127.0.0.1:49549 | /md8key/ctrl_layer_alpha/0 f") ){
    println(" pattern: "+mensaje);
    println(" tipo: "+mensaje.typetag());
    println("-----");
  }
}