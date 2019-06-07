class Bullet {

  float x, y, vx, vy, size;
  boolean alive;

  Bullet() {
    x = myHero.x;
    y = myHero.y;
    size = 20;
    alive = true;

    PVector direction = new PVector(mouseX-x, mouseY-y);
    direction.setMag(5);

    vx = direction.x;
    vy = direction.y;
  }

  void show() {
    fill(255, 0, 255);
    ellipse (x, y, size, size);
  }

  void act() {
    x = x + vx;
    y = y + vy;

    if (x < 110 || x > 690 || y < 110 || y > 690) alive = false;
  }
}
