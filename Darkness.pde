class Darkness {

  float x, y, w, h, a;

  Darkness() {
    a = 255;
    x = darknessx;
    y = darknessy;
    w = 5;
    h = 5;
  }

  void show() {
    noStroke();
    fill(0, 0, 0, a);
    rect(x, y, w, h);
  }

  void act() {
    a = map(dist(x, y, myHero.x, myHero.y), 0, 200, 0, 255);
  }
}
