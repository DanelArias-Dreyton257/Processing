size(600, 600);

float cx1,cy1,cx2,cy2;
cx1 = random(width/2);
cy1 = random(height);
cx2 = width/2 + random(width/2);
cy2 = random(height);
push();
stroke(0);
strokeWeight(2);
line(0,0,width,height);
pop();

push();
noFill();
stroke(255,255,0,200);
strokeWeight(10);
bezier(0, 0, cx1, cy1, cx2, cy2, width, height);
pop();

push();
strokeWeight(50);
stroke(0,0,255,100);
point(cx1, cy1);
point(cx2, cy2);
pop();
push();
strokeWeight(5);
stroke(0);
point(cx1, cy1);
point(cx2, cy2);
pop();
