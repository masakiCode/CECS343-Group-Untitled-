

class Spot
{
   int x;
   int y;
   int w;
   int h; 
   int chosen = 0;
   PImage xImg = loadImage("crab.jpg");
   PImage oImg = loadImage("bHole.jpg");
   
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
        if (player == 0 && chosen == 0) {
          chosen = 1;
          player = 1;
          turns++;
          sLeft--;
        } 
        
        //O turn
        else if (player == 1 && chosen == 0) {
          chosen = 2;
          player = 0;
          turns++;
          sLeft--;       
        }
      } 
    }
   
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
   
   void setDiff(int cX, int cY)
   {
       if (cX > x && cX < x+w && cY > y && cY < y+h) 
       {
           if(chosen == 9)
           {
             round = 1;
           }
           
           if(chosen == 10)
           {
             round = 1;
           }
           
           if(chosen == 11)
           {
             round = 1;
           }
         
       }
   }
   
   void clean()
   {
      chosen = 0; 
   }
   
   void setChosen(int newChosen)
   {
    chosen = newChosen; 
   }
   
   void display()
   {
     //img = loadImage("Ximg.png");
     
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
