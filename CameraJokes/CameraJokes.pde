import processing.video.*;

Capture cam;

PImage img;
int side = 10;
String brChars = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\\|()1{}[]?-_+~<>i!lI;:,\"^`'. ";

void setup() {
  
  brChars = "@%#*+=-:. ";
  
  size(1000, 600);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
  
  frameRate(24);
  
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  img = cam.get();
  img.resize(width/side, height/side);
  //img.filter(GRAY);
  
  //image(img, 0, 0);
  background(255);
  
  loadPixels();
  
  int minV = min(img.pixels);
  int maxV = max(img.pixels);
  
  for (int row = 0; row < img.height; row++) { 
    for (int col = 0; col < img.width; col++) {
      
      int pos = (row*(img.width))+col;
      //print(pos + "\n");
      int val = img.pixels[pos];
      
      //int val = img.get(col,row);
      
      //fill(val);
      //rect(col*side,row*side,side,side);
      
      fill(val);
      int brEleg = round(map(val,minV,maxV+1,0,brChars.length()-1));
      textAlign(CENTER);
      text(brChars.charAt(brEleg),col*side + side/2,row*side - side/2);
      
    }
  }
  
}
