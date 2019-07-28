//Panorama and Gaze 
//2018
// code by jiangzhuyun 


import gazetrack.*;
GazeTrack gazeTrack;

PImage myPic;
float x, y;
float offset;
float ratioW, ratioH;
float gazeX, gazeY;
float targetX, targetY;


void setup() {
  size(1024, 768);

  myPic = loadImage("IMG_2936.JPG");
  gazeX = width/2;
  gazeY = height/2+10;

  gazeTrack = new GazeTrack(this);
}


void draw() {
  noCursor();
  background(0);
  imageMode(CENTER);
   if (gazeTrack.gazePresent() && gazeTrack.getTimestamp() > 0 ) {
    targetX = constrain(map(gazeTrack.getGazeX(), 0, displayWidth, width, 0), 100, width);
    targetY = constrain(map(gazeTrack.getGazeY(), 0, displayHeight, height, 0), 0, height);
  } else {
    targetX = width/2;
    targetY = height/2+20;
  }

  x = lerp(x, targetX, 0.05);
  y = lerp(y, targetY, 0.05);

  gazeX = map(x, 0, width, myPic.width/2, width-(myPic.width/2));
  gazeY = map(y, 0, height, myPic.height/2, height-(myPic.height/2));


  image(myPic, gazeX, gazeY);
}
