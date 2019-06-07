class Melee extends Enemy {

  Melee(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = random(125, 675);
    y = random(125, 675);
  }


  void show() {
    fill(0, 0, 255);
    ellipse(x, y, size, size);
    textSize(20);
    fill(0);
    text(hp, x, y);
  }

  void act() {
    super.act();
    PVector direction = new PVector(myHero.x - x, myHero.y - y);
    direction.setMag(3);

    vx = direction.x;
    vy = direction.y;

    if (x < 125) x = 125;
    if (x > 675) x = 675;
    if (y < 125) y = 125;
    if (y > 675) y = 675;
  }
}
