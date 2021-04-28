import java.util.*;

int[][] table;
final int O = 1;
final int X = -1;

int turn = 0;

int rows = 3; 
int cols = rows;

float w;
float h;

float div;

void setup() {
  size(800, 800);

  div = min(height, width) / 100;

  table = new int[rows][cols];
}
void draw() {
  background(50);
  w = width / cols;
  h = height / rows;
  for (int i = 0; i<rows; i++) {
    for (int j= 0; j<cols; j++) {

      push();
      fill(200);
      rect(w*j, h*i, w, h);
      pop();

      push();
      strokeWeight(w * h / 2500);
      if (table[i][j] == O) { 
        noFill();
        stroke(0, 0, 255);
        ellipse(w*j + w/2, h*i + h/2, w-w/div, h-h/div);
      } else if (table[i][j] == X) {
        stroke(255, 0, 0);
        line(w*j + w/div, h*i +h/div, w*j+w -w/div, h*i+h -h/div);
        line(w*j+w - w/div, h*i +h/div, w*j + w/div, h*i+h -h/div);
      }
      pop();
    }
  }
}

void mouseClicked() {
  checkAndChange(mouseX, mouseY);
  int r = checkWIN();
  if (r!=0) {
    String s = " WINS";
    if (r==X) {
      s="Player X"+s;
    } else if (r==O) {
      s="Player O"+s;
    }
    System.out.println(s);
    resetTable();
  }
}

int checkWIN() {
  //check horizontal
  for (int i = 0; i<rows; i++) {
    int check = table[i][0];
    for (int j= 0; j<cols; j++) {
      if (table[i][j]!=check) { 
        break;
      } else if (j==cols-1) {
        return check;
      }
    }
  }
  //check vertical
  for (int j = 0; j<cols; j++) {
    int check = table[0][j];
    for (int i= 0; i<rows; i++) {
      if (table[i][j]!=check) { 
        break;
      } else if (i==rows-1) {
        return check;
      }
    }
  }
  //check diagonal
  int check = table[0][0];
  boolean prev = true;
  for (int i = 0; i<rows; i++) {
    prev = prev && check == table[i][i];
    if (!prev) {
      break;
    } else if (i==rows-1) {
      return check;
    }
  }
  //check other diagonal
  check = table[0][cols-1];
  prev = true;
  for (int i = 0; i<rows; i++) {
    prev = prev && check == table[i][cols-1-i];
    if (!prev) {
      break;
    } else if (i==rows-1) {
      return check;
    }
  }
  return 0;
}

void resetTable() {
  for (int i = 0; i<rows; i++) {
    for (int j= 0; j<cols; j++) {
      table[i][j] = 0;
    }
  }
}

void checkAndChange(float x, float y) {
  if ((x>=0 && width<=x) || (y>=0 && height<=y)) return;
  int col = floor(x / w);
  int row = floor(y / h);
  if (table[row][col]!=0) return;
  if (turn %2 == 0) {
    table[row][col] = -1;
  } else {
    table[row][col] = 1;
  }
  turn++;
}
