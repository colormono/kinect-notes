import org.openkinect.processing.*;

//Kinect2 kinect; 
Kinect kinect; 

void setup() {
   size(640, 480, P3D);
   kinect = new Kinect(this);
   kinect.initDepth();
   //kinect.initDevice(); // Sólo para kinect2
}

void draw() {
   background(0);
   
   PImage img = kinect.getDepthImage();
   //image(img, 0, 0);
   
   int size = 20;
   for(int x=0; x<img.width; x+=size){
     for(int y=0; y<img.height; y+=size){
       int index = x + y * img.width;
       float b = brightness(img.pixels[index]);
       float z = map(b, 0, 255, 250, -250);
       pushMatrix();
       translate(x, y, z);
       fill(b);
       rect(0, 0, size, size);
       popMatrix();
     }
   }
}