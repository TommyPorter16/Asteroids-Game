void intro() {

  background(255);
  //colour gif
  image(introgif[f], width/2, height/2, width, height);
  f = f+1;
  if (f == numberOfFrames) f =0;
  textFont(space);
  textSize(80);
  textAlign(CENTER, CENTER);
  fill(255);
  text("ASTEROIDS", width/2, height/2);
}


void introClicks() {
  mode = GAME;
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  AsteroidAmount = 0;
}
