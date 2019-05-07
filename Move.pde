/* Name: Howard Chen, Matt McFarlane, Scott Arima, Joel Rodriguez
 * Class: CECS 343
 * Instructor: Professor Brown
 * Date: 24 April 2019
 * Purpose : The purpose of this class is to implement
 * the hard diffculty best move for ai.
 *
 */
class  Move 
{ 
  
int row, col;  // the row and colmns 
int player, ai;  // states for both players and ai.
 
Move() {
}
//method that checks if there are any moves left
boolean isMovesLeft(Spot[][] board) 
{ 
    for (int i = 0; i<3; i++) 
        for (int j = 0; j<3; j++) 
            if (board[i][j].chosen == 0) 
                return true; 
    return false; 
} 

//method evaluates the Spots for best move.
//returns a score of 10, -10, 0 
int evaluate(Spot[][] b) 
{   
    if( first >50 )
    {  
    player = 2;
    ai = 1; 
    }
  else
  {
    player = 1;
    ai = 2; 
    }

    for (int row = 0; row<3; row++) 
    { 
        if (b[row][0].chosen == b[row][1].chosen && 
            b[row][1].chosen == b[row][2].chosen) 
        { 
            if (b[row][0].chosen==player) 
                return 10; 
            else if (b[row][0].chosen == ai) 
                return -10; 
        } 
    } 
  

    for (int col = 0; col<3; col++) 
    { 
        if (b[0][col].chosen == b[1][col].chosen && 
            b[1][col].chosen == b[2][col].chosen) 
        { 
            if (b[0][col].chosen == player) 
                return 10; 
  
            else if (b[0][col].chosen == ai) 
                return -10; 
        } 
    } 
  
    if (b[0][0].chosen==b[1][1].chosen && b[1][1].chosen == b[2][2].chosen) 
    { 
        if (b[0][0].chosen == player) 
            return 10; 
        else if (b[0][0].chosen == ai) 
            return -10; 
    } 
  
    if (b[0][2].chosen ==b[1][1].chosen && b[1][1].chosen == b[2][0].chosen) 
    { 
        if (b[0][2].chosen == player) 
            return 10; 
        else if (b[0][2].chosen == ai) 
            return -10; 
    } 

    return 0; 
} 

//minimax algorithm used in turn based games 
//to recursively find the best move.
int minimax(Spot board[][], int depth, boolean isMax) 
{ 
    int score = evaluate(board);
    
    //won
    if (score == 10) 
        return score;
        
    //lost
    if (score == -10) 
        return score;
        
    //tie
    if (isMovesLeft(board)== false) 
        return 0; 
    
    if (isMax) //checks which move is best
    { 
        int best = -1000;  // intializes best score
         
         //iterates through board matrix
        for (int i = 0; i<3; i++) 
        { 
            for (int j = 0; j<3; j++) 
            { 

                if (board[i][j].chosen == 0) 
                { 

                    board[i][j].chosen = player; // pick spot for player

                    best = max( best, 
                        minimax(board, depth+1, !isMax) );  // recursive call 

                    board[i][j].chosen = 0;  //undo player moves 
                } 
            } 
        } 
        return best;  // returns best possible score.
    } 
  
    else
    { 
        int best = 1000; //intialize score
        //iterates through board matrix
        for (int i = 0; i<3; i++) 
        { 
            for (int j = 0; j<3; j++) 
            { 
                if (board[i][j].chosen == 0) 
                { 
                    board[i][j].chosen = ai; // pick spot for ai
                    
                    best = min(best,  // recursive call 
                           minimax(board, depth+1, !isMax)); 

                    board[i][j].chosen = 0; //undo ai moves 
                } 
            } 
        } 
        return best; //returns best score for ai
    } 
} 
//methd that finds the Best move
// returns the Move object with row and col of best move.

Move findBestMove(Spot board[][])
{ 
    int bestV = -1000; 
    Move bestM = new Move(); 
    bestM.row = -1; 
    bestM.col = -1; 
  

    for (int i = 0; i<3; i++) 
    { 
        for (int j = 0; j<3; j++) 
        { 

            if (board[i][j].chosen==0) 
            { 

                board[i][j].chosen = player; 

                int moveV = minimax(board, 0, false); 
  
                board[i][j].chosen = 0; 
  
                if (moveV > bestV) 
                { 
                    bestM.row = i; 
                    bestM.col = j; 
                    bestV = moveV; 
                } 
            } 
        } 
    } 
  
    return bestM; 
} 
}
