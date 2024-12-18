//Jake Long | Temp Converter | Sept 23 2024

void setup() {
  size (400, 200);
}

void draw() {
  background(128);

  line(0, 150, width, 150);
  for (int i=-200; i<width; i+=50) {
    line (i+200, 145, i+200, 155);
    textAlign(CENTER);
    text (i, i+200, 165);
  }

text("Cel:" + farToCel(mouseX-200), width/2, 100);
println( "MouseX:" + mouseX + " : " + farToCel(mouseX));
}

float farToCel(float tempFar) {
  tempFar = (tempFar-32) * (5.0/9.0);
  return tempFar;
}

float celToFar(float tempCel) {
  tempCel = (tempCel*9.0/5.0) + (32);
  return tempCel;
}
