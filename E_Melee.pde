class Melee extends Enemy {

  Melee(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 400;
    y = 400;
  }


  void show() {
    fill(0, 0, 255);
    ellipse(x, y, size, size);
  }

  void act() {
    super.act();

    if (x < 125) x = 125;
    if (x > 675) x = 675;
    if (y < 125) y = 125;
    if (y > 675) y = 675;
  }
}
