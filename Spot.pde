

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
     if (cX > x && cX < x+w && cY > y && cY < y+h) {

      if (player == 0 && chosen == 0) {
        chosen = 1;
        player = 1;
        sLeft--;
      } 
      else if (player == 1 && chosen == 0) {
        chosen = 2;
        player = 0;
        sLeft--;       
      }
    } 
   }
   
   void clean()
   {
      chosen = 0; 
   }
   
   
   
   void display()
   {
     //img = loadImage("Ximg.png");
     
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
   
   
   
}
