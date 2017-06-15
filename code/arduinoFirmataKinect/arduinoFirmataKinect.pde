// Importar librerias
import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import processing.serial.*;
import cc.arduino.*;

// Objetos
KinectTracker tracker;
Kinect kinect;
Arduino arduino;

void setup() {
  size(640, 480);

  // Puerto donde está conectado el Arduino
  for (int i=0; i<Arduino.list().length; i++) {
    println(i +": "+ Arduino.list()[i] );
  } 
  arduino = new Arduino(this, Arduino.list()[5], 57600);

  // Configurar puertos
  arduino.pinMode(4, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
  
  // Inicializar kinect
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  background(255);

  // Analizar datos
  tracker.track();
  
  // Dibujar la imagen
  tracker.display();
  
  // Obtener posición
  PVector k = tracker.getPos();
  fill(50, 100, 250, 200);
  noStroke();
  ellipse(k.x, k.y, 20, 20);

  // Pasar posiciones al servo
  int x = floor( map(k.x, 0, 640, 0, 180) );
  x = constrain(x, 0, 180);
  
  int y = floor( map(k.y, 0, 480, 130, 60) );
  y = constrain(y, 60, 120);
  println(y);

  // Enviar datos al arduino
  arduino.servoWrite(7, x);
  arduino.servoWrite(4, y);
}


// Ajustar threshold
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}