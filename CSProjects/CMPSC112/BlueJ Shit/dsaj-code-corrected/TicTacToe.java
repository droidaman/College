// Disclaimer: The program code is made available under the
// following copyright notice: Copyright 2006, by Pearson
// Education, Inc. by Drake; all rights reserved. Permission
// is granted for use in non-commercial applications provided
// this copyright notice remains intact and unchanged. The
// author and publisher make no warranty of any kind, expressed
// or implied, with regard to these programs. The author and
// publisher shall not be liable in any event for incidental or
// consequential damages in connection with, or arising out of
// the furnishing, performance of use of this program code.


// Introduced in Chapter 10
import java.util.Scanner;

/** The game of Tic Tac Toe. */
public class TicTacToe {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);

  /** Squares on the board, each of which is '.', 'X', or 'O'. */
  private char[][] squares;

  /** The board is initially empty. */
  public TicTacToe() {
    squares = new char[][] {{'.', '.', '.'},
                            {'.', '.', '.'},
                            {'.', '.', '.'}};
  }

  /** Return true if the game is over. */
  public boolean gameOver() {
    if (score() != 0) {
      return true;
    }
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        if (squares[row][column] == '.') {
          return false;
        }
      }
    }
    return true;
  }

  /** Return the value of the current position if it is O's turn. */
  protected int minimaxForO() {
    int score = score();
    if (gameOver()) {
      return score;
    }
    int bestScore = 2;
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        if (squares[row][column] == '.') {
          squares[row][column] = 'O';
          score = minimaxForX();
          if (score < bestScore) {
            bestScore = score;
          }
          squares[row][column] = '.';
        }
      }
    }
    return bestScore;
  }

  /** Return the value of the current position if it is X's turn. */
  protected int minimaxForX() {
    int score = score();
    if (gameOver()) {
      return score;
    }
    int bestScore = -2;
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        if (squares[row][column] == '.') {
          squares[row][column] = 'X';
          score = minimaxForO();
          if (score > bestScore) {
            bestScore = score;
          }
          squares[row][column] = '.';
        }
      }
    }
    return bestScore;
  }

  /** Play one game. */
  public void play() {
    char player = 'X';
    for (int move = 0; move < 9; move++) {
      if (gameOver()) {
        return;
      }
      if (player == 'X') {
        playBestMove();
        player = 'O';
      } else {
        System.out.println(this);
        System.out.print("Enter row: ");
        int row = INPUT.nextInt();
        System.out.print("Enter column: ");
        int column = INPUT.nextInt();
        squares[row][column] = 'O';
        player = 'X';
      }
    }
  }

  /** Find the best move for X and play it on the board. */
  protected void playBestMove() {
    int score;
    int bestScore = -2;
    int bestRow = -1;
    int bestColumn = -1;
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        if (squares[row][column] == '.') {
          squares[row][column] = 'X';
          score = minimaxForO();
          if (score > bestScore) {
            bestScore = score;
            bestRow = row;
            bestColumn = column;
          }
          squares[row][column] = '.';
        }
      }
    }
    squares[bestRow][bestColumn] = 'X';
  }

  /** Return 1 if X has won, -1 if O has won, and 0 otherwise. */
  public int score() {
    int lineScore;
    for (int i = 0; i < 3; i++) {
      lineScore = scoreLine(squares[i][0],
			               squares[i][1],
			               squares[i][2]);
      if (lineScore != 0) {
        return lineScore;
      }
      lineScore = scoreLine(squares[0][i],
			               squares[1][i],
			               squares[2][i]);
      if (lineScore != 0) {
        return lineScore;
      }
    }
    lineScore = scoreLine(squares[0][0],
			             squares[1][1],
			             squares[2][2]);
    if (lineScore != 0) {
      return lineScore;
    }
    return scoreLine(squares[0][2], squares[1][1], squares[2][0]);
  }

  /**
   * Return 1 if all three characters are 'X', -1 if they are all 'O',
   * and 0 otherwise.
   */
  protected int scoreLine(char a, char b, char c) {
    if ((a == 'X') && (b == 'X') && (c == 'X')) { return 1; }
    if ((a == 'O') && (b == 'O') && (c == 'O')) { return -1; }
    return 0;
  }

  public String toString() {
    String result = "";
    for (int row = 0; row < 3; row++) {
      for (int column = 0; column < 3; column++) {
        result += squares[row][column];
      }
      result += "\n";
    }
    return result;
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    TicTacToe game = new TicTacToe();
    System.out.println("Welcome to Tic Tac Toe.\n");
    game.play();
    System.out.println(game);
    System.out.println("Game over.");
  }
  
}
