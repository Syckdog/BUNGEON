class E_Bullet {

  float x, y, vx, vy, size;
  boolean alive;

  E_Bullet() {
    x = 300;
    y = 300;
    size = 20;
    alive = true;

    PVector direction = new PVector(myHero.x-x, myHero.y-y);
    direction.setMag(2);

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
