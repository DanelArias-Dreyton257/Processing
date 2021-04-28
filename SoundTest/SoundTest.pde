import processing.sound.*; 
SoundFile song;
void setup() {
  size(300, 300);
  song = new SoundFile(this, "Animal Crossing.mp3");
  song.play();
}
void draw() {
  float volume = map(mouseY, height, 0, 0, 1);
  song.amp(volume) ;
  float speed = map(mouseX, 0, width, 0, 2);
  song.rate(speed);
}
void mousePressed() {
  if (song.isPlaying()) {
    song.pause();
  } else {
    song.play();
  }
}
