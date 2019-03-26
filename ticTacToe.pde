import ddf.minim.*;

PImage img;
Minim minim;

Spot[][] board = new Spot[3][3];
Spot[] difficulty = new Spot[3];
String dif = "Easy";
int col = 3;
int row = 3;
int turns = 0; 
int player = 0; //player = 0 //computer = 1
int sLeft = 9;
float first;    //random
int round = 0;
int level = 9;  //Difficulty Choices
Spot start, hTp, diff, q;
boolean pTurn;
int game = 0;
int dx = 0;
AudioSample v;
AudioSample lose;
AudioSample wrong;
AudioSample w;
int winS = 0;
boolean sound;

void setup()
{
  minim = new Minim(this);
  v = minim.loadSample("victory.mp3");
  lose = minim.loadSample("wrong.wav", 2048);
  wrong = minim.loadSample("nope.mp3");
  w = minim.loadSample("warning.mp3");
  sound = true;
  size(1920, 1080);
  smooth();
  img = loadImage("warn.png");
  //Board made of spots
  for(int i = 0; i < col;i++)
  {
    difficulty[i] = new Spot(width/3, i*(height/3)+25, width/4, height/4);
    difficulty[i].setChosen(level++);
    for(int j = 0; j < row;j++)
    {
        board[i][j] = new Spot(i*(width/3), j*(height/3), width/3, height/3);
    }
  }
  
  start = new Spot(width/8, 100+125, width/3, height/3-100);
  hTp = new Spot((width - width/3)-240, 100+125 , width/3, height/3-100);
  diff = new Spot(width/8, ((height-height/3)-100)+75, width/3, height/3-100);
  q = new Spot((width-width/3)-240, ((height-height/3)-100)+75, width/3, height/3-100);
  
  //Main Menu buttons//
  start.setChosen(5);
  hTp.setChosen(6);
  diff.setChosen(7);
  q.setChosen(8);
  
    first = random(0, 100);
  
    if(first >= 50) //Above 50, computer first
    {
      pTurn = false;
    }
    else // else, player first
    {
      pTurn = true;
    }
}

