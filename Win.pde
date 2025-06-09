void win(){
  background(122,255,106);
    textSize(100);
    textAlign(CENTER);
    fill(red);
    text("Winnar!!!!", 500,100);
    imageMode(CENTER);
    image(gif[i],width/2,height/2);
    i++;
    if(i == numberOfFrames) i=0;
}
