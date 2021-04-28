import processing.sound.*;
//Game Objects
Ship ship;
LandingStation station;

SoundFile crash;
SoundFile missionFailed;
SoundFile happyKids;

//Boolean that contttroles if the game is started
boolean start = false;

//Gravity force
PVector gravity =  new PVector(0, 0.02);

float fuelBarX, fuelBarW, fuelBarY, fuelBarH;

//Messages
String originalMessage = "Press Q key to start";
String message = originalMessage;

int score = 0; //Score of the user

void setup() {
  fullScreen(); //Sets the game to fullScreen
  frameRate(60); //Sets the frameRate to 60 FPS (frames per second)
  float w, h, ws, hs;

  //Calculates the dimensions and position of the fuelBar
  fuelBarX = 89*width/100;
  fuelBarY = 10*height/100;
  fuelBarW = 10*width/100;
  fuelBarH = 88*height/100;

  //Calculates the dimensions of the ship
  w = width / 80;
  h = height / 15;
  float fuel = 100;
  ship = new Ship(random(fuelBarX-w), h/2, w, h, fuel); //Creates the ship in a random valid location

  //Calculates the dimensions of the landing station
  ws = 3 * ship.w; 
  hs = 20;
  station = new LandingStation(random(fuelBarX-ws)+ws/2, height-hs/2, ws, hs); //Creates the landing station in a random valid location

  //Initialize the songs
  crash = new SoundFile(this, "Explosion.mp3");
  missionFailed = new SoundFile(this, "MissionFailed.mp3");
  happyKids = new SoundFile(this, "HappyKids.mp3");
}
void draw() {
  background(0, 0, 100); //Sets the background to a dark blue color

  //Draws the text showing the score of the user
  push();
  textAlign(LEFT, TOP);
  textSize(min(height, width)/25);
  text("Consecutive Score: "+score, 0, 0);
  pop();

  if (start) {//If the game is started

    //Updates the ship valocity and position
    ship.applyForce(gravity);
    ship.update();

    //Check if the ship has collided with the left or right borders
    ship.checkXBounds(0, fuelBarX);

    if (station.landing(ship)) {//If the ship is landing
      if (ship.vel.mag()>=1 || abs(ship.rotation % TWO_PI)>=0.1) { //If the velocity is not too high or the rotation is too much
        crash.play();
        missionFailed.play();
        message = "YOU CRASHED\n"+originalMessage; //Sets the message to inform the user that crashed
        score = 0; //resets the score
        reset(); //resets the game
      } else {
        happyKids.play();
        message = "SUCCESSFUL LANDING\n"+originalMessage;//Sets the message to inform the user that landed well
        score++;//increases the score
        reset();//resets the game
      }
    }
    if (ship.collideFloor(height)) {
      crash.play();
      missionFailed.play();
      message = "YOU CRASHED\n"+originalMessage; //Sets the message to inform the user that crashed
      score = 0;//resets the score
      reset();//resets the game
    }

    ship.show();///Draws the ship
    station.show();//Draws the station

    stroke(255);

    //Fuel Bar
    push();
    strokeWeight(5);
    noFill();

    //Text of the fuel bar
    textAlign(CENTER);
    textSize(min(height, width)/50);
    text("FUEL:\n"+ceil(ship.fuel) +"/"+ceil(ship.maxFuel), fuelBarX+fuelBarW/2, fuelBarY/2);

    //"Container" of the fuel
    rect(fuelBarX, fuelBarY, fuelBarW, fuelBarH);

    //Color of the bar
    if ((ship.fuel/ship.maxFuel)>0.15) { //If the fuel is too ow colors in red
      fill(150);
    } else fill(255, 0, 0);

    //Drawing of the bar
    rect(fuelBarX, fuelBarY + fuelBarH*(1-(ship.fuel/ship.maxFuel)), fuelBarW, fuelBarH*(ship.fuel/ship.maxFuel));
    pop();
  } else {//If the game is not started
    //Draws the text of the message at the middle of the screen
    push();
    textAlign(CENTER);
    textSize(min(height, width)/10);
    text(message, width/2, height/2);
    pop();
  }
}

void keyPressed() {
  if (key == 'Q' || key == 'q') { //If the key pressed is the Q the game starts
    start = true;
  }
  if (keyCode == LEFT) { //If the key is the left arrow activates the first propeller
    ship.propeller[0] = true;
    if (!ship.flameSound[0].isPlaying()) {
      ship.flameSound[0].loop();
    }
  }
  if (keyCode == UP) { //If the key is the up arrow activates the second propeller
    ship.propeller[1] = true;
    if (!ship.flameSound[1].isPlaying()) {
      ship.flameSound[1].loop();
    }
  }
  if (keyCode == RIGHT) { //If the key is the right arrow activates the last propeller
    ship.propeller[2] = true;
    if (!ship.flameSound[2].isPlaying()) {
      ship.flameSound[2].loop();
    }
  }
}
void keyReleased() {
  if (keyCode == LEFT) { //If the key is the left arrow deactivates the first propeller
    ship.propeller[0] = false;
    ship.flameSound[0].pause();
  }
  if (keyCode == UP) { //If the key is the up arrow deactivates the second propeller
    ship.propeller[1] = false;
    ship.flameSound[1].pause();
  }
  if (keyCode == RIGHT) { //If the key is the right arrow deactivates the last propeller
    ship.propeller[2] = false;
    ship.flameSound[2].pause();
  }
}
/**Resets the game
 */
void reset() {
  ship.stopSound();
  ship = new Ship(random(fuelBarX-ship.w), ship.h/2, ship.w, ship.h, ship.maxFuel); //Creates a new ship with most of the previous characteristics
  station = new LandingStation(random(fuelBarX-station.w)+station.w/2, height-station.h/2, station.w, station.h);  //Creates a new landing station with most of the previous characteristics
  start = false; //The game pauses, will not start
}
