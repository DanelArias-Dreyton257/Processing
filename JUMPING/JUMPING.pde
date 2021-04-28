Block b;
Circle c;
int num = 10; //<>//
PVector gravity = new PVector(0,0.1);
void setup() {
  frameRate(120);
  size(400, 400);
  b = new Block(random(width), random(height), 50, 70);
  c = new Circle(random(width), random(height), 20);
  b.vel = new PVector(random(num)-num/2,random(num)-num/2);
  c.vel = new PVector(random(num)-num/2,random(num)-num/2);
}
void draw() {
  GameObject[] objs = {b, c};
  background(200);
  for (GameObject g : objs) {
    g.applyForce(gravity);
    g.update();
    g.checkBounds(width,height);
    g.show();
  }
}
