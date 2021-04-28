float x, y; //declaration of two variables
float coefx2 = -1; //coeficient of the x^2 term of the parabola
float coefx = 0; //coeficient of the x term of the parabola
float desp = 0; //value of the independent term of the parabola

size(800, 600); //sets the size of the window displayed to 800px wide and 600px high

background(255); //sets the background to white color

stroke(150, 150, 150, 200); //Sets the stroke color to a gray semitransparent color
strokeWeight(2); //Sets the stroke weight to 2px

line(0, height/2, width, height/2); //Draws a line separating the upper and the lower part of the window
line(width/2, 0, width/2, height); //Draws a line separating the left and the right part of the window

strokeWeight(5); //Sets the stroke weight to 5px
stroke(0, 0, 255); //Sets the color of the stroke to blue

//Iterate through the width of the window
for (int i=0; i<=width; i++) {
  float x1 = i - width/2; //calculates the x value supposing the 0 value is at the center of the window
  x = map(x1, -width/2, width/2, (-width/2) / 10, (width/2) / 10); //maps the value for a better visualization
  y = -(coefx2 * x * x  + coefx * x + desp) + height/2; //calculates the y using the parabola function, and taking into account the y=0 value is at the center of the window and that y is reversed, incrementing goes up and decrementing goes down.
  point(i, y); //draws the point at the indicated coordinates
}
