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

/** The game of Galaxy. */
public class Galaxy {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);

  /** Edges linking the stars together. */
  private Graph edges;

  /** Points earned so far by each player. */
  private int[] scores;
  
  /** Number of player controlling each star, or zero for neutral. */
  private int[] stars;

  /** Build the galaxy and give one star to each player. */
  public Galaxy() {
    edges = new Graph(20);
    for (int[] pair : new int[][]
      {{0, 16}, {0, 17}, {0, 19},
       {1, 2}, {1, 8},
       {2, 4}, {2, 5}, {2, 8},
       {3, 8}, {3, 9}, {3, 16},
       {4, 5}, {4, 8},
       {5, 6}, {5, 7},
       {6, 7},
       {7, 8}, {7, 10}, {7, 11}, {7, 12}, {7, 18},
       {8, 10}, {8, 14},
       {9, 10}, {9, 13},
       {10, 12}, {10, 13},
       {11, 14},
       {11, 19},
       {12, 14}, {12, 16}, {12, 19},
       {13, 15}, {13, 16},
       {15, 16}, {15, 18},
       {16, 17},
       {18, 19}}) {
      edges.addUndirectedEdge(pair[0], pair[1]);
    }
    scores = new int[3];         // Initially all zeroes
    stars = new int[20];         // Initially all zeroes
    stars[(int)(Math.random() * 20)] = 1;
    do {
      int star = (int)(Math.random() * 20);
      if (stars[star] == 0) {
        stars[star] = 2;
        return;
      }
    } while (true);
  }

  /** Play the game. */
  public void play() {
    int player = 1;
    for (int turn = 0; turn < 18; turn++) {
      System.out.println(this);
      System.out.print("Player " + player + ", pick a star: ");
      int star = INPUT.nextInt();
      INPUT.nextLine();         // To clear out input
      stars[star] = player;
      for (int s : edges.neighbors(star)) {
        if (stars[s] == 3 - player) {
          scores[player]++;
        }
      }
      player = 3 - player;
    }
    System.out.println(this);
  }
  
  public String toString() {
    StringBuilder result = new StringBuilder();
    result.append("Star\tOwner\tNeighbors\n");
    for (int i = 0; i < 20; i++) {
      result.append(i + "\t" + stars[i] + "\t"
                    + edges.neighbors(i) + "\n");
    }
    for (int p = 1; p <= 2; p++) {
      result.append("Player " + p + ": " + scores[p] + "\n");
    }
    return result.toString();
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    Galaxy game = new Galaxy();
    System.out.println("Welcome to Galaxy.\n");
    game.play();
  }
  
}
