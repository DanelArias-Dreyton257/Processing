public class Ship {

  SoundFile[] flameSound = {new SoundFile(BasicLunarLanding.this, "Flame.mp3"), new SoundFile(BasicLunarLanding.this, "Flame.mp3"), new SoundFile(BasicLunarLanding.this, "Flame.mp3")};

  float h; //Height of the Ship
  float w; //Width of the Ship

  PVector pos = new PVector(); //Position of the Ship (x,y)
  PVector vel = new PVector(); //Velocity of the Ship (vel x, vel y)
  PVector acc = new PVector(); //Acceleration of the Ship (acc x, acc y)
  float rotation = 0;

  float fuel; //Current fuel level of the Ship
  float maxFuel; //Maximun fuel level of the Ship

  color mColor = color(random(255), random(255), random(255)); //main color of the Ship
  color tColor = color(255-red(mColor), 255-green(mColor), 255-blue(mColor)); //Color of the top, calculated as the "inverse" of the main color

  PImage flame; //Image of the flame of the propellers
  boolean propeller[] = {false, false, false}; //LEFT,CENTER,RIGTH. Booleans that indicates if the propeller is activated
  float propellerRotation[] = {3*QUARTER_PI, PI, 5*QUARTER_PI}; //Rotation of the propellers //LEFT, CENTER, RIGHT

  float fuelLoss = 0.25; //how much fuel is lost for each propulsion
  float propellerForce = 0.05; //how much force is applied by the propeller

  /**
   Constructor of the Ship
   */
  public Ship(float x, float y, float w, float h, float fuel) {
    pos.set(new PVector(x, y));
    this.h = h;
    this.w = w;
    this.fuel = fuel;
    this.maxFuel = fuel;
    flame = loadImage("fire.png"); //loads the image of the flame
  }
  /**
   Applies the force to the acceleration of the Ship
   */
  public void applyForce(PVector acc) {
    this.acc.add(acc);
  }
  /**
   Updates the position and other variables of the Ship
   */
  public void update() {
    //Propellers
    if (fuel>0) {
      PVector propellerForceVec = new PVector(0, 0);
      //(PUSHING LEFT) PROPELLER
      if (propeller[0]) {
        propellerForceVec = new PVector(-propellerForce*0.8, -propellerForce*0.2);
        propellerForceVec.rotate(rotation); //Rotates the velocity to the current rotation
        applyForce(propellerForceVec);
        rotation-=0.01;
        fuel-=fuelLoss;
      }
      //(PUSHING UP) PROPELLER
      if (propeller[1]) {
        propellerForceVec = new PVector(0, -propellerForce*2);
        propellerForceVec.rotate(rotation);//Rotates the velocity to the current rotation
        applyForce(propellerForceVec);
        fuel-=fuelLoss;
      }
      //(PUSHING RIGTH) PROPELLER
      if (propeller[2]) {
        propellerForceVec =new PVector(+propellerForce*0.8, -propellerForce*0.2);
        propellerForceVec.rotate(rotation);//Rotates the velocity to the current rotation
        applyForce(propellerForceVec);
        rotation+=0.01;
        fuel-=fuelLoss;
      }
    }
    //Updates the ship's movement
    vel.add(acc);
    pos.add(vel);
    acc.set(new PVector());
  }
  /** Returns true if the ship collides with the floor indicated by the y value passed as a parameter 
   */
  public boolean collideFloor( float floorHeight ) {
    return pos.y>=floorHeight - h/2;
  }
  /** Checks if the x value of the ship is between the parameters. If it exceeds the boundaries it "recolocates" the ship
   */
  public void checkXBounds(float minWidth, float maxWidth) {
    if (pos.x<=minWidth+w/2) {
      pos.x = minWidth+w/2;
      vel.x = 0;
    } else if (pos.x>=maxWidth-w/2) {
      pos.x = maxWidth-w/2;
      vel.x *= 0;
    }
  }
  /** Draws the ship
   */
  public void show() {
    //Draws the body of the Ship
    push();
    stroke(0);
    fill(mColor);
    strokeWeight(2.5);
    translate(pos.x, pos.y);
    rotate(rotation);
    rectMode(CENTER);
    rect(0, 0, w, h); //Draws the rectangle of the body
    fill(tColor);
    triangle(-w, -h/3, 0, -3*h/4, w, -h/3); //Draws the top of the ship
    pop();

    //Draws the propellers
    if (fuel>0) {
      if (propeller[0]) {//LEFT

        push();
        //Colocates and rotates the image
        imageMode(CENTER);
        translate(pos.x, pos.y);
        rotate(rotation);
        translate(w*2, 3*h/4);
        rotate(propellerRotation[0]);
        image(flame, 0, 0, w, h);
        pop();
      }
      if (propeller[1]) {//CENTER

        push();
        //Colocates and rotates the image
        imageMode(CENTER);
        translate(pos.x, pos.y);
        rotate(rotation);
        translate(0, h);
        rotate(propellerRotation[1]);
        image(flame, 0, 0, w*2, h);
        pop();
      }
      if (propeller[2]) {//RIGTH

        push();
        //Colocates and rotates the image
        imageMode(CENTER);
        translate(pos.x, pos.y);
        rotate(rotation);
        translate(-w*2, 3*h/4);
        rotate(propellerRotation[2]);
        image(flame, 0, 0, w, h);
        pop();
      }
    }
  }
  /**Stops all the propeller flame sounds
   */
  public void stopSound() {
    for (SoundFile f : flameSound) {
      if (f.isPlaying()) {
        f.pause();
      }
      f.stop();
    }
  }
}
