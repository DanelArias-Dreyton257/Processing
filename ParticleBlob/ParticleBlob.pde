Blob b; //The blob
Particle selected = null; //The clicked particle
boolean clicked = false; //boolean indicating if the mouse was clicked
//Prepares the window and creates the blob
void setup() {
  size(600, 600); //Sets the size of the window to 600px wide and 600px high
  b = new Blob(width/2, height/2, min(height,width)/3, 15); //creates a blob at the middle of the screen, with a reasonable size
}
//Iterates each frame
void draw() {
  background(200); //draws the background at color 200,200,200 in RGB code
  if (clicked && selected!=null) { //If a particle is selected, changes its position to the position of the mouse
    selected.x = mouseX;
    selected.y = mouseY;
  }
  b.show(); //draws the blob
}
//function called when the mouse is pressed
void mouseClicked() {
  if (!clicked) { //if it has not been clicked before
    selected = b.getNearestParticle(mouseX,mouseY); //selects the nearest particle to the mouse
    selected.radius *=2; //doubles the radius of the particle
    selected.c = color(255,0,0,200); //changes the color of the particle to red
    clicked = true; //now it has been clicked
  } else {//If it was clicked previously, deselects the particle
    selected.radius *=0.5; //halfs the color of the particle
    selected.c = color(0,0,0,200); //sets the color of the particle to black
    clicked = false; //now it is no longer clicked
  }
}
