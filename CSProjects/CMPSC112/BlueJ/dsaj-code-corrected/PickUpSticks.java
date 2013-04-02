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


// Introduced in Chapter 15
import java.util.Scanner;

/** The game of Pick Up Sticks. */
public class PickUpSticks {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);

  /**
   * Directed acyclic graph indicating which sticks overlap which
   * others.
   */
  private Graph overlaps;

  /** The number of sticks is set here, but not any overlaps. */
  public PickUpSticks(int n) {
    overlaps = new Graph(n);
  }

  /** Ask the user which sticks overlap which others. */
  protected void determineOverlaps() {
    for (int i = 0; i < overlaps.size(); i++) {
      System.out.print("Which sticks overlap stick " + i
                       + " (separate with spaces)? ");
      Scanner line = new Scanner(INPUT.nextLine());
      while (line.hasNextInt()) {
        overlaps.addEdge(line.nextInt(), i);
      }
    }
  }

  /** Print an order in which the sticks can be picked up. */
  protected void solve() {
    System.out.println("\nThe sticks can be picked up in"
			          + " this order:");
    System.out.println(overlaps.topologicalSort());
  }

  /** Create and solve the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Pick Up Sticks.\n");
    System.out.print("How many sticks are there? ");
    PickUpSticks game = new PickUpSticks(INPUT.nextInt());
    INPUT.nextLine();           // To clear out input
    game.determineOverlaps();
    game.solve();
  }
  
}
