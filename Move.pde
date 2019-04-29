    
class  Move 
{ 
  
int row, col; 
int player, ai; 
 
Move() {
}
boolean isMovesLeft(Spot[][] board) 
{ 
    for (int i = 0; i<3; i++) 
        for (int j = 0; j<3; j++) 
            if (board[i][j].chosen == 0) 
                return true; 
    return false; 
} 
  
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
   
int minimax(Spot board[][], int depth, boolean isMax) 
{ 
    int score = evaluate(board); 
    
    if (score == 10) 
        return score; 

    if (score == -10) 
        return score; 

    if (isMovesLeft(board)== false) 
        return 0; 

    if (isMax) 
    { 
        int best = -1000; 
  
        for (int i = 0; i<3; i++) 
        { 
            for (int j = 0; j<3; j++) 
            { 

                if (board[i][j].chosen == 0) 
                { 

                    board[i][j].chosen = player; 
  

                    best = max( best, 
                        minimax(board, depth+1, !isMax) ); 

                    board[i][j].chosen = 0; 
                } 
            } 
        } 
        return best; 
    } 
  
    else
    { 
        int best = 1000; 
  
        for (int i = 0; i<3; i++) 
        { 
            for (int j = 0; j<3; j++) 
            { 
                if (board[i][j].chosen == 0) 
                { 
                    board[i][j].chosen = ai; 

                    best = min(best, 
                           minimax(board, depth+1, !isMax)); 

                    board[i][j].chosen = 0; 
                } 
            } 
        } 
        return best; 
    } 
} 
  
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
