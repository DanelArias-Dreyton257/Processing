public abstract class GameObject {
  public PVector pos = new PVector(0, 0);
  public PVector vel = new PVector(0, 0);
  public PVector acc = new PVector(0, 0);
  public PVector fillColor = new PVector(int(random(255)), int(random(255)), int(random(255)));

  public GameObject(float x, float y) {
    pos.x = x;
    pos.y = y;
  }
  public void update() {
    vel.add(acc);
    pos.add(vel);
    acc.set(0,0,0);
  }
  public void applyForce(PVector acc) {
    this.acc.add(acc);
  }
  public void friction(){
    this.vel.mult(0.9);
  }
  abstract public void show();
  abstract public void checkBounds(float winWidth, float winHeight);
}
