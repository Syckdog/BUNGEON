class Ranged extends Enemy {

  Ranged(int _myRoomx, int _myRoomy) {
    super(_myRoomx, _myRoomy);
    x = 300;
    y = 300;
  }


  void show() {
    fill(255, 0, 0);
    ellipse(x, y, size, size);
    textSize(20);
    fill(0);
    text(hp, x, y);
  }

  void act() {
    super.act();
      if (hp > 0 && cooldown <= threshold) {
      E_bulletList.add(new E_Bullet());
      cooldown = 20;
    }
  }
}
