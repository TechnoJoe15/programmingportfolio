class Powerup {
  // Member Variables
  int x, y, diam, speed;
  char type;
  PImage p1;

  // Constructor
  Powerup() {
    x = int(random(width));
    y = -40;
    diam = int(random(20, 80));
    speed = int(random(1, 5));
    
    int rand = floor(random(3));

    if (rand == 0) {
      type = 'h';
      p1 = loadImage("GreenPower.png");
    } else if (rand == 1) {
      type = 'a';
      p1 = loadImage("RedPower.png");
    } else if (rand == 2) {
      type = 't';
      p1 = loadImage("BluePower.png");
    }
  }
  // Member Methods
  void display() {
    
   

    //ellipse(x, y, diam, diam);
    imageMode(CENTER);
    //r1.resize(diam, diam);
    image(p1, x, y);
    
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
