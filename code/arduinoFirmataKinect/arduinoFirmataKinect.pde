/*
arduino_servo
 
 Demonstrates the control of servo motors connected to an Arduino board
 running the StandardFirmata firmware.  Moving the mouse horizontally across
 the sketch changes the angle of servo motors on digital pins 4 and 7.  For
 more information on servo motors, see the reference for the Arduino Servo
 library: http://arduino.cc/en/Reference/Servo
 
 To use:
 * Using the Arduino software, upload the StandardFirmata example (located
 in Examples > Firmata > StandardFirmata) to your Arduino board.
 * Run this sketch and look at the list of serial ports printed in the
 message area below. Note the index of the port corresponding to your
 Arduino board (the numbering starts at 0).  (Unless your Arduino board
 happens to be at index 0 in the list, the sketch probably won't work.
 Stop it and proceed with the instructions.)
 * Modify the "arduino = new Arduino(...)" line below, changing the number
 in Arduino.list()[0] to the number corresponding to the serial port of
 your Arduino board.  Alternatively, you can replace Arduino.list()[0]
 with the name of the serial port, in double quotes, e.g. "COM5" on Windows
 or "/dev/tty.usbmodem621" on Mac.
 * Connect Servos to digital pins 4 and 7.  (The servo also needs to be
 connected to power and ground.)
 * Run this sketch and move your mouse horizontally across the screen.
 
 For more information, see: http://playground.arduino.cc/Interfacing/Processing
 */

import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

void setup() {
  size(640, 480);

  // Prints out the available serial ports.
  for (int i=0; i<Arduino.list().length; i++) {
    println(i +": "+ Arduino.list()[i] );
  } 

  // Puerto donde está conectado el Arduino
  arduino = new Arduino(this, Arduino.list()[5], 57600);

  // Configurar puertos
  arduino.pinMode(4, Arduino.SERVO);
  arduino.pinMode(7, Arduino.SERVO);
}

void draw() {
  background(constrain(mouseX / 2, 0, 180));

  int x = floor( map(mouseX, 0, 640, 0, 180) );
  x = constrain(x, 0, 180);
  
  int y = floor( map(mouseY, 0, 480, 60, 120) );
  y = constrain(y, 60, 120);
  println(y);

  // Write an value to the servos, telling them to go to the corresponding
  // angle (for standard servos) or move at a particular speed (continuous
  // rotation servos).
  arduino.servoWrite(7, x);
  arduino.servoWrite(4, y);
}