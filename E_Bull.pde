class Bull extends Melee {

  Bull(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 300;
    y = 300;
    cooldown = 100;
  }

  void act() {
    super.act();

    if (hp > 0 && cooldown <= threshold) {  
      PVector direction = new PVector(myHero.x - x, myHero.y - y);
      direction.setMag(8);

      vx = direction.x;
      vy = direction.y;
      cooldown = 100;
    }
  }
}
