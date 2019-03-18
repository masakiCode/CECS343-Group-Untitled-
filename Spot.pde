class Spot
{
   int x;
   int y;
   int w;
   int h; 
   int chosen = 0;
   
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
        full -= 1;
        player = 1;
      } 
      else if (player == 1 && chosen == 0) {
        chosen = 2;
        full -= 1;
        player = 0;
      }
    } 
   }
   
   void display()
   {
     img = loadImage("Ximg.png");
     rect(x, y, w, h);
   }
   
}
