PImage img;

Spot[][] board = new Spot[3][3];
int col = 3;
int row = 3;
int turns = 0; 
int player = 0;//player = -0, computer = 1
int sLeft = 9;
float first;
int round = 0;

void setup()
{
  size(2100, 1400);
  smooth();
  for(int i = 0; i < col;i++)
  {
    for(int j = 0; j < row;j++)
    {
        board[i][j] = new Spot(i*(width/3), j*(height/3), width/3, height/3);
    }
  }
  
  //makeBoard();
  first = random(0, 100);
  // Load image from a web server
  img = loadImage("Ximg.png");
  
    if(first > 50) //Above 50, computer first
    {
      first = 0;
      player = 1;
    }
    else // else, pla first
    {
      player = 0;
      first = 1;
    }
    
    
    
 
}

void draw()
{
  background(0);
  background(255);
  fill(255);
  
  for(int i = 0; i < col;i++)
  {
    for(int j = 0; j < row;j++)
    {
      board[i][j].display();
    } 
  }
}

void mousePressed()
{
   for(int i = 0; i < col;i++)
  {
    for(int j = 0; j < row;j++)
    {
      board[i][j].pick(mouseX, mouseY);
    } 
  } 
}
