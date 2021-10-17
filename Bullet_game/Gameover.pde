void gameover() {
  background(0);

  //win/lose screen
  if (AsteroidAmount == 21) {
    textSize(50);
    text("YOU WIN", width/2, height/3);
  } else {
    textSize(50);
    text("YOU LOSE", width/2, height/3);
  }


  //restart button
  fill(255);
  textSize(25);
  text("Click to restart", width/2, 450);
}


void gameoverClicks() {
  mode = INTRO;
}
