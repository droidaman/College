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


// Introduced in Chapter 3
/** The game of Cram. */
public class Cram extends Domineering {

  /** No special initialization is required. */
  public Cram() {
    super();
  }
  
  /** Play until someone wins. */
  public void play() {
    int player = 1;
    while (true) {
      System.out.println("\n" + this);
      System.out.println("Player " + player + " to play");
      if (!(hasLegalMoveFor(HORIZONTAL)
            || hasLegalMoveFor(VERTICAL))) {
        System.out.println("No legal moves -- you lose!");
        return;
      }
      System.out.print("Row: ");
      int row = INPUT.nextInt();
      System.out.print("Column: ");
      int column = INPUT.nextInt();
      INPUT.nextLine();         // To clear out input
      System.out.print("Play horizontally (y/n)? ");
      boolean direction;
      if (INPUT.nextLine().charAt(0) == 'y') {
        direction = HORIZONTAL;
      } else {
        direction = VERTICAL;
      }
      playAt(row, column, direction);
      player = 3 - player;
    }
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Cram.");
    Cram game = new Cram();
    game.play();
  }

}
