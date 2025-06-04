void game() {
  if (mode==INTRO) {
    intro();
  } else if (mode==GAMEOVER) {
    gameOver();
  } else {

    background(lightPurple);
    if (bally>1000) {
      ballx = width/2;
      bally = height/2;
      lives = lives-1;
    }

    if (lives==0) {
      mode=3;
    }
    //for (int i=0; i<z; i++) {
    //  if (alive[i]==true) {

    //  }
    //}
    int i=0;
    while (i<z) {
      if (alive[i]==true) {
        fill(86, brickColor[i], 173);
        circle(arx[i], ary[i], brickd);
        if (dist(ballx, bally, arx[i], ary[i])<balld/2+brickd/2) {
          vx=(ballx-arx[i])/random(0.5, 6);
          vy=(bally-ary[i])/random(0.5, 6);
          alive[i]=false;
        }
      }
      i++;
    }
    playerSpeed=20;
    strokeWeight(5);
    stroke(color4);
    fill(255, 0, 0);
    fill(black);
    textSize(50);
    text("lives: "+lives, 100, 50);

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
}
