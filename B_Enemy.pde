class B_Enemy {

  float x, y, vx, vy, size;
  boolean alive;
  int myRoomx, myRoomy;

  B_Enemy(int _myRoomx, int _myRoomy, float E_x, float E_y) {
    x = E_x;
    y = E_y;
    size = 20;
    alive = true;
    myRoomx = _myRoomx;
    myRoomy = _myRoomy;

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
