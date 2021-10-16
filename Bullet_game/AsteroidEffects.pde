class AsteroidEffects extends GameObject {

  int t;   // transperency
  PVector nudge;
  AsteroidEffects(float x, float y) {
    lives = 1;
    size = int(random(5, 12));
    t = int(random(200, 255));
    loc = new PVector (x, y);
    velocity = new PVector(int(random(-2, 2)), int(random(-2, 2)));
  }


  void show() {
    stroke(255);
    fill(255, t);
    circle(loc.x, loc.y, size);
  }


  void act() {
    super.act();
    t=t-8;
    if (t <= 0) lives = 0;
  }
}
