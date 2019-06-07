void play() {

  background(#5D4F1D);
  fill(0);
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
  while (i < E_bulletList.size()) {
    E_Bullet r = E_bulletList.get(i);
    if (r.alive == true) {
      r.show();
      r.act();
      i++;
    } else {
      E_bulletList.remove(i);
    }
  }



  i = 0;
  while (i < m) {
    darknessList.add(new Darkness());
    darknessx = darknessx  + 160;
    if (darknessx == width) {
      darknessx = 0;
      darknessy = darknessy + 50;
    }
    i++;
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
  
  

  if (myHero.mana > 100) myHero.mana = 100;
  if (myHero.hp > 100) myHero.hp = 100;
}


void playClicks() {
  bulletList.add(new Bullet());
  myHero.mana = myHero.mana - 1;
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

  spawnEnemies();
}

void spawnEnemies() {
}
