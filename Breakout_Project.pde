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
float playerSize;
import processing.sound.*;
SoundFile fail;
SoundFile success;
SoundFile music;
int mode;
final int INTRO =0;
final int GAME = 1;
final int PAUSE =2;
final int GAMEOVER =3;

void setup() {
  size(1000, 1000, P2D);
  mode=0;
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
  ballx=width/2;
  bally=height/2;
  balld=50;

  x=width/2;
  y=height;
  playerSize= 180;
  
    vx = 25;
    vy = 14;
    d=180;
}
void draw() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else {

    playerSpeed=10;
    background(color4);
    strokeWeight(5);
    stroke(color4);
    fill(255, 0, 0);

    circle(ballx, bally, balld);
    ballx+=vx;
    bally+=vy;

    if (ballx<=balld/2) {
      vx=-vx;
      ballx=balld/2;
    }
    if (ballx>=width-balld/2) {
      vx=-vx;
      ballx=width-balld/2;
    }
    if (bally<=balld/2) {
      vy=-vy;
    }

    strokeWeight(5);
    stroke(0);
    fill(255);
    circle(x, y, playerSize);

    if (aKey) x-=playerSpeed;
    if (dKey) x+=playerSpeed;
  }
  if (dist(x, y, ballx, bally) <=d/2+balld/2) {
    vx=(ballx-x)/8;
    vy=(bally-y)/8;
  }

  if (x<d/2) {
    x=d/2;
  }

  if (x>width-d/2) {
    x=width-d/2;
  }
}

void keyPressed() {
  if (key=='a') {
    aKey=true;
  }
  if (key=='d') {
    dKey=true;
  }
}
void keyReleased() {
  if (key=='a') {
    aKey=false;
  }
  if (key=='d') {
    dKey=false;
  }
  if (key=='r') {
    mode=1;
  }
}
