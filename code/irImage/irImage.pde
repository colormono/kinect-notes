import org.openkinect.processing.*;

Kinect kinect; 
//Kinect2 kinect; 

void setup() {
   size(640, 480);
   kinect = new Kinect(this);
   //kinect.initDevice(); // Sólo para kinect2
   kinect.initVideo(); 
   kinect.enableIR(true);
}

void draw() {
   background(0);
   
   PImage img = kinect.getVideoImage();
   image(img, 0, 0);
      
   // La v1 sólo toma un tipo de imagen a la vez, la v2 puede tomar ambas
   //PImage video = kinect2.getVideoImage();
   //image(video, 0, 0);
   //PImage ir = kinect2.getIrImage();
   //image(ir, 0, 0);
}