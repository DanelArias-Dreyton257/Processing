 //<>//
void setup() {
  size(800, 600);

  float[] values = {25.0, 45.0, 5.0, 15.0, 10.0}; //example array

  pieChart(width/2, height/2, 150, values, true); //calls the function
}

/**
 Draws a piechart according to the parameters
 @param x x coordinate of the piechart, center location
 @param y y coordinate of the piechart, center location
 @param radius
 @param values array of values that sum up to 100
 @param text True if text indicating the percentaje
 */
void pieChart(float x, float y, float radius, float[] values, boolean text) {

  float angSum= 0; //stores the sum of the angles

  for (float val : values) {

    float ang = (val/100) * TWO_PI; //calculates the angle by doing a rule of 3

    fill(random(255), random(255), random(255));// Selects a random color
    arc(x, y, radius*2, radius*2, angSum, ang+angSum, PIE); //Draws the piece of the piechart

    if (text) {
      push(); //the following state changes only apply for the following
      textSize(radius / 5); //Sets the text size to a fifth of the radius
      textAlign(CENTER); //Sets the text alignment to the center 
      fill(0); //changes the color to blck
      float margin = radius/50; //The margin is selected toa 1/50 0f the radius
      float textX = x+cos(ang/2+angSum)*(radius*(10+margin)/10); //calculates the x position of the text
      float textY = y+sin(ang/2+angSum)*(radius*(10+margin)/10); //calculates the y position of the text
      text(round(val)+"%", textX, textY ); //displays the text after rounding the value
      pop();//the previous state changes only apply for the previous
    }

    angSum+=ang; //increments the sum with the actual angle
  }
}