void draw()
{
  background(255);
  
  //WARNING screen
  if(round == 0)
  {
      fill(255, 0, 0);
      textSize(100);
      if(sound == true)
      {
        w.trigger();
        sound = false;
      }
      //(width/3)+100
      //textAlign(CENTER);
      text("Warning! Warning! Warning!", dx, height/4);
      dx+=7;
      if(width < (dx))
      {
        textAlign(LEFT);
        dx = -1400;
      }
      image(img, 850, 0, 200, 150);
      
      fill(0, 128, 255);
      textSize(60);
      text("The brightness of your computer screen may", (width/2)-width/3, height/3); 
      text("cause minor eye strain during long play sessions", (width/2)-width/3, (height/3)+100);
      text("dim the brightness of your computer for more ", (width/2)-width/3 , (height/3)+200);
      text("fun and reduced eye strain. Thank You, Enjoy!", (width/2)-width/3 , (height/3)+300);
      text("Press Space to continue", width/3 ,height-100);
    
    if(keyPressed && key == ' ')
    {
      round++;
    }    
  }
  
  //Main Menu
  if(round == 1)
  {
    //fill(0);
    //text();
    
    fill(255);
    start.display();
    hTp.display();
    diff.display();
    q.display();
    
    fill(0);
    text("New Game", start.x+150, start.y+150);
    text("How To Play", hTp.x+150, hTp.y+150);
    text("Difficulty", diff.x+150, diff.y+150);
    text("Exit", q.x+250, q.y+150); 
  }
  
  //Game starts
  if(round == 2)
  {
    //X is always first
    if(sLeft == 9)
    {
      player = 0;
    }
    
    checkBoard();
    if(game == 0 && sLeft > 0)
    {
    fill(255);
    for(int i = 0; i < col;i++)
    {
      for(int j = 0; j < row;j++)
      {
        board[i][j].display();
      } 
    }
    
    //Easy AI picks random spot that's not taken
    //Skeleton for the future tic tac toe stragtegy
    if(!pTurn)
    {
      if(dif == "Easy")
      {
        int r = (int)random(0, width);
        int c = (int)random(0, height);
        for(int i = 0; i < col;i++)
        {
          for(int j = 0; j < row;j++)
          {
            if(board[i][j].chosen == 0 && r > board[i][j].x && r < board[i][j].x+board[i][j].w && c > board[i][j].y && c < board[i][j].y+board[i][j].h)
            {
              board[i][j].pick(r, c);
              pTurn = true;
            }
          }
        }
      }
      //else if(dif.equals("Medium"))
      //{
        
      //}
      //else if(dif.equals("Hard"))
      //{
        
      //}
    } 
    
    
  }
    //Print win screen
    if(game != 0)
    { 
       printW();
    }
    else if(game == 2)
    {
    
    printW();
  }
  
  if(game == 1 || game == 2)
  {
    
    printW();
  }
  
  if(game == 0 && sLeft == 0)
  {
    printW();
  }   
  
  }
  
  //How to Play
  if(round == 3)
  {
    fill(0);
    textSize(100);
    text("How to Play", (width/3) , height/5);
    textSize(50);
    text("The objective of this game is to get three in a row.", (width/2)-width/3, height/3); 
    text("The board you play on is 3x3. The first player is", (width/2)-width/3, (height/3)+100);
    text("named X, the second is O. Players will take turns", (width/2)-width/3 , (height/3)+200);
    text("to play the game, until all spaces are filled or one", (width/2)-width/3 , (height/3)+300);
    text("of the players win. Your opponent for this game", (width/2)-width/3 , (height/3)+400);
    text("can be either a person or AI with set difficulty Enjoy!", (width/2)-width/3 , (height/3)+500);
    text("Press Space to go back", width/3 ,height-100);
    
    if(keyPressed && key == ' ')
    {
      round = 1;
    }
  }
  
  //Difficulty Selection
  if(round == 4)
  {
    fill(255);
    for(int i = 0; i < 3;i++)
    {
      difficulty[i].display();
    }
    fill(0);
    text("Easy", difficulty[0].x+175, difficulty[0].y+160);
    text("Medium", difficulty[1].x+125, difficulty[1].y+160);
    text("Hard", difficulty[2].x+175, difficulty[2].y+160);
    
  }
  
}

void mousePressed()
{
  if(round == 2 && sLeft != 0 && game == 0)
  {
   for(int i = 0; i < col;i++)
  {
    for(int j = 0; j < row;j++)
    {
      if(board[i][j].chosen == 0 && mouseX > board[i][j].x && mouseX < board[i][j].x+board[i][j].w && mouseY > board[i][j].y && mouseY < board[i][j].y+board[i][j].h)
      {
         board[i][j].pick(mouseX, mouseY);   
         pTurn = false;
      }
      else if(board[i][j].chosen != 0 && mouseX > board[i][j].x && mouseX < board[i][j].x+board[i][j].w && mouseY > board[i][j].y && mouseY < board[i][j].y+board[i][j].h && game == 0)
      {
         wrong.trigger(); 
      }
    } 
  }  
  }
  if(round == 1)
  {
    start.decide(mouseX, mouseY);
    hTp.decide(mouseX, mouseY);
    diff.decide(mouseX, mouseY);
    q.decide(mouseX, mouseY);
  }
  if(round == 4)
  {
    for(int i = 0; i < 3; i++)
    {
     difficulty[i].setDiff(mouseX, mouseY); 
    }
  }
  print("MouseX: "+mouseX+" MouseY: "+ mouseY+"\n");
}

void checkBoard()
{ 
  //Check rows and cols
  for(int i = 0; i < 3; i++)
  {
    if(board[i][0].chosen == 1 && board[i][1].chosen == 1 && board[i][2].chosen == 1)
    {
      game = 1;
    }
    
    else if(board[i][0].chosen == 2 && board[i][1].chosen == 2 && board[i][2].chosen == 2)
    {
      game = 2;
    }
    
    else if(board[0][i].chosen == 1 && board[1][i].chosen == 1 && board[2][i].chosen == 1)
    {
      game = 1;
    }
    
    else if(board[0][i].chosen == 2 && board[1][i].chosen == 2 && board[2][i].chosen == 2)
    {
      game = 2;
    }
  }
  
  if(board[0][0].chosen == 1 && board[1][1].chosen == 1 && board[2][2].chosen == 1)
  {
    game = 1;
  }
  
  else if(board[0][0].chosen == 2 && board[1][1].chosen == 2 && board[2][2].chosen == 2)
  {
    game = 2;
  }
  
  else if(board[0][2].chosen == 1 && board[1][1].chosen == 1 && board[2][0].chosen == 1)
  {
    game = 1; 
  }
  
  else if(board[0][2].chosen == 2 && board[1][1].chosen == 2 && board[2][0].chosen == 2)
  {
    game = 2; 
  }
}

