import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int intro        = 1;
final int play         = 2;
final int gameover     = 3;
final int pause        = 4;
final int menu         = 5;

Hero myHero;
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
ArrayList<Darkness> darknessList;
ArrayList<B_Enemy> B_enemyList;
ArrayList <PImage> gif; 
boolean akey, dkey, skey, wkey;
int mode = intro;
int darknessx, darknessy, m;
int d = 0;
PImage map;
int roomx, roomy, mapw, maph;
int [][] minimap;
boolean e, n, s, w, h;
color white = #FFFFFF;
color black = #000000;
int i = 0;
int o = 0;
PImage mute;
PImage unmute;
PImage introbutton;
Minim minim;
AudioPlayer introsong;

void setup() {
  size(800, 800, FX2D);
  myHero = new Hero();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  darknessList = new ArrayList<Darkness>();
  B_enemyList = new ArrayList<B_Enemy>();
  gif = new ArrayList<PImage>();

  minim = new Minim(this);
  introsong = minim.loadFile("INTRO.mp3");
  introsong.loop();

  mute = loadImage("mute.png");
  mute.resize(40, 40);
  unmute = loadImage("unmute.png");
  unmute.resize(40, 40);
  introbutton = unmute;
  darknessx = 0;
  darknessy = 0;
  d = 25600;

  i = 0;
  while (i < d) {
    darknessList.add(new Darkness());
    darknessx = darknessx + 5;
    if (darknessx == width) {
      darknessx = 0;
      darknessy = darknessy + 5;
    }
    i++;
  }

  i = 0;
  while ( i <= 19) {
    PImage p1;

    if (i < 10) {
      p1 = loadImage("frame_0" + i + "_delay-0.09s.gif");
    } else {
      p1 = loadImage("frame_" + i + "_delay-0.09s.gif");
    }
    gif.add(p1);
    i = i + 1;
    p1.resize(800, 800);
  }

  m = int(random(1, 5));
  map = loadImage("map.png");
  minimap = new int[10][10];
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      color col = map.get(c, r);
      if (col==white) {
        minimap[r][c] = 0;
      }
      if (col==black) {
        minimap[r][c] = 1;
      }
    }
  }
  roomx = 5;
  roomy = 4;
  minimap[roomy][roomx] = 2;
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
  } else {
  }
}

void keyPressed() {
  if (key == 'A') akey = true;
  if (key == 'D') dkey = true;
  if (key == 'S') skey = true;
  if (key == 'W') wkey = true;
}

void keyReleased() {
  if (key == 'A') akey = false;
  if (key == 'D') dkey = false;
  if (key == 'S') skey = false;
  if (key == 'W') wkey = false;

  if (mode==play) {
    if (key == ' ') {
      mode = pause;
    }
  } else if (mode==pause) {
    if (key == ' ') {
      mode = play;
    }
  } else if (mode==gameover) {
    if (key == ' ') {
      roomx = 5;
      roomy = 4;
      myHero.alive = true;
      myHero.hp = 100;
      myHero.mana = 100;
      mode = intro;
    }
  }
}
