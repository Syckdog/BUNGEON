class Chaser extends Melee {

  Chaser(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 300;
    y = 300;
  }

  void act() {
    super.act();

    PVector direction = new PVector(myHero.x - x, myHero.y - y);
    direction.setMag(2);

    vx = direction.x;
    vy = direction.y;
  }
}
