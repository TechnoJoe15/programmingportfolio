class Spaceship {
  // Member Variables
  int x, y, w, laserCount, turretCount, health;
  PImage a1;


  // Constructor
  Spaceship() {
    a1 = loadImage("JetDesign1.png");
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 250;
    turretCount = 1;
    health = 100;
  }

  //Member Methods
  void display() {
    imageMode(CENTER);
    image(a1, x, y);
    a1.resize(80, 110);
  }
  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if (laserCount > 0) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
