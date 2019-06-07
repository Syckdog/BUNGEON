class Darkness {

  float x, y, w, h, a, b;

  Darkness() {
    a = 255;
    b = 0;
    x = myHero.x;
    y = myHero.y;
    w = 100;
    h = 100;
  }

  void show() {
    noStroke();
    fill(0, 0, 0, a);
    rect(x, y, w, h);
  }

  void act() {
    
  }
}
