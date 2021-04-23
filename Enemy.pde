class Enemy {

  float x, y;
  float vx, vy, size;
  int hp, myRoomx, myRoomy;
  int value;
  int cooldown, threshold;


  Enemy(int _myRoomx, int _myRoomy) {
    x = 300;
    y = 300;
    myRoomx = _myRoomx;
    myRoomy = _myRoomy;
    vx = 0;
    vy = 0;
    size = 50;
    hp = 50;
    value = 10;
    cooldown = 50;
    threshold = 0;
  }


  void show() {
    fill(0, 255, 0);
    ellipse(x, y, size, size);
  }

  void act() {
    x = x + vx;
    y = y + vy;
    checkCollisions();
    cooldown = cooldown - 1;
  }

  void checkCollisions() {
    int i = 0;
    while (i < bulletList.size()) {
      Bullet b = bulletList.get(i);
      if (dist(b.x, b.y, x, y) < b.size/2 + size/2) {
        hp = hp - 10;
        b.alive = false;
      }
      i++;
    }
  }
}
