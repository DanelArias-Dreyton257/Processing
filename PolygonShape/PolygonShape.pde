
size(600, 400); // sets the size of the window to 1000 px wide and 600 px high

float x = width/2; //center point at the X-axis
float y = height/2; //center point at the Y-axis
int sides = 7; // number of sides for the polygon to be drawn 
float size = min(height, width) / 4; //size of the polygon, as the radius of the circumbscrite circle

float interval = TWO_PI / sides; //angle of the interval

fill(random(255), random(255), random(255)); //fills the polygon with a random color

beginShape();//Starts the shape "creation"
//Iterate for the 2PI radians jumping the interval at each iteration
for (float ang=0; ang<TWO_PI; ang+=interval) {
  strokeWeight(size/10); //Sets the stroke weight of the line to a tenth of the size
  //creates a vertex calculating the position in the circumbscrite circle
  vertex(cos(ang) * size+ x, sin(ang) * size+ y);
}
endShape(CLOSE);//finishes the shape closing it.
