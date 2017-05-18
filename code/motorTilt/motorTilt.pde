import org.openkinect.processing.*;

Kinect kinect; 

float angulo = 0;

void setup() {
   size(640, 480);
   kinect = new Kinect(this);
   kinect.initVideo(); 
   kinect.enableIR(true);
}

void draw() {
   background(0);
   
   PImage img = kinect.getVideoImage();
   image(img, 0, 0);
   
   // Angulo del motor
   kinect.setTilt(angulo);   
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      // Máximo 30
      if( angulo < 30 ){
        angulo += 1;
      }
    } else if (keyCode == DOWN) {
      // Mínimo 30
      if( angulo > -30 ){
        angulo -= 1;
      }
    }
    println(angulo);
  }
}