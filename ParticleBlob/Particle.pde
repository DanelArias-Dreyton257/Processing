public class Particle {
  //x and y coordinates of the particle
  float x;
  float y;
  float radius = 1; //radius of the particle
  color c = color(0,0,0,200); //color of the particle
  /**
  Constructor of the particle
  */
  public Particle(float x, float y) {
    //Saves the parameters as the coordinates for the particle
    this.x = x;
    this.y = y;
  }
  /**
  Draws the particle
  */
  public void show() {
    push();//The following state changes wil only affect to the following
    strokeWeight(radius); //changes the weight of the stroke to the radius value
    stroke(c); //sets the stroke color to the color of the particle
    point(this.x, this.y); //Draws a point on the position of the particle
    pop(); //The previous state changes will only affect to the previous
  }
}
