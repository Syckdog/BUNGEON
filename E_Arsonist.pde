class Arsonist extends Ranged {

  Arsonist(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 500;
    y = 500;
  }

  void act() {
    super.act();
    if (hp > 0) {
      B_enemyList.add(new B_Enemy(myRoomx, myRoomy, x, y));
    }
  }
}
