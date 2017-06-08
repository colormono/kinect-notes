import org.openkinect.processing.*;
import processing.video.*;
import blobDetection.*;

Kinect kinect; 
BlobDetection theBlobDetection;

// Imagenes
PImage img; // Imagen del kinect
PImage imgDepth; // Imagen procesada
PImage imgBlob; // Copia reducida de la imagen procesada

// Depth threshold
int threshold = 745;

void setup(){
  size(640, 480);

  kinect = new Kinect(this);
  kinect.initDepth(); 

  // crear una imagen en blanco
  imgDepth = createImage(kinect.width, kinect.height, RGB);

  // BlobDetection
  imgBlob = new PImage(80, 60); 
  theBlobDetection = new BlobDetection(imgBlob.width, imgBlob.height);
  theBlobDetection.setPosDiscrimination(true);
  theBlobDetection.setThreshold( 0.2f ); // Detectar areas con luminosidad mayor a > 0.2f;  
}

void draw(){
  background(0);

  // RAW data
  int[] depth = kinect.getRawDepth();
  
  // Imagen del kinect
  img = kinect.getVideoImage();
  
  imgDepth.loadPixels();
  for (int x=0; x<img.width; x++) {
    for (int y=0; y<img.height; y++) {
      int index = x + y * img.width;

      // profundidad del punto
      int d = depth[index];

      // si está en el rango visible
      if (d < threshold) {
        // pintar blanco
        imgDepth.pixels[index] = color(255);
      } else {
        imgDepth.pixels[index] = color(0);
      }
      
    }
  }
  imgDepth.updatePixels();
  image(imgDepth, 0, 0);
  

  imgBlob.copy(imgDepth, 0, 0, imgDepth.width, imgDepth.height, 
    0, 0, imgBlob.width, imgBlob.height);
  fastblur(imgBlob, 2);
  theBlobDetection.computeBlobs(imgBlob.pixels);
  drawBlobsAndEdges(true, true);
}


// ==================================================
// drawBlobsAndEdges()
// ==================================================
void drawBlobsAndEdges(boolean drawBlobs, boolean drawEdges){
  Blob b;
  EdgeVertex eA, eB;
  
  for (int n=0; n<theBlobDetection.getBlobNb(); n++) {
    b=theBlobDetection.getBlob(n);
    noFill();
    
    if (b!=null){
      
      // Contorno
      if (drawEdges){
        strokeWeight(3);
        stroke(0, 255, 0);
        for (int m=0; m<b.getEdgeNb(); m++){
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(eA.x*width, eA.y*height, eB.x*width, eB.y*height);
        }
      }

      // Marco
      if (drawBlobs){
        float posXBlob = b.xMin*width;
        float posYBlob = b.yMin*height;
        float anchoBlob = b.w*width;
        float altoBlob = b.h*height;
        
        strokeWeight(1);
        stroke(255, 0, 0);
        rect(posXBlob, posYBlob, anchoBlob, altoBlob);

        // ID
        fill(0,0,255);
        text(n, posXBlob+anchoBlob/2, posYBlob+altoBlob/2);
      }

    }
  }
}


// ==================================================
// Super Fast Blur v1.1
// by Mario Klingemann 
// <http://incubator.quasimondo.com>
// ==================================================
void fastblur(PImage img, int radius)
{
  if (radius<1) {
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum, gsum, bsum, x, y, i, p, p1, p2, yp, yi, yw;
  int vmin[] = new int[max(w, h)];
  int vmax[] = new int[max(w, h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0; i<256*div; i++) {
    dv[i]=(i/div);
  }

  yw=yi=0;

  for (y=0; y<h; y++) {
    rsum=gsum=bsum=0;
    for (i=-radius; i<=radius; i++) {
      p=pix[yi+min(wm, max(i, 0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
    }
    for (x=0; x<w; x++) {

      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if (y==0) {
        vmin[x]=min(x+radius+1, wm);
        vmax[x]=max(x-radius, 0);
      }
      p1=pix[yw+vmin[x]];
      p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }

  for (x=0; x<w; x++) {
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for (i=-radius; i<=radius; i++) {
      yi=max(0, yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0; y<h; y++) {
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if (x==0) {
        vmin[y]=min(y+radius+1, hm)*w;
        vmax[y]=max(y-radius, 0)*w;
      }
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }
}