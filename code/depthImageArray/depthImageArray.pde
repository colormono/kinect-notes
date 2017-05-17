import org.openkinect.processing.*;

//Kinect2 kinect; 
Kinect kinect; 

void setup() {
   size(640,480);
   kinect = new Kinect(this);
   kinect.initDepth();
   //kinect.initDevice(); // Sólo para kinect2
}

void draw() {
   background(0);
   
   PImage img = kinect.getDepthImage();
   image(img, 0, 0);
   
   int size = 20;
   for(int x=0; x<img.width; x+=size){
     for(int y=0; y<img.height; y+=size){
       int index = x + y * img.width;
       float b = brightness(img.pixels[index]);
       fill(b);
       rect(x, y, size, size);
     }
   }
}