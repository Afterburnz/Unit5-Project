color white= #ffffff;
color black= #000000;
color color1 = #42213d;
color color2 = #123456;
color color3=#C0FFEE;
color color4= #abcdef;
color color5=#959384;
color lightRed=#cf655d;
color lightPurple=#a15dcf;
color lightBlue=#388bc9;
color lightOrange=#f7b160;
color red =#ff3838;
color pink=#dfbbda;
float ballx, bally, balld;
float vx, vy;
float prevVx, prevVy;
float ax, ay;
boolean aKey, dKey, rKey, pKey;
float x, y, d;
float x2, y2, d2;
int playerPoints=0;
float playerSpeed;
float playerSize;
int lives = 3;
int[] arx;
int[] ary;
boolean[] alive;
int z=40;
int n=40;
int x1, y1;
int brickd;
int[] brickColor;
PImage[] gif;
int numberOfFrames=50;
int i=0;
boolean paused = false;
import processing.sound.*;
SoundFile fail;
SoundFile success;
SoundFile music;
int mode;
final int INTRO =0;
final int GAME = 1;
final int PAUSE =2;
final int GAMEOVER =3;
final int WIN=4;

void setup() {
  size(1000, 1000, P2D);
  mode=0;
  fail = new SoundFile(this, "FAILURE.wav");
  success = new SoundFile(this, "SUCCESS.wav");
  music=new SoundFile(this, "MUSIC.mp3");
  ballx=width/2;
  bally=height/2;
  balld=50;
  arx=new int[z];
  ary=new int[z];
  alive=new boolean[z];
  x1=50;
  y1=100;
  x=width/2;
  y=height;
  playerSize= 180;
  brickd=50;
  vx = 25;
  vy = 14;
  d=180;
  rKey=true;
  pKey=false;
  brickColor=new int[z];
  gif = new PImage[numberOfFrames];
  music.loop();
  music.amp(1);
  int f=0;
  while (f<numberOfFrames) {

    gif[f] = loadImage("frame_"+f+"_delay-0.03s.gif");
    f++;
  }

  for (int i=0; i<z; i++) {
    alive[i]=true;
    arx[i]=x1;
    ary[i]=y1;
    x1+=100;
    brickColor[i]=((x1+y1)/10);
    if (x1>=1000) {
      x1=50;
      y1+=100;
    }
    println(brickColor[i]);
  }
}
void draw() {

  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else if (mode==WIN) {
    win();
  } else {

    background(lightPurple);
    if (bally>1000) {
      ballx = width/2;
      bally = height/2;
      lives = lives-1;
      fail.play();
    }

    if (lives==0) {
      mode=3;
    }


    fill(0, 0, 0);
    //for (int i=0; i<z; i++) {
    //  if (alive[i]==true) {

    //  }
    //}
    int i=0;
    while (i<z) {
      if (alive[i]==true) {
        fill(185, brickColor[i], 54);
        circle(arx[i], ary[i], brickd);
        if (dist(ballx, bally, arx[i], ary[i])<balld/2+brickd/2) {
          vx=(ballx-arx[i])/random(0.5, 6);
          vy=(bally-ary[i])/random(0.5, 6);
          alive[i]=false;
          success.play();
          n=n-1;
        }
      }
      i++;
    }
    playerSpeed=25;
    strokeWeight(5);
    stroke(color4);
    fill(255, 0, 0);
    fill(black);
    textSize(50);
    text("lives: "+lives, 100, 50);
    text("click to pause", 850, 50);

    fill(lightRed);
    strokeWeight(2);
    stroke(black);
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

  if (n==0) {
    mode=4;
  }
}

void keyPressed() {
  if (key=='a' & paused == false) {
    aKey=true;
  }
  if (key=='d' & paused ==false) {
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
    if (mode==0 & rKey==false) {
      rKey=true;
    }
  }


}

void mouseClicked() {
  if (paused==false) {
    prevVx=vx;
    prevVy=vy;
    vx=0;
    vy=0;
    paused = true;
  } else if (paused==true) {
    vx=prevVx;
    vy=prevVy;
    playerSpeed=25;
    paused = false;
  }

}
