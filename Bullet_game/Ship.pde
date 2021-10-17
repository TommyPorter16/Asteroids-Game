class Ship extends GameObject {

  PVector direction;
  int shotTimer, threshold, immuneTimer, tpTimer;

  Ship() {
    lives = 3;
    size = 25;
    loc = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
    direction = new PVector (0, -0.1);
    shotTimer = 0;
    threshold = 30;
    immuneTimer = 90;
    tpTimer = 400;
  }

  void show() {
    pushMatrix();

    translate(loc.x, loc.y);
    rotate(direction.heading());

    if (immuneTimer >0) {
      fill(0, 0, 255);
    } else {
      fill(255);
    }
    noStroke();
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }



  void act () {
    super.act();


    if (velocity.mag() > 10) {
      velocity.setMag(10);
    }
    shotTimer++;

    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(-radians(5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }



    // immunity + getting hit
    immuneTimer--;

    if (immuneTimer <= 0) {
      int i = 0;
      while (i < myObjects.size()) {
        GameObject myObj = myObjects.get(i);
        if (myObj instanceof Asteroid || myObj instanceof UFOBullet) {
          if ( dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2) {
            lives--;
            immuneTimer = 120;
          }
        }
        i++;
      }
    }


    //teleportation
    tpTimer--;

    if (t ==true & tpTimer <= 0) {
      int ii = 0;
      while (ii < myObjects.size()) {
        GameObject myObj = myObjects.get(ii);
        if (myObj instanceof Asteroid) {
          while (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2 +200) {
            loc = new PVector(int(random(0, width)), (int(random(0, height))));
            tpTimer = 400;
          }
        }
        ii++;
      }
    }
  }
}
