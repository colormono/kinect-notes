import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int currentMediaSet = 0;

void setup() {
  size(640, 480);
  frameRate(25);

  /* Escuchas mensaje en el puerto 9000 */
  oscP5 = new OscP5(this, 12347);

  /* Enviar mensajes "localmente" por el puerto 12000 */
  myRemoteLocation = new NetAddress("localhost", 12345);
}

void draw() {
  background(0);  

  // Enviar mensaje: Opacidad
  // Controlar opacidad (flotante entre 0 y 1)
  float x = map(mouseX, 0, width, 0, 1);
  OscMessage msgOpacidad = new OscMessage("/md8key/ctrl_layer_alpha/1");
  msgOpacidad.add(x);
  oscP5.send(msgOpacidad, myRemoteLocation);
}

void mousePressed() {
  // Enviar mensaje
  // Cambiar media set (int < 16)
  OscMessage myY = new OscMessage("/md8key/ctrl_layer_media/1");
  myY.add(currentMediaSet);
  oscP5.send(myY, myRemoteLocation);
  currentMediaSet++;
  if(currentMediaSet>15){ currentMediaSet = 0; }
}


// Recibir mensajes
void oscEvent(OscMessage mensaje) {
  if( ! mensaje.equals(" /127.0.0.1:49549 | /md8key/ctrl_layer_alpha/0 f") ){
    println(" pattern: "+mensaje);
    println(" tipo: "+mensaje.typetag());
    println("-----");
  }
}