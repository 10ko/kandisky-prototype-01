import java.util.*;
import processing.serial.*;
import cc.arduino.*;

int width = 640;
int height = 480;
List<KCircle> kCircleList;
Arduino arduino;

public void setup() {
  size(width, height);
  background(153);
  kCircleList = new ArrayList<KCircle>();
  
  // Adding a new circle.
  // parameters are: posX,posY,radius,fillingColor,arduinoDigitalPin.
  kCircleList.add(new KCircle(350,300,150,color(240, 0, 0),2));
  
 // Initialize arduino.
  arduino = new Arduino(this, Arduino.list()[0], 57600);  
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

public void draw() {
  processCircles(kCircleList);
}


private void processCircles(List<KCircle> circleList){
  // loop through the circles list and draw each one of them.
  for(KCircle kCircle : circleList){  
    beginShape();    
    //If you want to change from digital to analog, this is the line to change.
    // You'll probably need to write some logic to handle the threshold as well.
    if(arduino.digitalRead(kCircle.getInputPin()) == Arduino.HIGH)
      fill(kCircle.getFill()); // if pin is active fill with the color assigned to the circle.
    else
      fill(153); // if not active fill with the background color
    stroke(10,10,10); // color of the border
    // drawing the circles
    ellipse(kCircle.getPosX(), kCircle.getPosY(), kCircle.getRadius(), kCircle.getRadius());
    endShape();
  }
}


