PVector prevMouse; //Vector that stores a x and a y position
void setup() {
  size(700, 700);//Sets the size to 700px width and 700px height
}
void draw() {//This loop is neccessary for processing to draw
}
void mousePressed() { //This function is called when the mouse is pressed
  prevMouse = new PVector(mouseX, mouseY); //creates a new vector with the X and Y position of the mouse
}
void mouseReleased() {//This function is called when the mouse is released
  push();
  strokeWeight(5); //Sets the weight of the stroke
  stroke(0, 200); //Sets the color of the stroke to black and the alpha to 200
  line(prevMouse.x, prevMouse.y, mouseX, mouseY); //Draws the line between the previous mouse position and the current one
  pop();

  prevMouse = null; //Resets the vector to null
}
void mouseClicked() {//This function is called when the mouse is clicked
  push();
  ellipseMode(CENTER);//The ellipse is drawn as the x and y parameters are the center
  fill(255, 0, 0, 200); //Sets the color to red and alpha to 200
  ellipse(mouseX, mouseY, 10, 10); //Draws a ellipse at the mouse position with height and width of 10 px
  pop();
}
