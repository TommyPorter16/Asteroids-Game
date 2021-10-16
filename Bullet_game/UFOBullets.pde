class UFOBullet extends GameObject {

  int timer;

  UFOBullet(float x, float y, float vx, float vy) {
    timer = 120;
    lives = 1;
    loc = new PVector(x, y);
    velocity = new PVector(vx, vy);
    velocity.setMag(5);
    size = 10;
  }

  void show() {
    stroke(255);
    fill(255, 0, 0);
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
