Ball greenBall;
Ball redBall;
Slider redSlider;
Slider greenSlider;

//returns either 1 or -1
int randDirection() {
  return ((int) random(2) * 2 - 1);
}

void setup() {
  size(500, 500);

  float redStartSpeed = random(1, 6);
  redSlider = new Slider(5, 30, 140, 1, 11, redStartSpeed, #F5113B);  

  float greenStartSpeed = random(1, 6);
  greenSlider = new Slider(width/2 + 5, 30, 140, 1, 11, greenStartSpeed, #24E045);  

  //each ball starts with same start speed, but random direction
  greenBall = new Ball(100, 50, 75, randDirection()*greenStartSpeed, randDirection()*greenStartSpeed, #24E045);
  redBall = new Ball(200, 200, 75, randDirection()*redStartSpeed, randDirection()*redStartSpeed, #F5113B);
}


void mouseDragged() {

  //just check if x position of mouse is insider slider circle
  //makes for a lot smoother slider operation
  if (selected != null && selected.inXBounds(mouseX)) {

    selected.updateSlider(mouseX);
    //update vx and vy of selected ball
    selectedBall.vx = (selectedBall.vx < 0.0 ? -1*selected.current : selected.current);
    selectedBall.vy = (selectedBall.vy < 0.0 ? -1*selected.current : selected.current);
  }
}



Slider selected = null;
Ball selectedBall = null;

//check if mouse is on red circle, green circle, or neither 
void mousePressed() {
  if (redSlider.inBounds(mouseX, mouseY)) {
    selected = redSlider;
    selectedBall = redBall;
  } else if (greenSlider.inBounds(mouseX, mouseY)) {
    selected = greenSlider;   
    selectedBall = greenBall;
  } else {
    selected = null;
    selectedBall = null;
  }
}





void draw() {
  background(0);
  stroke(0);
  greenBall.display();
  redBall.display();
  greenBall.move();
  redBall.move();

  //bounce off of each other 
  if (greenBall.collidesWith(redBall)) {
    greenBall.oppositeDirection();
    redBall.oppositeDirection();
  }

  //draw menu
  fill(255, 200); //slightly transparent so top ball bounce is visible
  noStroke();
  rect(0, 0, width, 50); //menu area
  
  //red slider display
  fill(0);  
  text("Red Ball Speed: " + String.format("%.2f", redSlider.current), 5, 12);
  redSlider.display();

  //green slider display
  fill(0);
  text("Green Ball Speed: " + String.format("%.2f", greenSlider.current), width/2 + 5, 12);
  greenSlider.display();
}