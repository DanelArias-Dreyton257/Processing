 //<>//
size(600, 400); // sets the size of the window to 1000 px wide and 600 px high

float x = width/2; //center point at the X-axis
float y = height/2; //center point at the Y-axis
int sides = 6; // number of sides for the polygon to be drawn 
float size = min(height, width) / 3; //size of the polygon, as the radius of the circunscrite circle

float interval = TWO_PI / sides; //angle of the interval
float prevAng = 0; //previous angle, starts at 0 because is from it starts to draw the polygon
float precisionCorrection = 0.0001; //small number to adjust slightly the angle

//Iterate for the 2PI radians jumping the interval at each iteration
for (float ang=interval; ang<=TWO_PI+precisionCorrection; ang+=interval) {
  strokeWeight(size/10); //Sets the stroke weight of the line to a tenth of the size
  //Draws a line from the position in the circunscrite circle of the previous angle to the position in the circunscrite circle of the current angle
  line(cos(prevAng) * size + x, sin(prevAng) * size + y, cos(ang) * size+ x, sin(ang) * size+ y);
  prevAng = ang; //sets the previous angle to the current angle
}
