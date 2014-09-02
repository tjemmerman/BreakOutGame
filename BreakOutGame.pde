Paddle paddle;
import java.awt.*;
Rectangle[][] rectangles2d = new Rectangle[10][5];
int row=0;
int column=0;


void setup() {
  size (622,800);
  paddle = new Paddle();
  
    for(int i = 0; i < 10; i++) {
      for(int q = 0; q < 5; q++) {
       rectMode(CENTER);
       rectangles2d[i][q] = new Rectangle(31+(62*i),16+(32*q),60,30);
      }
    }
  
  
}

void draw() {
  background(255);
  if(mouseX<=50) {
    paddle.x = 50;
  }
  else if(mouseX>=571) {
    paddle.x = 571;
  }
  else {
    paddle.x = mouseX;
  }
  paddle.display();
  
    for(int i = 0;i<10;i++){
    for(int q = 0;q<5;q++){
      rectMode(CENTER);
            if (q == 0) {
        fill(255,0,0);
      }
      else if (q == 1) {
        fill(0,255,0);
      }
      else if(q == 2) {
        fill(0,0,255);
      }
      else if(q == 3) {
        fill(0);
      }
      else if(q == 4) {
        fill(255,255,0);
      }
      Rectangle tempRect = new Rectangle(rectangles2d[i][q]);
      rect(tempRect.x,tempRect.y,tempRect.width,tempRect.height);
  }
  }
}

void mousePressed() {
  rectangles2d[row][column].x = -1000;
  rectangles2d[row][column].y = -1000;
  row++;
  if(row >= 5)
  {
    row = 0;
    column++;
  }
}

