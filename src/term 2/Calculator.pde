// Jake Long | Calc Project | 2 Oct 2024
Button [] buttons = new Button[25];
String dVal = "0";
float l, r, result;
char op;
boolean left;

void setup() {
  size(420, 700);
  background (50);
  l = 0;
  r = 0;
  result = 0;
  op = ' ';
  left = true;
  buttons[0] = new Button(70, 550, "log", 60, 60, 160, 100, false);
  buttons[1] = new Button(140, 550, "0", 60, 60, 160, 100, true);
  buttons[2] = new Button(210, 550, ".", 60, 60, 160, 100, false);
  buttons[3] = new Button(280, 550, "+/-", 60, 60, 160, 100, false);
  buttons[4] = new Button(350, 550, "=", 60, 60, 160, 100, false);
  buttons[5] = new Button(70, 480, "π", 60, 60, 160, 100, false);
  buttons[6] = new Button(140, 480, "1", 60, 60, 160, 100, true);
  buttons[7] = new Button(210, 480, "2", 60, 60, 160, 100, true);
  buttons[8] = new Button(280, 480, "3", 60, 60, 160, 100, true);
  buttons[9] = new Button(350, 480, "+", 60, 60, 160, 100, false);
  buttons[10] = new Button(70, 410, "√", 60, 60, 160, 100, false);
  buttons[11] = new Button(140, 410, "4", 60, 60, 160, 100, true);
  buttons[12] = new Button(210, 410, "5", 60, 60, 160, 100, true);
  buttons[13] = new Button(280, 410, "6", 60, 60, 160, 100, true);
  buttons[14] = new Button(350, 410, "-", 60, 60, 160, 100, false);
  buttons[15] = new Button(70, 340, "^²", 60, 60, 160, 100, false);
  buttons[16] = new Button(140, 340, "7", 60, 60, 160, 100, true);
  buttons[17] = new Button(210, 340, "8", 60, 60, 160, 100, true);
  buttons[18] = new Button(280, 340, "9", 60, 60, 160, 100, true);
  buttons[19] = new Button(350, 340, "*", 60, 60, 160, 100, false);
  buttons[20] = new Button(70, 270, "Clr", 60, 60, #ff8b60, #f94300, false);
  buttons[21] = new Button(140, 270, "sin", 60, 60, 160, 100, false);
  buttons[22] = new Button(210, 270, "cos", 60, 60, 160, 100, false);
  buttons[23] = new Button(280, 270, "tan", 60, 60, 160, 100, false);
  buttons[24] = new Button(350, 270, "/", 60, 60, 160, 100, false);
}

void draw() {
  background(50);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  updateDisplay();
}

void updateDisplay() {
  fill(200);
  rectMode(CENTER);
  rect(width/2, 100, 380, 60);
  fill(0);
  if (dVal.length()<15) {
    textSize(20);
  } else if (dVal.length() == 14) {
    textSize(18);
  } else if (dVal.length() == 13) {
    textSize(16);
  }
  textAlign(RIGHT);
  text(dVal, width-35, 120);
}

void mousePressed() {
  println("Left:" + l + "Right:" + r + "Result:" + result + "Op:" + op + " L:" + left);
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if ( buttons[i].on && buttons[i].val.equals("Clr")) {
      dVal = "0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      op = '+';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      op = '-';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("*")) {
      op = '*';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("/")) {
      op = '/';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("π")) {
      op = 'π';
      if (left) {
        dVal += str(PI);
        l = float(dVal);
      } else {
        dVal += str(PI);
        r = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      handleEvent("ENTER", false);
      preformCalc();
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+/-")) {
      if (left == true) {
        l *= -1;
        dVal = str(l);
      } else if (left == false) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√")) {
      if (left == true) {
        l = sqrt(l);
        dVal = str(l);
      } else if (left == false) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^²")) {
      if (left == true) {
        l = pow(l, 2);
        dVal = str(l);
      } else if (left == false) {
        r = pow(r, 2);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("log")) {
      if (left == true) {
        l = log(l);
        dVal = str(l);
      } else if (left == false) {
        r = log(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("sin")) {
      if (left == true) {
        l = sin(l);
        dVal = str(l);
      } else if (left == false) {
        r = sin(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("cos")) {
      if (left == true) {
        l = cos(l);
        dVal = str(l);
      } else if (left == false) {
        r = cos(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("tan")) {
      if (left == true) {
        l = tan(l);
        dVal = str(l);
      } else if (left == false) {
        r = tan(r);
        dVal = str(r);
      }
    }
  }
}


void preformCalc() {
  if (op == '+') {
    result = l + r;
    dVal = str(result);
  } else if (op == '-') {
    result = l - r;
    dVal = str(result);
  } else if (op == '*') {
    result = l * r;
    dVal = str(result);
  } else if (op == '/') {
    result = l / r;
    dVal = str(result);
  }
}

// listen for keyboard inputs
void keyPressed() {
  println("Key: " + key);
  println("KeyCode: " + keyCode);
  if ( key == 0 || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if ( key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  }
  if ( key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  }
  if ( key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  }
  if ( key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  }
  if ( key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  }
  if ( key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  }
  if ( key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  }
  if ( key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  }
  if ( key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  }
  if ( key == '.' || keyCode == 110 || keyCode == 58) {
    handleEvent(".", false);
  }
  if ( key == '=' || key == 10) {
    handleEvent("=", false);
  }
  if ( key == '*' || keyCode == 106) {
    handleEvent("*", false);
  }
  if ( key == '/' || keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  }
  if ( key == '-' || keyCode ==109 || keyCode == 45) {
    handleEvent("-", false);
  }
  if ( key == '+' || keyCode == 107 || keyCode == 61) {
    handleEvent("+", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length() <12 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
  }
}
