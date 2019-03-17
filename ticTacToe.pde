char[][] board;
int turns = 0;

void setup()
{
  /*lineLen = displayWidth*10/12;
  smooth();
  w = displayWidth;
  h = displayHeight;*/
  size(800, 800);
  makeBoard();
  //drawBoard();
}

void draw()
{
  
}

void makeBoard()
{
  background(255);
  noStroke();
  stroke(0);
  strokeWeight(20);
  line(width*0.65, height*0.15, width*0.65, height*0.85);
  line(width*0.15, height*0.35, width*0.85, height*0.35);
  line(width*0.35, height*0.15, width*0.35, height*0.85);
  line(width*0.15, height*0.65, width*0.85, height*0.65);
}