void printW()
{
    fill(0);
    stroke(0);
    textSize(50);
 if(game == 1)
  { 
    //Winner with # of turns Player/AI for X
    if(pTurn == true)
    {
      fill(0);
      stroke(0);
      textSize(50);
      text("Can you try a little \nharder next game?\n"+"AI won in "+turns+" turns", width/3 + 60, height/3);
      if(winS == 0)
      {
        lose.trigger();
        winS++;
      }
    }
    else
    {
      fill(0);
      stroke(0);
      textSize(50);
      text("Player X wins the game!\n"+"          Turns: "+turns, width/3 + 60, height/3);
      
      if(winS == 0)
      {
        v.trigger();
        winS++;
      }
    }
    
  }
  else if(game == 2)
  {
    
    //Winner with # of turns Player/AI for X
    if(pTurn == true)
    {
      fill(0);
      stroke(0);
      textSize(50);
      text("Can you try a little \nharder next game?\n"+"AI won in "+turns+" turns", width/3 + 60, height/3);
     // lose.trigger();
     if(winS == 0)
      {
        lose.trigger();
        winS++;
      }
  }
    
    else
    {
      fill(0);
      stroke(0);
      textSize(50);
      text("Player O wins the game!\n"+"          Turns: "+turns, width/3 + 60, height/3);
     
     if(winS == 0)
      {
        v.trigger();
        winS++;
      }
    }
  }
  
  if(game == 1 || game == 2)
  {
    
    fill(0);
    stroke(0);
    textSize(50);
    text("Press Enter to play again, Space to go back, or e to exit!", (width/4) - 150, height-100);
  }
  
  if(game == 0 && sLeft == 0)
  {
    
    fill(0);
    stroke(0);
    textSize(50);
    text("It's a tie game!", width/3 + 100, height/3);
    text("Press Enter to play again, Space to go back, or e to exit!", (width/4) - 150, height-100);
  }   
}

void keyPressed()
{
  
  //Reset Game
  if(round == 2 && game == 0 && sLeft == 0)
  {
    if(key == ENTER)
    {
      round = 2;
      for(int i = 0; i < 3; i++)
      {
        for(int j = 0; j < 3; j++)
        {
           board[i][j].clean();
           game = 0;
           sLeft = 9;
           turns = 0;
           winS=0;
        }
      }
      first = random(0, 100);
    }
    else if(key == ' ' && keyPressed)
    {
      round = 1;
      for(int i = 0; i < 3; i++)
      {
        for(int j = 0; j < 3; j++)
        {
           board[i][j].clean();
           game = 0;
           sLeft = 9;
           winS=0;
        }
      }
      first = random(0, 100);
    }
    else if(key == 'e' || key == 'E' && keyPressed)
    {
      exit();
    }
  }
  
  else if(round == 2 && (game == 1 || game == 2))
  {
    if(key == ENTER && keyPressed)
    {
    round = 2;
    for(int i = 0; i < 3; i++)
      {
        for(int j = 0; j < 3; j++)
        {
           board[i][j].clean();
           game = 0;
           sLeft = 9;
           turns = 0;
           winS=0;
        }
      }
      
      first = random(0, 100);
    }
    
    else if(key == ' ' && keyPressed)
    {
       round = 1; 
       for(int i = 0; i < 3; i++)
      {
        for(int j = 0; j < 3; j++)
        {
           board[i][j].clean();
           game = 0;
           sLeft = 9;
           turns = 0;
           winS=0;
        }
      }
      first = random(0, 100);
    }
    else if(key == 'e' || key == 'E' && keyPressed)
    {
      exit();
    }
  }
}
