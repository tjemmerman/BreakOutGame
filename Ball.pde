

class Ball {
   int x;
   int y;
   float av;

  Ball() {
   x = width/2;
   y = height/2;
  }
  
  void display() {
    fill(255,0,255);
    ellipse(x,y,10,10);
  } 
    
  boolean rectCircleIntersect(float rx, float ry, float rw, float rh) {
  float circleDistanceX = abs(x - rx);
  float circleDistanceY = abs(y - ry);
   
  if (circleDistanceX > (rw/2 + 5)) { return false; }
  if (circleDistanceY > (rh/2 + 5)) { return false; }
  if (circleDistanceX <= rw/2) { return true; } 
  if (circleDistanceY <= rh/2) { return true; }
  
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(5, 2);
  }
}
