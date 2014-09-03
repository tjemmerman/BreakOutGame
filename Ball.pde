

class Ball {
  int x;
  int y;
  int xv;
  int yv;
  Point intersectPoint;
   
  Ball() {
   x = width/2;
   y = height/2;
   xv = 0;
   yv = 1;
  }
  
  void display() {
    x+=xv;
    y+=yv;
    fill(255,0,255);
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
        intersectPoint = new Point(x,y-5);
        println(intersectPoint);
      }
      else if (y < ry) {
        intersectPoint = new Point(x,y+5);
      }
      return true; 
    } 
    if (circleDistanceY <= rh/2) {
      if (x > rx) {
        intersectPoint = new Point(x-5,y);
        println(intersectPoint);
      }
      else if (x < rx) {
        intersectPoint = new Point(x+5,y);
      }
      return true; 
    }
    else {
      float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
      int cornerDistanceX = int(circleDistanceX - rw/2);
      int cornerDistanceY = int(circleDistanceY - rh/2);
      if (x < rx && y < ry) {
        intersectPoint = new Point(x+cornerDistanceX,y+cornerDistanceY);
      }
      if (x < rx && y > ry) {
        intersectPoint = new Point(x+cornerDistanceX,y-cornerDistanceY);
      }
      if (x > rx && y > ry) {
        intersectPoint = new Point(x-cornerDistanceX,y-cornerDistanceY);
      }
      if (x > rx && y < ry) {
        intersectPoint = new Point(x-cornerDistanceX,y+cornerDistanceY);
      }
      return cornerDistance <= pow(5, 2);
    }
  }
}
