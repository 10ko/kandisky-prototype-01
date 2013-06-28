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
  kCircleList.add(new KCircle(50,50,50,color(240, 0, 0),2));
  kCircleList.add(new KCircle(350,300,150,color(240, 0, 0),2));
  kCircleList.add(new KCircle(60,150,20,color(240, 0, 0),2));
  arduino = new Arduino(this, Arduino.list()[0], 57600);  
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

public void draw() {
  processCircles(kCircleList);
}


private void processCircles(List<KCircle> circleList){
  for(KCircle kCircle : circleList){
    beginShape();
    if(arduino.digitalRead(kCircle.getInputPin()) == Arduino.HIGH)
      fill(kCircle.getFill());
    else
      noFill();
    stroke(10,10,10);
    ellipse(kCircle.getPosX(), kCircle.getPosY(), kCircle.getRadius(), kCircle.getRadius());
    endShape();
  }
}

