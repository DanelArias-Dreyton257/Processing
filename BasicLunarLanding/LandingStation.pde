public class LandingStation {
  float h; //Height of the Station
  float w; //Width of the Station

  PVector pos = new PVector(); //Position of the station

  color c = color(255, 0, 0); //Color of the station
  /**
   Constructor of the landing station
   */
  public LandingStation(float x, float y, float w, float h) {
    pos.set(new PVector(x, y));
    this.h = h;
    this.w = w;
  }
  /** Returns true if the ship is ready to land
   */
  public boolean landing(Ship p) {
    if (p.pos.x>=this.pos.x-w/2 && p.pos.x<=this.pos.x+w/2) {//Idf is in the range of the landing station
      float d = abs(this.pos.y -this.h/2 - (p.pos.y + p.h/2)); //calculates the distance between the landing station and the ship
      if (d<5) { //If the distance between the landing station and the rocket is less than 5
        return true;
      }
    } 
    return false;
  } 
  /**
   Draws the landing station
   */
  public void show() {
    push();
    fill(c);
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
    pop();
  }
}
