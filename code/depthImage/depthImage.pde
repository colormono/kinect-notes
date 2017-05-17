import org.openkinect.processing.*;

Kinect kinect; 
//Kinect2 kinect; 

void setup() {
   size(640, 480);
   kinect = new Kinect(this);
   kinect.initDepth(); // 
   //kinect.initDevice(); // Sólo para kinect2
}
//Kinect2 kinect; 

void draw() {
   background(0);
   
   PImage img = kinect.getDepthImage();
   image(img, 0, 0);
}

// Raw Depth values:
// v1 = 0 y 2048 (mm)
// v2 = 0 y 4500