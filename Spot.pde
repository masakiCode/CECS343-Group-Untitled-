class Spot
{
   int x; // spot x coordinates
   int y; //spot y coordinates
   int w; // spot x dimensions
   int h; // spot y dimensions
   int chosen = 0; //spot picked or not. 0 for untaken, 1 for taken
   PImage xImg = loadImage("crab.jpg"); 
   PImage oImg = loadImage("bHole.jpg");
   PImage bImg = loadImage("blank.jpg");
   
   Spot(int newX, int newY, int newW, int newH)
   {
      x = newX;
      y = newY;
      w = newW;
      h = newH;
   }
   
   void pick(int cX, int cY)
   {
       
       if (cX > x && cX < x+w && cY > y && cY < y+h) 
       {
         
         //X turn
        if (player == 0 && chosen == 0) 
        {
          chosen = 1;
          player = 1;
          turns++;
          sLeft--;
        } 
        
        //O turn
        else if (player == 1 && chosen == 0) 
        {
            chosen = 2;
            player = 0;
            turns++;
            sLeft--;   
        }
       }
    }
    
    void pick()
   {
         //X turn
        if (player == 0 && chosen == 0) 
        {
          chosen = 1;
          player = 1;
          turns++;
          sLeft--;
        } 
        
        //O turn
        else if (player == 1 && chosen == 0) 
        {
            chosen = 2;
            player = 0;
            turns++;
            sLeft--;   
        }
    }
    
   //decides which mode to go into
   void decide(int cX, int cY)
   {
     if (cX > x && cX < x+w && cY > y && cY < y+h) 
       {
         if(chosen == 5)
         {
           round = 2;
         }
         if(chosen == 6)
         {
           round = 3;
         }
         if(chosen == 7)
         {
           round = 4;
         }
         if(chosen == 8)
         {
           exit();
         }
       }
   }
   
   //Used for the future AI tic tac toe strategy
   void setDiff(int cX, int cY)
   {
       if (cX > x && cX < x+w && cY > y && cY < y+h) 
       {
           if(chosen == 9)
           {
             dif = "Easy";
             round = 1;
           }
           
           if(chosen == 10)
           {
             dif = "Medium";
             round = 1;
           }
           
           if(chosen == 11)
           {
             dif = "Hard";
             round = 1;
           }
       }
   }
   
   //Cleans the spot of choices
   void clean()
   {
      chosen = 0; 
      image(bImg, x, y, w, h);
   }
   
   //Set chosen
   void setChosen(int newChosen)
   {
    chosen = newChosen; 
   }
   
   //Display Button/Spot
   void display()
   {
     
     if(round == 2)
     {
     noStroke();
     stroke(0);
     strokeWeight(7);
     stroke(0);
     rect(x, y, w, h);
     
       if(chosen == 1)
       {
           image(xImg, x, y, w, h);
       }
       else if(chosen == 2)
       {
           image(oImg,x, y, w, h);
       }
     }
     if(round == 1)
     {
         noStroke();
         stroke(0);
         strokeWeight(7);
         stroke(0);
         rect(x, y, w, h);
              
     }
     if(round == 4)
     {
         noStroke();
         stroke(0);
         strokeWeight(7);
         stroke(0);
         rect(x, y, w, h);
     }
   }
 } 
