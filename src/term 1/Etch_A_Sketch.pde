// Jake Long | Etch A Sketch | 18 Sept 2024
int x, y;
PImage e1;

void setup() {
  size(800, 658);
  background(128);
  x = width/2;
  y = height/2;
  e1 = loadImage("Etch.png");
}

void draw() {
  image(e1, 0, 0);
  strokeWeight(3);
  point(x, y);

  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y-=1;
    } else if (key == 'a' || key == 'A') {
      x-=1;
    } else if (key == 's' || key == 'S') {
      y+=1;
    } else if (key == 'd' || key == 'D') {
      x+=1;
    }
  }
}

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        y-=2;
      } else if (keyCode == DOWN) {
        y+=2;
      } else if (keyCode == LEFT) {
        x-=2;
      } else if (keyCode == RIGHT) {
        x+=2;
      }
    }
  }

  void mousePressed() {
  }
