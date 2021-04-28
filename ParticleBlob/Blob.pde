public class Blob {
  public Particle[] particles; //array of particles that form the blob
  //x and y coordinates of the blob
  float x;
  float y;
  float radius; //radius of the starting blob
  color c = color(random(255), random(255), random(255)); //color of the blob
  /**
   Constructor of the Blob
   */
  public Blob(float x, float y, float radius, int numPart) {
    //Sets the values passed as parameters
    this.x = x;
    this.y = y;
    this.radius = radius;
    //Creates the array of particles and fills it
    particles = new Particle[numPart];
    //The particles will be distributed as a part of a circle
    for (int i = 0; i<numPart; i++) {
      float ang = (TWO_PI/numPart) * i; //calculates the angle of the circle in which the particle will be
      //Creation of the particle
      particles[i] = new Particle(x + cos(ang)*radius, y + sin(ang)*radius);
      particles[i].radius =radius / numPart; //The radius of the particles are bigger if the are less of them
    }
  }
  /**
   Draws the blob
   */
  public void show() {
    fill(c);
    beginShape(); //Starts the shape
    curveVertex(particles[0].x, particles[0].y); //fixes the point because curveVertex uses the 1st and the last vertex as guideline instead of doing "passing by" it.
    //Iterate through the particles using each position as a vertex, and drawing eachparticle too.
    for (Particle p : particles) {
      curveVertex(p.x, p.y);
      p.show();
    }
    curveVertex(particles[0].x, particles[0].y); //fixes the point because curveVertex uses the 1st and the last vertex as guideline instead of doing "passing by" it.
    endShape(CLOSE); //The shape will have a closed perimeter
  }
  /**
   Returns the nearest particle to the position given as a parameter
   */
  public Particle getNearestParticle(float x, float y) {
    float minDist = dist(0, 0, width, height); //Sets the minimun distance as the maximun posible
    int minIndex = 0; //This variable will strore the index of the nearest particle
    for (int i = 0; i<particles.length; i++) { //Iterate through all the particles
      float dist = dist(x, y, particles[i].x, particles[i].y); //calculate the distance
      if (dist<minDist) {//If the distance calculated is less than the minimun stored one, replace it
        minDist = dist;
        minIndex = i;
      }
    }
    return particles[minIndex]; //returns the nearest particle
  }
}
