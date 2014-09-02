Paddle paddle;
import java.awt.*;
Rectangle[][] rectangles2d = new Rectangle[10][5];
int row=0;
int column=0;
Ball ball;


void setup() {
  size (622,800);
  paddle = new Paddle();
  ball = new Ball();
    for(int i = 0; i < 10; i++) {
      for(int q = 0; q < 5; q++) {
       rectMode(CENTER);
       rectangles2d[i][q] = new Rectangle(31+(62*i),16+(32*q),60,30);
      }
    }
  
  
}

void draw() {
  background(255);
  ball.display();
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
      switch(q) {
        case 0:
          fill(255,0,0);
          break;
        case 1:
          fill(255,255,0);
          break;
        case 2:
          fill(0,255,0);
          break;
        case 3:
          fill(0,255,255);
          break;
        case 4:
          fill(0,0,255);
          break;
      }

      Rectangle tempRect = new Rectangle(rectangles2d[i][q]);
      rect(tempRect.x,tempRect.y,tempRect.width,tempRect.height); 
      if (ball.rectCircleIntersect(tempRect.x-30,tempRect.y-15,tempRect.width,tempRect.height)){
        rectangles2d[i][q]=new Rectangle();
      }
        
  }
  }
}

void mousePressed() {
  rectangles2d[column][row].x = -1000;
  rectangles2d[column][row].y = -1000;
  column++;
  if(column >= 10)
  {
    column = 0;
    row++;
  }
}

void keyPressed() {
 if(keyCode ==  UP) {
   ball.y-=5;
 }
 if(keyCode == DOWN) {
   ball.y+=5;
 }
 if(keyCode == LEFT) {
   ball.x-=5;
 }
 if(keyCode == RIGHT) {
   ball.x+=5;
 }
}

