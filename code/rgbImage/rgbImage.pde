import org.openkinect.processing.*;

Kinect kinect; 
//Kinect2 kinect; 

void setup() {
   size(640, 480);
   kinect = new Kinect(this);
   kinect.initVideo(); 
   //kinect.initDevice(); // Sólo para kinect2
}

void draw() {
   background(0);
   
   PImage img = kinect.getVideoImage();
   image(img, 0, 0);
}