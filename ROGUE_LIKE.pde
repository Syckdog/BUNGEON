final int intro        = 1;
final int play         = 2;
final int gameover     = 3;
final int pause        = 4;
final int menu         = 5;

Hero myHero;
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
ArrayList<Darkness> darknessList;
ArrayList<E_Bullet> E_bulletList;

boolean akey, dkey, skey, wkey;
int mode = play;
int darknessx, darknessy, m;
PImage map;
int roomx, roomy, mapw, maph;
boolean e, n, s, w;

color white = #FFFFFF;
color black = #000000;


void setup() {
  size(800, 800);
  myHero = new Hero();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  darknessList = new ArrayList<Darkness>();
  E_bulletList = new ArrayList<E_Bullet>();
  enemyList.add(new Melee(5, 5));
  m = 90;
  map = loadImage("map.png");
  roomx = 5;
  roomy = 4;
  mapw = map.width;
  maph = map.height;
  switchRoom();
}

void draw() {
  if (mode==intro) {
    intro();
  } else if (mode==play) {
    play();
  } else if (mode==gameover) {
    gameover();
  } else if (mode==pause) {
    pause();
  } else if (mode==menu) {
    menu();
  } else {
  }
}

void mouseReleased() {
  if (mode==intro) {
    introClicks();
  } else if (mode==play) {
    playClicks();
  } else if (mode==gameover) {
    gameoverClicks();
  } else if (mode==pause) {
    pauseClicks();
  } else if (mode==menu) {
    menuClicks();
  } else {
  }
}

void keyPressed() {
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (key == 's') skey = true;
  if (key == 'w') wkey = true;
}

void keyReleased() {
  if (key == 'a') akey = false;
  if (key == 'd') dkey = false;
  if (key == 's') skey = false;
  if (key == 'w') wkey = false;

  if (mode==intro || mode==pause) {
    if (key == ' ') {
      mode = menu;
    }
  } else if (mode==play) {
    if (key == ' ') {
      mode = pause;
    }
  } else if (mode==pause) {
    if (key == ' ') {
      mode = play;
    }
  } else if (mode==gameover) {
    if (key == ' ') {
      mode = intro;
    }
  }
}
