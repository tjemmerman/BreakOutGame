

class Paddle {
 int x; // x coord

  Paddle() {
    x = width/2;
  }

  void display() {
    rectMode(CENTER);
    fill(0);
    rect(x,height-20,100,20); 
  }
}


