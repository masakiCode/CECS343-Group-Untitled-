PImage img;
 
final int imgWidth=275;
final int imgHeight=275;

Spot[][] board;
int col = 3;
int row = 3;
int turns = 0; 
int player = 0;//player = -0, computer = 1
int full = 9;
float first;


void setup()
{
  size(900, 900);
  makeBoard();
  first = random(0, 100);
  
  textAlign(CENTER,CENTER);
  fill(255,0,0);
  textSize(28);
 
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
  /*if(mouseX > 0 && mouseX < 300 && mouseY > 0 && mouseY < 300 && mousePressed)
  {
    
  }*/
  
  
 
  //Detects click only if inside image
  if(mousePressed==true && mouseX<imgWidth && mouseY<imgHeight)
  {
      image(img,10,10, imgWidth,imgHeight);
      text("Clicked!",imgWidth/2,imgHeight/2);
  }
}



void makeBoard()
{
  background(255);
  noStroke();
  stroke(0);
  strokeWeight(7);
  /*line(300, 0, 300, height);
  line(0, 300, width, 300);
  line(600, 0, 600, height);
  line(0, 600, width, 600);*/
  //noStroke();
  stroke(0);
  rect(0, 0, 300, 300);
  rect(300, 0, 300, 300);
  rect(600, 0, 300, 300);
  rect(0, 300, 300, 300);
  rect(300, 300, 300, 300);
  rect(600, 300, 300, 300);
  rect(0, 600, 300, 300);
  rect(300, 600, 300, 300);
  rect(600, 600, 300, 300);
  
}
