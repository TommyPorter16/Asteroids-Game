void game() {
  background(0);


  if (myShip.tpTimer <= 0) {
    fill(0, 255, 0);
    myShip.tpTimer =0;
  } else {
    fill(255);
  }
  textSize(20);
  text("TELEPORTATION", 400, 50);
  fill(255);
  rect(800, 50, myShip.tpTimer, 50);

  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();

    if (myObj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }


  if (myShip.lives == 0) {
    mode = GAMEOVER;
  }


  if (UFOSpawnTimer == 0) {
    myObjects.add(new UFO());
    UFOSpawnTimer = 1000;
  }
  UFOSpawnTimer--;
}


void gameClicks() {
  mode=PAUSE;
}
