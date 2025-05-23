color white= #ffffff;
color black= #000000;
color color1 = #42213d;
color color2 = #123456;
color color3=#C0FFEE;
color color4= #abcdef;
color color5=#959384;
float ballx, bally, balld;
float vx, vy;
float ax, ay;
boolean aKey, dKey;
float x, y, d;
float x2, y2, d2;
int playerPoints=0;
float playerSpeed;
float playerX,playerY;
import processing.sound.*;
SoundFile fail;
SoundFile success;
SoundFile music;
int mode =0;
final int INTRO =0;
final int GAME = 1;
final int PAUSE =2;
final int GAMEOVER =3;

void setup(){
  size(1000, 1000);
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
  ballx=width/2;
  bally=height/3;
  balld=50;

  x=400;
  y=900;
  playerX=200;
  playerY=100;
  music.loop();
  music.amp(1);
}
void draw(){
  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else {
  
  background(color4);
  strokeWeight(5);
  stroke(color4);
  fill(255, 0, 0);  
    
  circle(ballx, bally, balld);
    ballx+=vx;
    bally+=vy; 
    vy+=ay;
    vx+=ax;
  
  if(ballx<=balld/2){
      vx=-vx;
      ballx=balld/2;
    }
    if(ballx>=width-balld/2){
      vx=-vx;
      ballx=width-balld/2;
    }
    
    strokeWeight(5);
    stroke(0);
    fill(255);
    rect(x,y,playerX,playerY);
    
    if(aKey) x-=playerSpeed;
    if(dKey) x+=playerSpeed;
  }
}

void keyPressed(){
  if(key=='a'){
    aKey=true;
  }
  if(key=='d'){
    dKey=true;
  }
}  
void keyReleased(){
  if(key=='a'){
    aKey=false;
  }
  if(key=='d'){
    dKey=false;
  } 
}
  
