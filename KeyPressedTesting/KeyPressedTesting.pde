int brightness = 0; //variable that indicates the brightness between 0 and 255
char c = 'A';//variable that contains the character pressed
int size = 200; //size of the text

void setup() {
  size(600, 600);//Sets the size of the window to 600px wide and 600px high
}
void draw() {
  background(255-brightness);//Sets the "brightness" of the background to the oposite of the variable brightness
  translate(width/2, height/2); //Translates the origin x, y coordinates to width/2 and height/2
  textAlign(CENTER, CENTER);//Sets the alignment of the text to the center
  if (keyPressed) { //If the key is pressed
    if (key>=33 && key<=254) { //Between the 33 and 254 of the ASCII code
      c = key; //Sets the variable to the key pressed
    }
    if (keyCode == LEFT) {//If the key pressed is the left arrow
      brightness--;//decreases the brightness
      brightness = constrain(brightness, 0, 255); //Contrains the brightness between 0 and 255
    }
    if (keyCode == UP) {//If the key pressed is the up arrow
      size++;//increases the text size
      size = constrain(size, 10, min(height, width)); //Contrains the textSize between 10 and the minimun between the height and wide
    }
    if (keyCode == RIGHT) {//If the key pressed is the right arrow
      brightness++;//increases the brightness
      brightness = constrain(brightness, 0, 255);//Contrains the brightness between 0 and 255
    }
    if (keyCode == DOWN) {//If the key pressed is the down arrow
      size--;//decreases the text size
      size = constrain(size, 10, min(height, width));//Contrains the textSize between 10 and the minimun between the height and wide
    }
  }
  
  textSize(size);//Sets the text size
  fill(brightness); //Sets the "fill" color with the brightness
  text(c, 0, 0); //Draws the character at the x=0, y=0
}
