class Mage extends Ranged {

  Mage(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 300;
    y = 300;
  }

  void act() {
    super.act();
    if (hp > 0 && cooldown <= threshold) {   
      B_enemyList.add(new B_Enemy(myRoomx, myRoomy, x, y));
      cooldown = 50;
    }
  }
}
