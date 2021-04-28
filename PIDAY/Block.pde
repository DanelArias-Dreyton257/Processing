public class Block {
  double y;
  double x;
  double velX;
  float h;
  float w;
  double m;
  color c = color(random(256), random(256), random(256));
  public Block(double x, double y, float w, float h, double mass) {
    this.m = mass;
    this.w = w;
    this.h = h;
    this.x = x+this.w/2;
    this.y = y-this.h/2;
  }
  public void update() {
    x+=velX;
  }
  public void show() {
    push();
    fill(c);
    rectMode(CENTER);
    rect((float)x, (float)y, w, h);
    pop();
  }
  public boolean intersect(Block b) {
    return !(this.x + this.w/2 <= b.x - b.w/2 || this.x - this.w/2 >= b.x + b.w/2);
  }
  public double bounce(Block b) {
    double sumMass = this.m + b.m;
    return ((this.m - b.m) / sumMass) * this.velX + (2 * b.m / sumMass) * b.velX;
  }
  public boolean hitWall() {
    return (this.x - this.w/2<= 0);
  }
}
