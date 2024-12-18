// Jake Long | 6 Nov 2024 | SpaceGame

Spaceship s1;
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();

int score, lvl, rockRate;
boolean play;
Timer rTime, puTime;

void setup() {
  size(800, 800);
  s1 = new Spaceship();
  score = 0;
  lvl = 1;
  play = false;
  rockRate = 1000;
  rTime = new Timer(500);
  rTime.start();
  puTime = new Timer(5000);
  puTime.start();
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    background(5);
    if (frameCount % 1000 == 0) {
      lvl++;
    }
    stars.add(new Star());
    for (int i=0; i<stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }

    //Render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }
    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      // Health Benefit
      if (pu.intersect(s1) && pu.type == 'h') {
        powups.remove(pu);
        s1.health += 100;
        //Increase Ammo
      } else if (pu.intersect(s1) && pu.type == 'a') {
        powups.remove(pu);
        s1.laserCount += 100;
        //Increase Turret Amount
      } else  if (pu.intersect(s1) && pu.type == 't') {
        powups.remove(pu);
        if (s1.turretCount == 1) {
          s1.turretCount = 2;
        } else if (s1.turretCount == 2) {
          s1.turretCount = 3;
        }
      }


      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }

    // Render lasers and detect rock collide
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          rock.diam -= 10;
          s1.health += 1;
          if (rock.diam <10) {
            rocks.remove(rock);
            lasers.remove(laser);
          }
          score += 100;
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }

    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        //deduct 10 points
        score -= 10;
        // deduct 20 health
        s1.health -= 20;
        //delete rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        score -= 100;
        s1.health -= 25;
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health <1) {
      gameOver();
      noLoop();
    }
  }
}
void keyPressed() {
  if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount -= 1;
  } else if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    s1.laserCount -= 2;
  } else if (keyPressed && key == ' ' && s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    s1.laserCount -= 3;
  }
}

void mousePressed() {
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    s1.laserCount -= 1;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x+10, s1.y));
    lasers.add(new Laser(s1.x-0, s1.y));
    s1.laserCount -= 2;
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    s1.laserCount -= 3;
  }
}

void infoPanel() {
  rectMode(CENTER);
  fill(127, 127);
  rect(width/2, 40, width, 80);
  fill(0);
  textSize(30);
  text("Score: " + score, 20, 30);
  text("Health: " + s1.health, 200, 30);
  text("Level: " + lvl, 400, 30);
  text("Ammo: "+ s1.laserCount, 530, 30);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(75);
  text("Welcome to SpaceGame!", width/2, 300);
  textSize(50);
  text ("Made by: Jake Long", width/2, 400);
  text ("Click to Start", width/2, 500);
  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(255);
  textSize(110);
  text("Game Over", width/2, 300);
  textSize(50);
  text ("Restart Program To Try Again", width/2, 400);
  text ("Level: " + lvl + "   Score: " + score, width/2, 500);
}


void ticker() {
}
