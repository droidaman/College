/**
 * Go-Moku Game
 * Revision 10 20110215
 * By:
 * Braden Licastro
 * and
 * Trent Dale
 */

package gomoku;

//Import the typical stuff.
import java.util.*;

public class GoMoku {
	
	//Create our instance variables, some protected, some not.
	public int[][] board;
	private static Scanner READER;
	private static final int PLAYER1 = 1;
	private static final int PLAYER2 = 2;
	public int player;
	public static boolean GAME_OVER = false;
	private static int TURN_NUMBER;

	/**
	 * Welcome the user, create and play the game. 
	 */
	public static void main(String[] args) {
		System.out.println("Welcome to GoMoku");
		GoMoku game = new GoMoku();
		game.play();
	}
	
	/**
	 * Constructor: Initialize our variables, initialize the array to 19x19, and fill every index with "0's".
	 */
	public GoMoku() {
		board = new int[19][19];
		for (int row = 0; row < 19; row++) {
			for (int column = 0; column < 19; column++) {
				board[row][column] = 0;
			}
		}
		TURN_NUMBER = 0;
		READER = new Scanner(System.in);
		player = PLAYER1;
	}
	
	/**
	 * Lets start playing game! Code specifics documented from within the class.
	 * @return void: doesn't return anything
	 */
	public void play() {
		//Lets keep taking turns until someone wins or it is a draw.
		while (!GAME_OVER) {
			//Every time a turn is taken we add 1 turn, then we check to see if every move has been taken.
			TURN_NUMBER++;
			//If every move has been taken, tell the users, print out the final state of the board, and die.
            if (TURN_NUMBER == (19*19)){
                System.out.println("Game Over - It's a Draw");
                System.out.print("The final board looks like:\n" + boardString());
                System.exit(1);
            }
			//Prints out a string representation of the current state of the board.
			System.out.println("\n" + boardString());
			//Whose turn is it?
			if (this.player == PLAYER1) {
				System.out.println("Player 1's turn.");
			} else {
				System.out.println("Player 2's turn.");
			}
			//Accept the users input and store it in the respective variables.
			System.out.print("Row: ");
			//Subtract 1 from the user imput here, convert input to properly access array.
			int row = READER.nextInt()-1;
			System.out.print("Column: ");
			//Subtract 1 from the user imput here, convert input to properly access array.
			int column = READER.nextInt()-1;
			System.out.println("");
			//Lets make a move at a specific coordinate,
			playAt(row, column, this.player);
			//Did that last move make the user a winner?
			checkWinner();
			//Game over? yes - goto end.
			//			 no  - swap players (change turns)
			if(GAME_OVER){
				gameOver();
			} else {
				if (this.player == PLAYER1) {
					this.player = PLAYER2;
				} else {
					this.player = PLAYER1;
				}
			}
		}
	}
	
	/**
	 * This method calls to see if the current move is valid or not,
	 * if so, it completes the move. If the move is invalid it reports the error
	 * and switches to the other user (redundant because it switches above again) keeping the current users turn.
	 * @param row The users choice of row to make the move in.
 	 * @param column The users choice of column to make the move in.
 	 * @param player Whose turn is it?
	 * @return void: doesn't return anything.
	 */
	public void playAt(int row, int column, int player) {
		if(validMove(row, column)){
			if (player == PLAYER1) {
				board[row][column] = 1;
			}
			if (player == PLAYER2) {
				board[row][column] = -1;
			}
		} else {
			System.out.println("Not a valid move.");
			if (this.player == PLAYER1) {
				this.player = PLAYER2;
			} else {
				this.player = PLAYER1;
			}
		}
	}
	
	/**
	 * Checks to see if the move is valid at the given coordinates.
	 * @param row The users choice of row to make the move in.
 	 * @param column The users choice of column to make the move in.
	 * @return Returns boolean of whether or not the move was valid.
	 */
	public boolean validMove(int row, int column) {
		if (board[row][column] == 1 || board[row][column] == -1)
		{
			return false;
		} else {
			return true;
		}
	}
	
	/**
	 * Creates a massive string representation of the board.
	 * @return Returns string representation of the current state of the board. To be printed later.
	 */
	public String boardString() {
		String display = "";
		for (int row = 0; row < 19; row++) {
			display += "\n";
			for (int column = 0; column < 19; column++) {
				if(board[row][column] == 0){
					display += " *";
				} else if (board[row][column] == 1){
					display += " 1";
				} else if (board[row][column] == -1){
					display += " 2";
				} else {
				}
			}
		}
		return display;
	}
	
	/**
	 * Checks diagonals in both directions, columns and rows.
	 * @return void: returns nothing
	 */
	public void checkWinner(){
        //Check Rows
        for (int row=0; row < 19; row++){
            for (int column=0; column < 19 - 4; column++){
                int tCheck = (board[row][column]) + (board[row][column+1]) + (board[row][column+2]) + (board[row][column+3]) + (board[row][column+4]);
                if (tCheck == -5 || tCheck == 5)
                {
                    System.out.println("\n\nWe Have A Winner!");
                    GAME_OVER = true;
                }
            }
        }


        //Check Columns
        for (int row=0; row < 19-4; row++){
            for (int column=0; column < 19; column++){
                int tCheck = (board[row][column]) + (board[row+1][column]) + (board[row+2][column]) + (board[row+3][column]) + (board[row+4][column]);
                if (tCheck == -5 || tCheck == 5)
                {
                    System.out.println("\n\nWe Have A Winner!");
                    GAME_OVER = true;
                }
            }
        }

            //Check Diagonals (NW-SE)
        for (int row=0; row < 19-4; row++){
            for (int column=0; column < 19-4; column++){
                int tCheck = (board[row][column]) + (board[row+1][column+1]) + (board[row+2][column+2]) + (board[row+3][column+3]) + (board[row+4][column+4]);
                if (tCheck == -5 || tCheck == 5)
                {
                    System.out.println("\n\nWe Have A Winner!");
                    GAME_OVER = true;
                }
            }
        }

        
            //Check Diagonals (NE-SW)
        for (int row=0; row < 19-4; row++){
            for (int column=4; column < 19; column++){
                int tCheck = (board[row][column]) + (board[row+1][column-1]) + (board[row+2][column-2]) + (board[row+3][column-3]) + (board[row+4][column-4]);
                if (tCheck == -5 || tCheck == 5)
                {
                    System.out.println("\n\nWe Have A Winner!");
                    GAME_OVER = true;
                }
            }
        }
	}
	
	/**
	 * Some bit of code above decided the game was over AND we had a winner. Congratulate, print the final board, and die.
	 * @return Returns string representation of the current state of the board. To be printed later.
	 */
    public void gameOver()
    {
        System.out.print("\nGame Over!\nPlayer " + this.player + " Won!\nHere is the final board!");
        System.out.print(boardString());
        System.exit(1);
    }
}