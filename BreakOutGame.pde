Paddle paddle;
import java.awt.*;
Rectangle[][] rectangles2d = new Rectangle[10][5];
int row=0;
int column=0;
Ball ball;
boolean stuffs = false;

void setup() {
  size (622,725);
  paddle = new Paddle();
  ball = new Ball();
    for(int i = 0; i < 10; i++) {
      for(int j = 0; j < 5; j++) {
       rectMode(CENTER);
       rectangles2d[i][j] = new Rectangle(31+(62*i),16+(32*j),60,30);
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
    for(int j = 0;j<5;j++){
      rectMode(CENTER);
      switch(j) {
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
      
      Rectangle tempRect = new Rectangle(rectangles2d[i][j]);
      rect(tempRect.x,tempRect.y,tempRect.width,tempRect.height); 
        
    if (ball.rectCircleIntersect(tempRect.x,tempRect.y,tempRect.width,tempRect.height)){
      println(ball.ipy);
      println(rectangles2d[i][j].y);
     if (ball.ipy<=rectangles2d[i][j].y+tempRect.height/2 && ball.yv <= 0) {
        ball.yv = ball.yv*-1;
        println("ducks");
      }
     else if (ball.ipy>=rectangles2d[i][j].y-tempRect.height/2 && ball.yv >= 0) {
        ball.yv = ball.yv*-1;
        println("and chickens");
      }
      else if (ball.ipx>=rectangles2d[i][j].x-tempRect.width/2 && ball.xv >= 0) {
        ball.xv = ball.xv*-1;
        
      }
      else if (ball.ipx<=rectangles2d[i][j].x+tempRect.width/2 && ball.xv <= 0) {
        ball.xv = ball.xv*-1;
        
      }
        rectangles2d[i][j].y-=1000;
        
    } 
   } 
  }    
    if (ball.rectCircleIntersect(paddle.x,height-20,100,20)) {
      if (ball.ipy <= height-30 && ball.yv>=0) {
        float pointOfContact = ball.ipx-(paddle.x-50);
        println(pointOfContact);
        float xvModifier = -1+((pointOfContact/25)*.5);
        println(xvModifier);
        ball.xv=(ball.xv*-1)+ball.yv*xvModifier;
        println(ball.xv);
        ball.yv=abs(ball.yv)*-1;
      }
    }
    if (ball.x<=5) {
      ball.xv = ball.xv*-1;
    }
    if (ball.x>=617) {
      ball.xv = ball.xv*-1;
    }
    if (ball.y<=5) {
      ball.yv = ball.yv*-1;
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

