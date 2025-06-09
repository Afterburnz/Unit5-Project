void intro(){
  background(lightBlue);
  fill(0);
  textSize(100);
  textAlign(CENTER);
  fill(pink);
  text("Press r to start", 500,500);
  textSize(150);
  text("Unfair Breakout", 500,150);
  if (key=='r') {
    if(mode != 1){
      mode=1;
    }
  }
}
