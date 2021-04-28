public class Circle extends GameObject {
  public float rad = 1;
  public Circle(float x, float y, float rad) {
    super(x, y);
    this.rad = rad;
  }
  public void show() {
    fill(fillColor.x,fillColor.y,fillColor.z);
    ellipse(pos.x, pos.y, rad*2, rad*2);
  }
  public void checkBounds(float winWidth, float winHeight) {
    if (pos.x+rad>=winWidth) {
      vel.x*=-1;
      pos.x = winWidth-rad;
      friction();
    } 
    else if(pos.x-rad<=0){
      vel.x*=-1;
      pos.x=rad;
      friction();
    }else if (pos.y+rad>=winHeight) {
      vel.y*=-1;
      pos.y = winHeight-rad;
      friction();
    }else if(pos.y-rad<=0){
      vel.y*=-1;
      pos.y=rad;
      friction();
    }
  }
}
