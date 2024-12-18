// Jake Long | Grades App |Sept 11 2024
float grade;

void setup() {
  windowResizable(true);
  size(400, 150);
  textAlign(CENTER);
  background(200);
}

void draw() {
  background(200);

  //Title
  fill(0);
  textSize(35);
  textAlign(CENTER);
  text("Grades: By Jake Long", width/2, 40);
  grade = random(0, 4.00001);

  //Reference Line
  stroke(10, 10, 27);
  strokeWeight(2);
  line(0, 100, width, 100);

  //Tic Marks
  //line(200, 95, 200, 105);
  for (int i=0; i<width; i+=50) {
    line(i, 95, i, 105);
    textSize(9);
    text((float) i/width*4, i, 90);
  }

  //Marker
  ellipse(mouseX, 100, 8, 8);
  textSize(15);
  text((float) mouseX/width*4, mouseX, 90);

  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    text("Assign letter grade A.", width/2, 135);
  } else if (tgrade >= 3.00) {
    text("Assign letter grade A-.", width/2, 135);
  } else if (tgrade >= 2.84) {
    text("Assign letter grade B+.", width/2, 135);
  } else if (tgrade >= 2.67) {
    text("Assign letter grade B.", width/2, 135);
  } else if (tgrade >= 2.50) {
    text("Assign letter grade B-.", width/2, 135);
  } else if (tgrade >= 2.34) {
    text("Assign letter grade C+.", width/2, 135);
  } else if (tgrade >= 2.17) {
    text("Assign letter grade C.", width/2, 135);
  } else if (tgrade >= 2.00) {
    text("Assign letter grade C-.", width/2, 135);
  } else if (tgrade >= 1.66) {
    text("Assign letter grade D+.", width/2, 135);
  } else if (tgrade >= 1.33) {
    text("Assign letter grade D.", width/2, 135);
  } else if (tgrade >= 1.00) {
    text("Assign letter grade D-.", width/2, 135);
  } else {
    text("Assign letter grade F.", width/2, 135);
  }
}
