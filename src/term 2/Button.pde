class Button {
  // Member Variables
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean on, isNum;

  // Constructor
  Button(int x, int y, String val, int w, int h, color c1, color c2, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    this.val = val;
    this.isNum = isNum;
    on=false;
  }

  // Member Methods
  void display () {
    if (on == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);

    rect(x, y, w, h, 5);
    fill(0);
    textAlign(CENTER, CENTER);
    text(val, x, y);
  }

  boolean hover(int mx, int my) {
    if (mx > x-(w/2) && mx < x+(w/2) && my > y-(h/2) && my < y+(h/2)) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
}
