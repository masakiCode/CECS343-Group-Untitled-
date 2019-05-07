/* Name: Howard Chen, Matt McFarlane, Scott Arima, Joel Rodriguez
 * Class: CECS 343
 * Instructor: Professor Brown
 * Date: 24 April 2019
 * Purpose : The purpose of this class is to implement
 * the Hover Hint feature to the new protoype.
 *
 */

class Hover

{
  Hover(){}
  /* Function that checks for possible hint to display.
   * returns the integer value of the spot a hint should be displayed.
  */
  int hover() 
  {
    int cVar = 2; 
    if (pTurn) {  // player's turn
      //iterates through entire board   
      for (int i = 0; i < 3; i++)
      {
        for (int j = 0; j < 3; j++)
        {
          if ( board[i][j].chosen == 0) {
            //check("mouse is in empty square");
            if (mouseX >= board[i][j].x && mouseX <= (board[i][j].x + 640) 
              && mouseY >= board[i][j].y && mouseY <= (board[i][j].y + 360)) {
              
                if (first>50) { //comp is X cVar is 2 first
                  while(cVar > 0)
                  {
                    //checks vertical two spots in a row
                    if (board[0][0].chosen == cVar && board[1][0].chosen == cVar && board[2][0].chosen == 0) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
                    if (board[0][2].chosen == cVar && board[2][2].chosen == cVar && board[1][2].chosen == 0) {
                      print("hint:");
                      println("spot 3");
                      return 3;
                    } 
                    if (board[1][0].chosen == cVar && board[2][0].chosen == cVar && board[0][0].chosen == 0) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[0][1].chosen == cVar && board[1][1].chosen == cVar && board[2][1].chosen == 0) {
                      print("hint:");
                      println("spot 7");
                      return 7;
                    }
                    if (board[0][1].chosen == cVar && board[2][1].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
                    if (board[1][1].chosen == cVar && board[2][1].chosen == cVar && board[0][1].chosen == 0) {
                      print("hint:");
                      println("spot 1");
                      return 1;
                    }
                    if (board[1][2].chosen == cVar && board[0][2].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      return 8;
                    }
                    if (board[1][2].chosen == cVar && board[2][2].chosen == cVar && board[0][2].chosen == 0) {
                      print("hint:");
                      println("spot 2");
                      return 2;
                    }
                    if (board[0][0].chosen == cVar && board[2][0].chosen == cVar && board[1][0].chosen == 0) {
                      print("hint:");
                      println("spot 5");
                      return 5;
                    }
  
                    //checks for "O" horizontal  two spots in a row
                    if (board[0][0].chosen == cVar && board[0][1].chosen == cVar && board[0][2].chosen == 0) {
                      print("hint:");
                      println("spot 2");
                
                      return 2;
                    }
                    if (board[0][0].chosen == cVar && board[0][2].chosen == cVar && board[0][1].chosen == 0) {
                      print("hint:");
                      println("spot 1");
                      return 1;
                    } 
                    if (board[0][1].chosen == cVar && board[0][2].chosen == cVar && board[0][0].chosen == 0) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[1][0].chosen == cVar && board[1][1].chosen == cVar && board[1][2].chosen == 0) {
                      print("hint:");
                      println("spot 3");
                      return 3;
                    }
                    if (board[1][0].chosen == cVar && board[1][2].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
                    if (board[1][1].chosen == cVar && board[1][2].chosen == cVar && board[1][0].chosen == 0) {
                      print("hint:");
                      println("spot 5");
                      return 5;
                    }
                    if (board[2][0].chosen == cVar && board[2][1].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      return 8;
                    }
                    if (board[2][0].chosen == cVar && board[2][2].chosen == cVar && board[2][1].chosen == 0) {
                      print("hint:");
                      println("spot 7");
                      return 7;
                    }
                    if (board[2][1].chosen == cVar && board[2][2].chosen == cVar && board[2][0].chosen == 0) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
      
      
                    //diagonal for two spots in a row
                    if (board[0][0].chosen == cVar && board[1][1].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      image(hImg, board[0][2].x, board[0][2].y, 100, 100);
                      return 8;
                    }
                    if (board[0][0].chosen == cVar && board[2][2].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    } 
                    if (board[1][1].chosen == cVar && board[2][2].chosen == cVar && board[0][0].chosen == 0 ) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[2][0].chosen == cVar && board[1][1].chosen == cVar && board[0][2].chosen == 0 ) {
                      print("hint:");
                      println("spot 2");
                      return 2;
                    }
                    if (board[2][0].chosen == cVar && board[0][2].chosen == cVar && board[1][1].chosen == 0 ) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
      
                    if (board[1][1].chosen == cVar && board[0][2].chosen == cVar && board[2][0].chosen == 0 ) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
                    cVar--;
                }
              } else { // check 1 first
  
                cVar = 1;
                while(cVar < 3)
                  {
                    //check vertical for two spots in a row
                    if (board[0][0].chosen == cVar && board[1][0].chosen == cVar && board[2][0].chosen == 0) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
                    if (board[0][2].chosen == cVar && board[2][2].chosen == cVar && board[1][2].chosen == 0) {
                      print("hint:");
                      println("spot 3");
                      return 3;
                    } 
                    if (board[1][0].chosen == cVar && board[2][0].chosen == cVar && board[0][0].chosen == 0) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[0][1].chosen == cVar && board[1][1].chosen == cVar && board[2][1].chosen == 0) {
                      print("hint:");
                      println("spot 7");
                      return 7;
                    }
                    if (board[0][1].chosen == cVar && board[2][1].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
                    if (board[1][1].chosen == cVar && board[2][1].chosen == cVar && board[0][1].chosen == 0) {
                      print("hint:");
                      println("spot 1");
                      return 1;
                    }
                    if (board[1][2].chosen == cVar && board[0][2].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      return 8;
                    }
                    if (board[1][2].chosen == cVar && board[2][2].chosen == cVar && board[0][2].chosen == 0) {
                      println("spot 2");
                      return 2;
                    }
                    if (board[0][0].chosen == cVar && board[2][0].chosen == cVar && board[1][0].chosen == 0) {
                      print("hint:");
                      println("spot 5");
                      return 5;
                    }
  
                    //checks  horizontal for two spots in a row
                    if (board[0][0].chosen == cVar && board[0][1].chosen == cVar && board[0][2].chosen == 0) {
                      print("hint:");
                      println("spot 2");
                
                      return 2;
                    }
                    if (board[0][0].chosen == cVar && board[0][2].chosen == cVar && board[0][1].chosen == 0) {
                      print("hint:");
                      println("spot 1");
                      return 1;
                    } 
                    if (board[0][1].chosen == cVar && board[0][2].chosen == cVar && board[0][0].chosen == 0) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[1][0].chosen == cVar && board[1][1].chosen == cVar && board[1][2].chosen == 0) {
                      print("hint:");
                      println("spot 3");
                      return 3;
                    }
                    if (board[1][0].chosen == cVar && board[1][2].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
                    if (board[1][1].chosen == cVar && board[1][2].chosen == cVar && board[1][0].chosen == 0) {
                      print("hint:");
                      println("spot 5");
                      return 5;
                    }
                    if (board[2][0].chosen == cVar && board[2][1].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      return 8;
                    }
                    if (board[2][0].chosen == cVar && board[2][2].chosen == cVar && board[2][1].chosen == 0) {
                      print("hint:");
                      println("spot 7");
                      return 7;
                    }
                    if (board[2][1].chosen == cVar && board[2][2].chosen == cVar && board[2][0].chosen == 0) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
      
      
                    //checks for diagonal  for two spots in a row
                    if (board[0][0].chosen == cVar && board[1][1].chosen == cVar && board[2][2].chosen == 0) {
                      print("hint:");
                      println("spot 8");
                      image(hImg, board[0][2].x, board[0][2].y, 100, 100);
                      return 8;
                    }
                    if (board[0][0].chosen == cVar && board[2][2].chosen == cVar && board[1][1].chosen == 0) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    } 
                    if (board[1][1].chosen == cVar && board[2][2].chosen == cVar && board[0][0].chosen == 0 ) {
                      print("hint:");
                      println("spot 0");
                      return 0;
                    }
                    if (board[2][0].chosen == cVar && board[1][1].chosen == cVar && board[0][2].chosen == 0 ) {
                      print("hint:");
                      println("spot 2");
                      return 2;
                    }
                    if (board[2][0].chosen == cVar && board[0][2].chosen == cVar && board[1][1].chosen == 0 ) {
                      print("hint:");
                      println("spot 4");
                      return 4;
                    }
      
                    if (board[1][1].chosen == cVar && board[0][2].chosen == cVar && board[2][0].chosen == 0 ) {
                      print("hint:");
                      println("spot 6");
                      return 6;
                    }
                    cVar++;
                }
              }
            }
          }
        }
      }
    }
      return -1;
    }  
}
