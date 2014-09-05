

class Ball {
  float x;
  float y;
  float xv;
  float yv;
  float ipx;
  float ipy;
   
  Ball() {
   x = width/2;
   y = height/2;
   xv = 0;
   yv = 0;
   
  }
  
  void display() {
    x+=xv;
    y+=yv;
    fill(255,0,255);
    noStroke();
    ellipse(x,y,10,10);
  } 
    
  boolean rectCircleIntersect(float rx, float ry, float rw, float rh) {
    float circleDistanceX = abs(x - rx);
    float circleDistanceY = abs(y - ry);

    if (circleDistanceX > (rw/2 + 5)) { 
      return false;
    }
    if (circleDistanceY > (rh/2 + 5)) { 
      return false; 
    }
    if (circleDistanceX <= rw/2) {
      if (y > ry) {
        ipx = x;
        ipy = y-5;
      }
      else if (y < ry) {
        ipx = x;
        ipy = y+5;
      }
      return true; 
    } 
    if (circleDistanceY <= rh/2) {
      if (x > rx) {
        ipx = x-5;
        ipy = y;
      }
      else if (x < rx) {
        ipx = x+5;
        ipy = y;
      }
      return true; 
    }
    else {
      float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
      int cornerDistanceX = int(circleDistanceX - rw/2);
      int cornerDistanceY = int(circleDistanceY - rh/2);
      if (x < rx && y < ry) {
        ipx = x+cornerDistanceX;
        ipy = y+cornerDistanceY;
      }
      if (x < rx && y > ry) {
        ipx = x+cornerDistanceX;
        ipy = y-cornerDistanceY;
      }
      if (x > rx && y > ry) {
        ipx = x-cornerDistanceX;
        ipy = y-cornerDistanceY;
      }
      if (x > rx && y < ry) {
        ipx = x-cornerDistanceX;
        ipy = y+cornerDistanceY;
      }
      return cornerDistance <= pow(5, 2);
    }
  }
}
