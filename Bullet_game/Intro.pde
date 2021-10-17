void intro() {

  background(255);
  //space gif
  image(introgif[f], width/2, height/2, width, height);
  f = f+1;
  if (f == numberOfFrames) f =0;

  //Asteroid sign
  textFont(space);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(255);
  text("ASTEROIDS", width/2, height/2);

  //Start button
  fill(#8711F0);
  rect (400, 475, 250, 100);
  fill(#3BAFF5);
  textSize(40);
  text("START", 400, 475);
}


void introClicks() {
  //start button
  if (mouseX>150 && mouseX<650 && mouseY>375 && mouseY<575) {
    mode = GAME;
  }

  //spawning and resetting game
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  AsteroidAmount = 0;
  UFOSpawnTimer = 1000;
}
