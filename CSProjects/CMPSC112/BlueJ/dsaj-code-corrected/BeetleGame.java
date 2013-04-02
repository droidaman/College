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


// Introduced in Chapter 1
/** The game of Beetle for two players. */
public class BeetleGame {

  /** For reading from the console. */
  public static final java.util.Scanner INPUT
    = new java.util.Scanner(System.in);

  /** Player 1's Beetle. */
  private Beetle bug1;

  /** Player 2's Beetle. */
  private Beetle bug2;

  /** A die. */
  private Die die;

  /** Create the Die and Beetles. */
  public BeetleGame() {
    bug1 = new Beetle();
    bug2 = new Beetle();
    die = new Die();
  }

  /** Play until someone wins. */
  public void play() {
    int player = 1;
    Beetle bug = bug1;
    while (!(bug.isComplete())) {
      if (!(takeTurn(player, bug))) {
        if (player == 1) {
          player = 2;
          bug = bug2;
        } else {
          player = 1;
          bug = bug1;
        }
      }
    }
    System.out.println("\nPlayer " + player + " wins!");
    System.out.println(bug);
  }

  /**
   * Take a turn for the current player.  Return true if the player
   * earned a bonus turn.
   */
  public boolean takeTurn(int player, Beetle bug) {
    System.out.println("\nPlayer " + player + ", your beetle:");
    System.out.println(bug);
    System.out.print("Hit return to roll: ");
    INPUT.nextLine();
    die.roll();
    System.out.print("You rolled a " + die.getTopFace());
    switch (die.getTopFace()) {
      case 1:
        System.out.println(" (body)");
        return bug.addBody();
      case 2:
        System.out.println(" (head)");
        return bug.addHead();
      case 3:
        System.out.println(" (leg)");
        return bug.addLeg();
      case 4:
        System.out.println(" (eye)");
        return bug.addEye();
      case 5:
        System.out.println(" (feeler)");
        return bug.addFeeler();
      default:
        System.out.println(" (tail)");
        return bug.addTail();
    }
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Beetle.");
    BeetleGame game = new BeetleGame();
    game.play();
  }
  
}
