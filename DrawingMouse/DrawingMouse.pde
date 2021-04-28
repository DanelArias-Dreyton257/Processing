color c = color(0); //Color of the stroke (starts at black)
void setup() {
  size(600, 600);//Sets the sixe to 600px wide and 600px high
  background(255);//Sets the background color to white
}
void draw() {

  if (mousePressed) { //If the mouse is pressed

    if (mouseButton == LEFT) { //if the left button is pressed
      stroke(c);//Sets the stroke color to the color selected
      strokeWeight(5); //Changes the stroke weight
      line(pmouseX, pmouseY, mouseX, mouseY); //Draws a line from the previous mouse position to the current mouse position
    } else if (mouseButton == RIGHT) { //if the right button is pressed
      stroke(255);//Sets the stroke color to white
      strokeWeight(50); //Changes the stroke weight
      line(pmouseX, pmouseY, mouseX, mouseY); //Draws a line from the previous mouse position to the current mouse position
    } else if (mouseButton == CENTER) { //if the center button is pressed
      c = color(random(256), random(256), random(256));//Changes the current color to a random one
    }
  }
}
