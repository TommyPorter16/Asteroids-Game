class UFO extends GameObject {


  int shotTimer, threshold, spawnTimer, spawn;

  float vy, vx;
  UFO() {


    spawn = int(random(0, 4));
    lives = 1;
    size = 25;

    //spawning place
    if (spawn == 0) {
      loc = new PVector(int(random(0, width)), 0);
      velocity = new PVector(0, 2);
    } else if (spawn == 1) {
      loc = new PVector(width, int(random(0, height)));
      velocity = new PVector(-2, 0);
    } else if (spawn == 2) {
      loc = new PVector(int(random(0, width)), height);
      velocity = new PVector(0, -2);
    } else {
      loc = new PVector(0, int(random(0, height)));
      velocity = new PVector(2, 0);
    }
    shotTimer =   100;
    threshold = 30;
    spawnTimer = 1000;
  }

  UFO(float x, float y) {

    lives = 1;
    size = 25;
    loc = new PVector(x, y);
    velocity = new PVector(int(random(-5, 5)), int(random(-5, 5)));
    shotTimer =   100;
    threshold = 30;
    spawnTimer = 800;
  }

  void show() {
    //UFO body
    fill(#FA1E22);
    ellipse(loc.x, loc.y, size, size);
    image(UFO, loc.x, loc.y, size*3, size*3);
  }



  void act() {
    loc.add(velocity);
    vy = myShip.loc.y-loc.y;
    vx = myShip.loc.x-loc.x;

    shotTimer++;
    if (shotTimer > threshold) {
      myObjects.add(new UFOBullet(loc.x, loc.y, vx, vy));
      shotTimer = 0;
    }
    velocity.add(new PVector(int(random(-1, 1)), int(random(-1, 1))));

    if (loc.y < -50 || loc.y > height +50 || loc.x < -50 || loc.x > width+50)  lives = 0;

    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if ( dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size + myObj.size) {
          myObj.lives = 0;
          lives = 0;
        }
      }
      i++;
    }
  }
}
