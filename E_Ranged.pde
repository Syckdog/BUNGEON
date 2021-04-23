class Ranged extends Enemy {

  Ranged(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 300;
    y = 300;
  }


  void show() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
  }

  void act() {
    super.act();
  }
}
