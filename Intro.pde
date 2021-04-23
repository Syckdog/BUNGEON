void intro() {
  cursor(CROSS);
  image(gif.get(o), 0, 0);  
  if (frameCount % 2 == 0) {
    o = o + 1;
  }
  if (o > 19) {
    o = 0;
  }
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("WELCOME TO THE BUNGEON", width/2, height/2);
  textSize(20);
  text("PLAY", 50, 730);
  text("QUIT", 50, 760);

  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse (770, 750, 50, 50);
  image(introbutton, 750, 730);
}

void introClicks() {
  if (dist(mouseX, mouseY, 50, 730) < 20) mode = play;
  if (dist(mouseX, mouseY, 50, 760) < 20) exit();
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
