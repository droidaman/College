import java.util.*;

/**
 * A node in the state space for the Eight puzzle.
 *
 * Used in conjunction with EightAStar.java
 */
public class Puzzle implements Comparable<Puzzle>, Cloneable {
  private String board;  // a string with eight digits and a '_'
  private Puzzle parent; // current parent node of this node (can change)
  private int g, h;      // g: distance from start, h: Manhattan dist to goal
  private Random rng;    // for generating random starting states

  /**
   * Constructs a new puzzle with specified initial state.
   *
   * @param	init	the initial state
   */
  public Puzzle(String init) {
    board = init;
    parent = null;
    rng = new Random();
    g = 0;
    h = computeH(); // compute the 'Manhattan distance' to the goal
  }

  /**
   * Calculates the Manhattan distance from this node to the goal
   * state. Only for internal use; automatically invoked by
   * constructor and whenever the board is updated.
   *
   * @return	sum of horizontal and vertical distances of each
   *		numbered tile from its destination location
   */
  private int computeH() {
    int sum = 0; // will contain result to be returned

    // Find distance for each digit from '1' to '8':
    for (int i = 1; i <= 8; i++) {
      // Find current row and column of digit i:
      int iLoc = board.indexOf(""+i); // convert digit to char, then find
      int iRow = iLoc/3;
      int iCol = iLoc%3;

      // Find the "goal" row and column of digit i:
      int gRow = (i-1)/3;
      int gCol = (i-1)%3;

      // Add in the differences:
      sum += Math.abs(iRow-gRow) + Math.abs(iCol-gCol);
    }
    return sum;
  }

  /**
   * Accessor method for distance from initial state
   *
   * @return	value of the instance variable g, the distance of
   *		this state from the initial state
   */
  public int g() {
    return g;
  }

  /**
   * Accessor method for estimated distance to goal state
   *
   * @return	value of the instance variable h, the heuristic
   *		function that estimates distance to goal
   */
  public int h() {
    return h;
  }

  /**
   * Accessor method for parent
   *
   * @return	value of the instance variable parent
   */
  public Puzzle parent() {
    return parent;
  }

  /**
   * Accessor method for the current arrangement of tiles
   *
   * @return	value of the instance variable board
   */
  public String board() {
    return board;
  }

  /**
   * Mutator method for parent
   *
   * @param	other	another state in the state space that is
   *			the predecessor of this one in the search
   */
  public void setParent(Puzzle other) {
    parent = other;
  }


  /**
   * Mutator method for board; sets the tile positions, then
   * recomputes the distance to goal.
   *
   * @param	b	a new String to replace the current board
   */
  public void setBoard(String b) {
    board = b;
    h = computeH();
  }

  /**
   * Same as board(); automatically invoked by things like print and
   * println.
   *
   * @return	a String containing the current tile arrangement
   */
  public String toString() {
    return board;
  }

  /**
   * Overrides the "equals" method of the Object class so that
   * methods like "contains" will work correctly for various
   * container classes like Stack, ArrayList, PriorityQueue, etc.
   *
   * @param	o	another state to be compared to this one
   *
   * @return	true if and only if this state contains the same
   *		arrangement of digits as 'other'
   */
  public boolean equals(Object o) { // make sure parameter is Object
    Puzzle temp = (Puzzle) o;       // must cast to Puzzle
    return board.equals(temp.board);
  }

  /**
   * Permits the construction of a new state identical to
   * this one except for parent (which points to this node)
   * and g-value (which is one greater than this one).
   *
   * @return	a new Puzzle with this as its parent
   */
  public Puzzle clone() {
    Puzzle temp = new Puzzle(board);
    temp.parent = this;
    temp.g = g + 1;
    return temp;
  }

  /**
   * Returns negative if this puzzle has a smaller g+h value than
   * other, 0 if they have the same g+h value, and positive
   * if this puzzle has a larger value of g+h.
   *
   * @param	other	another Puzzle to which this is
   *			being compared
   * @return	an int value in accordance with the usual "compareTo"
   *		interpretation
   */
  public int compareTo(Puzzle other) {
    if (g+h < other.g + other.h)
      return -1;
    else if (g+h == other.g + other.h)
      return 0;
    else
      return 1;

    // Or, more succinctly:
    //    return (g+h) - (other.g + other.h);
  }

  /**
   * Prints out a 3 by 3 display of this puzzle configuration
   */
  public void display() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        int pos = row*3+col;
        System.out.print(board.charAt(pos));
      }
      System.out.println();
    }
    System.out.println();
  }

  /**
   * Used to test the class methods. THIS IS NOT THE MAIN PROGRAM
   * FOR SOLVING THE EIGHT PUZZLE--that is in file EightAStar.java
   */
  public static void main(String[] args) {
    if (args.length < 1) {
       System.out.println("Usage: java Puzzle initial");
       System.exit(1);
    }
    String init = args[0]; // get initial string
    Puzzle p1 = new Puzzle(init);
    System.out.println("p1: " + p1);
    System.out.println("h = " + p1.h() + ", g = " + p1.g() +
         ", parent = " + p1.parent());
    PriorityQueue<Puzzle> pq = new PriorityQueue<Puzzle>();
    PriorityQueue<Puzzle> pq2 = new PriorityQueue<Puzzle>();
    pq.offer(p1);

    Puzzle p2 = p1.clone();
    System.out.println("p2 is a clone of p1");
    System.out.println("p2: " + p2);
    System.out.println("h = " + p2.h() + ", g = " + p2.g() +
         ", parent = " + p2.parent());
    pq.offer(p2);

    Puzzle p3 = p1.clone();
    System.out.println("p3 is a clone of p1; changing board");
    p3.setBoard("876123_45");
    System.out.println("p3: " + p3);
    System.out.println("h = " + p3.h() + ", g = " + p3.g() +
         ", parent = " + p3.parent());
    pq.offer(p3);

    Puzzle p4 = p3.clone();
    System.out.println("p4 is a clone of p3; changing board");
    p3.setBoard("8761234_5");
    System.out.println("p4: " + p4);
    System.out.println("h = " + p4.h() + ", g = " + p4.g() +
         ", parent = " + p4.parent());
    pq.offer(p4);

    while (!pq.isEmpty()) {
      Puzzle temp = pq.remove();
      System.out.println(temp + ", parent = " + temp.parent() +
         ", g = " + temp.g() + ", h = " + temp.h() + ", f = " +
(temp.g()+temp.h()));
      pq2.offer(temp);
    }
    System.out.println("---");

    Puzzle p5 = new Puzzle(init);
    if (!pq2.remove(p5)) System.out.println("Unable to remove p5");
    p5.setBoard("87654321_");
    pq2.offer(p5);

    while (!pq2.isEmpty()) {
      Puzzle temp = pq2.poll();
      System.out.println(temp + ", parent = " + temp.parent() +
         ", g = " + temp.g() + ", h = " + temp.h() + ", f = " +
(temp.g()+temp.h()));
    }
  }
}
