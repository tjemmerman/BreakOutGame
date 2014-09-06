
// PRESS 'SPACEBAR' FOR THE BALL TO START MOVEING

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
int time;
int wait = 5000;
int gameOver = 0;
color gameOverButtonColor;
PFont sentenceFont;

void setup() {
  size (622,725);
  time = millis();
  paddle = new Paddle();
  ball = new Ball();
  player = new Player();
  gameOverButtonColor = color(0,0,255,200);
  sentenceFont = createFont("Helvetica", 30, true);
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
    text(" You Won! Congradulations! ",width/2,600);
    ball.xv = 0;
    ball.yv = 0;
    gameOver = 1;
    textFont(sentenceFont,16);
    fill(gameOverButtonColor);
    rect(500,250,100,60);
    fill(0);
    textFont(sentenceFont,20);
    text("Exit",480,250);
  }
  if (ball.y >= 725) {
    player.lives -= 1;
    ball.x = width/2;
    ball.y = height/2; 
    ball.xv = 0;
    ball.yv = 2;
  }
  if (player.lives<=0) {
    text(" You lost. ",width/2,600);
    ball.xv = 0;
    ball.yv = 0;
    gameOver = 1;
    textFont(sentenceFont,16);
    fill(gameOverButtonColor);
    rect(500,250,100,60);
    fill(0);
    textFont(sentenceFont,20);
    text("Exit",480,250);
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
      float xvModifier = -1+((pointOfContact/25)*.5);
      ball.xv=(ball.xv*-1)+ball.yv*xvModifier;
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

void mouseClicked() {
  if (gameOver == 1) {
    if ((450<mouseX && mouseX<550) && (220<mouseY && mouseY<280)) {
      exit();
    }
  }
  if (destroyedBricks>=50) {
    if ((450<mouseX && mouseX<550) && (220<mouseY && mouseY<280)) {
      exit();
    }
}
}

void keyPressed() {
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

