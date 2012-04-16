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


// Introduced in Chapter 2
/** The game of Domineering. */
public class Domineering {

  /** For reading from the console. */
  public static final java.util.Scanner INPUT
    = new java.util.Scanner(System.in);

  /** The player who plays their dominoes horizontally. */
  public static final boolean HORIZONTAL = false;

  /** The player who plays their dominoes vertically. */
  public static final boolean VERTICAL = true;
  
  /** Array of board squares, true if occupied. */
  private boolean[][] squares;

  /** The board is initially empty. */
  public Domineering() {
    squares = new boolean[8][8];
    // Java initializes all array elements to false
  }

  /**
   * Return true if there is a legal move for the specified player.
   */
  public boolean hasLegalMoveFor(boolean player) {
    int rowOffset = 0;
    int columnOffset = 0;
    if (player == HORIZONTAL) {
      columnOffset = 1;
    } else {
      rowOffset = 1;
    }
    for (int row = 0; row < (8 - rowOffset); row++) {
      for (int column = 0; column < (8 - columnOffset); column++) {
        if (!(squares[row][column]
              || squares[row + rowOffset][column + columnOffset])) {
          return true;
        }
      }
    }
    return false;
  }
  
  /** Play until someone wins. */
  public void play() {
    boolean player = HORIZONTAL;
    while (true) {
      System.out.println("\n" + this);
      if (player == HORIZONTAL) {
        System.out.println("Horizontal to play");
      } else {
        System.out.println("Vertical to play");
      }
      if (!(hasLegalMoveFor(player))) {
        System.out.println("No legal moves -- you lose!");
        return;
      }
      System.out.print("Row: ");
      int row = INPUT.nextInt();
      System.out.print("Column: ");
      int column = INPUT.nextInt();
      playAt(row, column, player);
      player = !player;
    }
  }

  /**
   * Play a domino with its upper left corner at row, column.
   */
  public void playAt(int row, int column, boolean player) {
    squares[row][column] = true;
    if (player == HORIZONTAL) {
      squares[row][column + 1] = true;
    } else {
      squares[row + 1][column] = true;
    }
  }

  public String toString() {
    String result = "  0 1 2 3 4 5 6 7";
    for (int row = 0; row < 8; row++) {
      result += "\n" + row;
      for (int column = 0; column < 8; column++) {
        if (squares[row][column]) {
          result += " #";
        } else {
          result += " .";
        }
      }
    }
    return result;
  }
  
  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Domineering.");
    Domineering game = new Domineering();
    game.play();
  }

}
