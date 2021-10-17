class Bullet extends GameObject {

  int timer;

  Bullet() {
    timer = 60;
    lives = 1;
    loc = new PVector(myShip.loc.x, myShip.loc.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(10);
    velocity.add(myShip.velocity);
    size = 10;
  }

  void show() {
    stroke(255);
    noFill();
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();

    timer--;
    if (timer == 0) {
      lives = 0;
    }
  }
}
