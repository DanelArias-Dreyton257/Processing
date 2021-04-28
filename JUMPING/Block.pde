public class Block extends GameObject {
  public float w = 1;
  public float h = 1;
  public Block(float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
  }
  public void show() {
    fill(fillColor.x, fillColor.y, fillColor.z);
    rect(pos.x - w/2, pos.y-h/2, w, h);
  }
  public void checkBounds(float winWidth, float winHeight) {
    if (pos.x+w/2>=winWidth) {
      vel.x*=-1;
      pos.x = winWidth-w/2;
      friction();
    } 
    else if(pos.x-w/2<=0){
      vel.x*=-1;
      pos.x=w/2;
      friction();
    }else if (pos.y+h/2>=winHeight) {
      vel.y*=-1;
      pos.y = winHeight-h/2;
      friction();
    }else if(pos.y-h/2<=0){
      vel.y*=-1;
      pos.y=h/2;
      friction();
    }
  }
}
