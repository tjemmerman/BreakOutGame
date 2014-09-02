Paddle paddle;
import java.awt.*;
Rectangle[][] rectangles2d = new Rectangle[5][10];
int row=0;
int column=0;


void setup() {
  size (611,800);
  paddle = new Paddle();
  
    for(int i = 0; i < 5; i++) {
      for(int q = 0; q < 10; q++) {
       rectMode(CENTER);
       rectangles2d[i][q] = new Rectangle(31+(61*q),16+(31*i),60,30);
      }
    }
  
  
}

void draw() {
  background(255);
  if(mouseX<=50) {
    paddle.x = 50;
  }
  else if(mouseX>=550) {
    paddle.x = 550;
  }
  else {
    paddle.x = mouseX;
  }
  paddle.display();
  
    for(int i = 0;i<5;i++){
    for(int q = 0;q<10;q++){
      rectMode(CENTER);
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

