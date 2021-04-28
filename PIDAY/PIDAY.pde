Block b1, b2;
double count = 0;
int numDigits = 6;
double steps = pow(10,numDigits-1.5);
void setup() {
  size(600, 250);
  b1 = new Block(width/5, height, 100, 100, 1);
  double m2 = pow(100, numDigits-1);
  b2 = new Block(3*width/5, height, 200, 200, m2);
  b2.velX = -((double)1 / steps);
}
void draw() {
  background(200);
  for (int i = 0; i<steps; i++) {
    if (b1.intersect(b2)) {
      double nV1 = b1.bounce(b2);
      double nV2 = b2.bounce(b1);
      b1.velX = nV1;
      b2.velX = nV2;
      count++;
    }
    if (b1.hitWall()) {
      b1.velX*=-1;
      count++;
    }
    b1.update();
    b2.update();
  }
  b1.show();
  b2.show();
  fill(0);
  textSize(32);
  textAlign(LEFT, TOP);
  text(count+"", 0, 0);
}
