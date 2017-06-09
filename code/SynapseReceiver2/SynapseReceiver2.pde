//
// a template for receiving kinect skeleton tracking osc messages from
// Ryan Challinor's Synapse for Kinect application:
// http://synapsekinect.tumblr.com/post/6307790318/synapse-for-kinect
//
// this example includes a class to abstract the Skeleton data
//
// 2012 Dan Wilcox danomatika.com
// for the IACD Spring 2012 class at the CMU School of Art
//
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

// our Synapse tracked skeleton data
Skeleton skeleton = new Skeleton();

void setup() {
  size(640, 480);
  frameRate(30);

  oscP5 = new OscP5(this, 12347);

  /* Enviar mensajes "localmente" por el puerto 12000 */
  myRemoteLocation = new NetAddress("localhost", 7000);
}

void draw() {  
  background(255);
  rectMode(CENTER);

  // update and draw the skeleton if it's being tracked
  skeleton.update(oscP5);
  if (skeleton.isTracking()) {

    PVector v;  // a temp vector to use for joint positions
    Joint j = null;    // a temp Joint
    stroke(0);
    strokeWeight(2);
    noFill();

    // head
    v = skeleton.getJoint("head").posScreen;
    ellipse(v.x, v.y, 100, 100);

    // torso
    beginShape();
    v = skeleton.getJoint("leftshoulder").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("rightshoulder").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("righthip").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("lefthip").posScreen;
    vertex(v.x, v.y);
    endShape(CLOSE);

    PVector posManoI;
    PVector posManoD;

    // left arm
    beginShape(LINES);
    v = skeleton.getJoint("leftshoulder").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("leftelbow").posScreen;
    vertex(v.x, v.y);
    vertex(v.x, v.y);
    j = skeleton.getJoint("lefthand");
    v = j.posScreen;
    posManoI = v;
    vertex(v.x, v.y);
    endShape(); 
    // draw a green hand if a hit movement was detected
    if (j.hitDetected())
      fill(0, 255, 0);
    else
      noFill();
    rect(v.x, v.y, 20, 20);

    // right arm
    beginShape(LINES);
    v = skeleton.getJoint("rightshoulder").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("rightelbow").posScreen;
    vertex(v.x, v.y);
    vertex(v.x, v.y);
    j = skeleton.getJoint("righthand");
    v = j.posScreen;
    posManoD = v;
    vertex(v.x, v.y);
    endShape();
    // draw a green hand if a hit movement was detected
    if (j.hitDetected())
      fill(0, 255, 0);
    else
      noFill();
    rect(v.x, v.y, 20, 20);


    // Dibujo los circulos de las manos
    fill(0, 0, 255);
    ellipse(posManoI.x, posManoI.y, 10, 10);
    ellipse(posManoD.x, posManoD.y, 10, 10);

    //Linea entre las manos
    strokeWeight(4);
    stroke(255, 0, 0);
    line(posManoI.x, posManoI.y, posManoD.x, posManoD.y);

    // calcular distancia (y normalizarla)
    float distancia = dist(posManoI.x, posManoI.y, posManoD.x, posManoD.y);
    float strobo = map(distancia, 0, 500, 0, 1);
    textSize(24);
    text(strobo, 20, 60);

    // Enviar mensaje: Strobo (flotante entre 0 y 1)
    OscMessage msgStrobo = new OscMessage("/composition/link3/values");
    msgStrobo.add(distancia);
    oscP5.send(msgStrobo, myRemoteLocation);

    // legs
    beginShape(LINES);
    v = skeleton.getJoint("lefthip").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("leftknee").posScreen;
    vertex(v.x, v.y);
    vertex(v.x, v.y);
    v = skeleton.getJoint("leftfoot").posScreen;
    vertex(v.x, v.y);
    endShape();
    rect(v.x, v.y, 40, 20);
    beginShape(LINES);
    v = skeleton.getJoint("righthip").posScreen;
    vertex(v.x, v.y);
    v = skeleton.getJoint("rightknee").posScreen;
    vertex(v.x, v.y);
    vertex(v.x, v.y);
    v = skeleton.getJoint("rightfoot").posScreen;
    vertex(v.x, v.y);
    endShape();
    rect(v.x, v.y, 40, 20);

    // draw a red circle on the closest hand
    noStroke();
    fill(255, 0, 0);
    v = skeleton.getJoint("closesthand").posScreen;
    ellipse(v.x, v.y, 10, 10);

    println(skeleton.toString());
  }
}

// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  skeleton.parseOSC(m);
}