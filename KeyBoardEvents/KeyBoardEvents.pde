String text = ""; //Variable that stores the written text
int size = 32; //Initial size of the text
color elColor = color(0); //Variable that stores the ellipse color

void setup() {
  size(600, 600); //Sets the screen dimensions to 600px wide and 600 px high
}
void draw() {
  background(100);
  //Text that shows the size
  textAlign(LEFT, TOP); //Aligns the text to the top left
  fill(255);
  textSize(24);
  text("Size:" +size,0,0); //Draws the text indicating the size
  
  //Text writed
  textSize(size); //Sets the size of the text
  textAlign(CENTER, CENTER); //Aligns the text to center in the x axis and the y axis
  fill(255);
  text(text, width/2, height/2-50); //Draws the text at the nearly at the midle of the window
  
  //The ellipse that shows is a key is pressed
  fill(elColor);
  ellipse(width/2, height -50, 50, 50); //Draws an ellipse at the bottom of the window
}

void keyPressed() { //When a key is pressed
  elColor = color(255,0,0);
  if (keyCode==UP) { //If the pressed key is the up arroy
    size++; //Increases the size
  } else if (keyCode ==DOWN) { //If the pressed key is the down arrow
    size--; //reduces the size
  }
  size = constrain(size, 10, min(height-50,width)/5); //Contrains the size between 10 and 100
}

void keyReleased() { //When the key is released
  elColor = color(0); //Sets the color of the ellipse back to black
}

void keyTyped() { //when a key is typed
  if (key == BACKSPACE) { //If the typed key is a backspace
    if (text.length()>0) { //If the string is not an empty string
      text = text.substring(0, text.length()-1); //removes the ast character of the string
    }
  } else {
    text+=key; //Adds the typed character to the string
  }
}
