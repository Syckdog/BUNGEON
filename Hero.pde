class Hero {

  float x, y, size, speed, mana, hp;
  boolean alive;
  int cooldown, threshold;

  Hero() {
    x = width/2;
    y = height/2;
    size = 50;
    speed = 5;
    hp = 100;
    mana = 100;
    cooldown = 300;
    threshold = 0;
    alive = true;
  }

  void show() {
    fill(255, 0, 0);
    noStroke();
    ellipse (x, y, size, size);
  }

  void act() {
    if (wkey) y = y - speed;
    if (skey) y = y + speed;
    if (akey) x = x - speed;
    if (dkey) x = x + speed;

    if (x < 125) x = 125;
    if (x > 675) x = 675;
    if (y < 125) y = 125;
    if (y > 675) y = 675;

    if (n) checkNorthExit();
    if (s) checkSouthExit();
    if (e) checkEastExit();
    if (w) checkWestExit();

    cooldown = cooldown - 1;
    checkCollisions();
    
    if (hp < 1) alive = false;
    if (cooldown <= threshold) {
      mana = mana + 1;
      hp = hp + 1;
      cooldown = 300;
    }
  }

  void checkNorthExit() {
    if (dist(x, y, 400, 100) < 50) {
      roomy--;
      x = width/2;
      y = height/2;
      switchRoom();
    }
  }

  void checkSouthExit() {
    if (dist(x, y, 400, 700) < 50) {
      roomy++;
      x = width/2;
      y = height/2;
      switchRoom();
    }
  }

  void checkEastExit() {
    if (dist(x, y, 100, 400) < 50) {
      roomx++;
      x = width/2;
      y = height/2;
      switchRoom();
    }
  }

  void checkWestExit() {
    if (dist(x, y, 700, 400) < 50) {
      roomx--;
      x = width/2;
      y = height/2;
      switchRoom();
    }
  }

  void checkCollisions() {
    int i = 0;
    while (i < E_bulletList.size()) {
      E_Bullet r = E_bulletList.get(i);
      if (dist(r.x, r.y, x, y) < r.size/2 + size/2) {
        hp = hp - 5;
        r.alive = false;
      }
      i++;
    }

    i = 0;
    while (i < enemyList.size()) {
      Enemy e = enemyList.get(i);
      if (dist(e.x, e.y, x, y) < e.size/2 + size/2) {
        hp = hp - 5;
      }
      i++;
    }
  }
}
