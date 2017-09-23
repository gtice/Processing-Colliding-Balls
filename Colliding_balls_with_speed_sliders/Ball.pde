class Ball {
  
  float x;
  float y;
  float size; //width and height
  float vx; //velocity of x
  float vy;  //velocity of y
  color ballColor;
  
  Ball(float startX, float startY, float startSize, float startVX, float startVY, color startColor) {    
   x = startX;
   y = startY;
   size = startSize;
   vx = startVX;
   vy = startVY;
   ballColor = startColor; 
  }
  
  void display() {
    fill(ballColor);
    ellipse(x,y, size,size);    
  }
  
  void move() {
    x = x + vx;
    y = y + vy;
    
     //left side of screen
    if (x - size/2 < 0) {
       vx = -vx;
    }
     //right side of screen
    if (x + size/2 > width) {
       vx = -vx;       
    }
    //top of screen
     if (y - size/2 <0) {
       vy = -vy;       
     }
     //bottom of screen
     if (y + size/2 > height) {
       vy = -vy;    
      }  
  }
  
  boolean collidesWith(Ball other) {
    //dist() is distance formula, 
    //if the distance between centers of the two balls is less that the sum of their radii
    //then the two balls are overlapping
    //and thus should bounce away from each other 
    return  dist(x,y, other.x, other.y) < size/2 + other.size/2;
    
  }
  
  
  void oppositeDirection() {
    vx = -vx;
    vy = -vy;
  }
  
  
  
  
  
}