Paddle paddle;
import java.awt.*;
Rectangle[][] rectangles2d = new Rectangle[10][5];
int row=0;
int column=0;
Ball ball;
boolean stuffs = false;
boolean paused;
int tempMouseX;
int tempMouseY;
Player player;
boolean launched;
int destroyedBricks;

void setup() {
  size (622,725);
  paddle = new Paddle();
  ball = new Ball();
  player = new Player();
    for(int i = 0; i < 10; i++) {
      for(int j = 0; j < 5; j++) {
       rectMode(CENTER);
       rectangles2d[i][j] = new Rectangle(31+(62*i),16+(32*j),60,30);
      }
    }
    launched = false;
    ball.y = height-35;
    noLoop();
 
}

void draw() {
  background(255);
  ball.display();
  if (destroyedBricks>=50) {
    exit();
  }
  if (ball.y >= 725) {
    player.lives -= 1;
    ball.x = width/2;
    ball.y = height/2; 
  }
  if (player.lives<=0) {
    exit();
  }
  if (launched) {
  if(mouseX<=50) {
    paddle.x = 50;
  }
  else if(mouseX>=571) {
    paddle.x = 571;
  }
  else {
    paddle.x = mouseX;
  }
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
      
      rect(rectangles2d[i][j].x,rectangles2d[i][j].y,rectangles2d[i][j].width,rectangles2d[i][j].height); 
      
      if (ball.rectCircleIntersect(rectangles2d[i][j].x,rectangles2d[i][j].y,rectangles2d[i][j].width,rectangles2d[i][j].height)){
        if (ball.vertical) {
          ball.yv = ball.yv*-1;
        }
        else {
          ball.xv = ball.xv*-1;
        }
        rectangles2d[i][j].y = -1000;
        destroyedBricks += 1; 
      } 
    }
  }  
  if (ball.rectCircleIntersect(paddle.x,height-20,100,20)) {
    if (ball.ipy >= height-30 && ball.yv>=0) {
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
  ball.x=width/2;
  ball.y=height/2;
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
 if(key == 'p') {
   if(paused) {
     paused = !paused;
     loop();
     mouseX = tempMouseX;
     mouseY = tempMouseY;
   }
   else {
     paused = !paused;
     tempMouseX = mouseX;
     tempMouseY = mouseY;
     noLoop();
   }
 }
 if (key == ' ') {
  ball.yv = -2;
  launched = true;
 loop(); 
 }
}

