class Fire extends GameObject {

  int t;   // transperency
  PVector nudge;
  Fire() {
    lives = 1;
    size = int(random(5, 12));
    t = int(random(200, 255));
    loc = myShip.loc.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(25);
    loc.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI);
    velocity.setMag(4);
  }


  void show() {
    //drawing fire
    noStroke();
    fill(255, 0, 0, t);
    square(loc.x, loc.y, size);
  }


  void act() {
    super.act();
    t=t-15;
    if (t <= 0) lives = 0;
  }
}
