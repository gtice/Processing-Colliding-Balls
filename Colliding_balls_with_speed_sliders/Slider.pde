class Slider {

  float x; //x location of beginning of slider
  float y; //y loc of slider
  float slength; //length of slider

  float min; //min speed of corresponding ball
  float max; //max speed of corresponding ball
  float current; //current speed of corresponding ball

  color sColor; //color of slider circle
  float circleRad = 15; //slider circle radius


  Slider(float startX, float startY, float startLength, float startMin, float startMax, float startCurrent, color startColor) {    
    x = startX;
    y = startY;
    slength = startLength;
    min = startMin;
    max = startMax;
    current = startCurrent;
    sColor = startColor;
  }

  void display() {
    stroke(0);
    strokeWeight(3);
    line(x, y, x+slength, y); //slider line

    //find current location of circle on slider
    float circleLoc =  x + slength* (current-min)/(max-min);
    fill(sColor);
    strokeWeight(2);
    ellipse(circleLoc, y, circleRad, circleRad);  //slider circle
  }
  
  //update current speed as slider is dragged with mouse
  void updateSlider(float circleX) {
    current = min + (max-min) * (circleX-x)/slength;    
  }



  //is the x location inside slider circle
  //used in mouseDragged with checking mouseX
  //ignores mouseY for a smoother slider operation
  //since it's so easy to drag the mouse outside of slider's y area
  boolean inXBounds(float px) {
    float circleLoc =  x + slength* (current-min)/(max-min);
    if (dist(px, y, circleLoc, y) < circleRad/2 && px > x && px < x + slength) {
      return true;
    } else {
      return false;
    }
  }



  //is this point inside the slider's circle and in between slider ends
  //used to check if mouse point is inside slider circle on mousePressed
  boolean inBounds(float px, float py) {
    float circleLoc =  x + slength* (current-min)/(max-min);
    if (dist(px, py, circleLoc, y) < circleRad/2 && px > x && px < x + slength) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
}