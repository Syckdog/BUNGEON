void play() {

  background(#75761A);
  fill(150);
  stroke(0);
  strokeWeight(5);
  rect(100, 100, 600, 600);
  line(0, 0, 100, 100);
  line(0, 800, 100, 700);
  line(800, 0, 700, 100);
  line(800, 800, 700, 700);

  fill(#BCB024);
  if (n) arc(400, 100, 100, 150, PI, TWO_PI, CHORD);
  if (s) arc(400, 700, 100, 150, 0, PI, CHORD);
  if (w) arc(100, 400, 150, 100, HALF_PI, PI + HALF_PI, CHORD);
  if (e) arc(700, 400, 150, 100, PI + HALF_PI, TWO_PI + HALF_PI, CHORD);

  if (myHero.alive == true) {
    myHero.show();
    myHero.act();
  } else {
    mode = gameover;
  }

  int i = 0;
  while (i < bulletList.size()) {
    Bullet b = bulletList.get(i);
    if (b.alive == true) {
      b.show();
      b.act();
      i++;
    } else {
      bulletList.remove(i);
    }
  }

  /*
int i
   while (condition = true){
   do something/do while something is true
   }
   
   
   for ( int i = 0   ; i < bulletssize    (condition)   ;    i--   ){
   do something 
   }
   
   
   */
  i = 0;
  while (i < B_enemyList.size()) {
    B_Enemy r = B_enemyList.get(i);
    if (r.alive == true && r.myRoomx == roomx && r.myRoomy == roomy) {
      r.show();
      r.act();
      i++;
    } else {
      B_enemyList.remove(i);
    }
  }


  i = 0;
  while (i < enemyList.size()) {
    Enemy e = enemyList.get(i);
    if (e.hp > 0) {
      if (e.myRoomx == roomx && e.myRoomy == roomy) {
        e.show();
        e.act();
      }
      i++;
    } else {
      enemyList.remove(i);
    }
  }

  i = 0;
  while (i < d) {
    Darkness myDarkness = darknessList.get(i);
    myDarkness.show();
    myDarkness.act();
    i++;
  }


  float h = map(myHero.hp, 100, 0, 175, 25);
  float m = map(myHero.mana, 100, 0, 175, 25);

  fill(0);
  rect(20, 10, 185, 35);
  fill(255, 0, 0);
  rect(25, 15, h, 25);

  fill(0);
  rect(20, 55, 185, 35);
  fill(0, 0, 255);
  rect(25, 60, m, 25);


  fill(100);
  rect(640, 0, 160, 160);
  for (int r = 0; r < 10; r++) {
    for (int c = 0; c < 10; c++) {
      int s = minimap[r][c];
      if (s==0) fill(255);
      if (s==1) fill(0);
      if (s==2) fill(255, 0, 0);
      if (s==3) fill(0);
      rect(650 + (14*c), 10 + (14*r), 14, 14);
    }
  }

  if (myHero.mana > 100) myHero.mana = 100;
  if (myHero.hp > 100) myHero.hp = 100;


  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse (770, 750, 50, 50);
  image(introbutton, 750, 730);
}


void playClicks() {
  bulletList.add(new Bullet());
  myHero.mana = myHero.mana - 1;
  if (dist(770, 750, mouseX, mouseY) < 25) {
    if (introsong.isPlaying()) {
      introbutton = mute;
      introsong.pause();
    } else {
      introbutton = unmute;
      introsong.loop();
    }
  }
}

void switchRoom() {

  n = s = e = w = false;

  color here  = map.get(roomx, roomy);
  color north = map.get(roomx, roomy - 1);
  color south = map.get(roomx, roomy + 1);
  color east  = map.get(roomx + 1, roomy);
  color west  = map.get(roomx - 1, roomy);

  if (north != white) n = true;
  if (south != white) s = true;
  if (east  != white) e = true;
  if (west  != white) w = true;
  if (here  != white) h = true;
}

void spawnEnemies() {
  for (i = 0; i < m; i++) {
    int x = int(random(0, 3));
    if (x==0) enemyList.add(new Chaser(roomx, roomy));
    if (x==1) enemyList.add(new Mage(roomx, roomy));
    if (x==2) enemyList.add(new Arsonist(roomx, roomy));
    if (x==3) enemyList.add(new Bull(roomx, roomy));
  }
}
