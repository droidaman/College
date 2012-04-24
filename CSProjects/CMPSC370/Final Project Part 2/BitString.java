import java.util.*;

/**
 * A class usable by the SimpleGA program. Elements are strings of
 * 0s and 1s, plus a fitness that can be changed according to
 * the desired application. This is useful only for problems whose
 * solutions can be expressed as arrays of bits; however, there is still
 * a lot of flexibility; several "calcFitness" function are provided
 * below as examples of different problem types.
 *
 * For simplicity, this class does not have many of the "safety
 * checks" that a good, industrial strength chromosome class
 * should have. For example, there is no check to make sure that
 * all bit strings in the class have the same value of "n" and there
 * is no attempt to verify that the elements of the String parameter
 * 's' in the second constructor really are just 0s and 1s.
 *
 * The crossover and mutation operators probably should have been put here
 * rather than in class "SimpleGA", but were left there to keep all
 * the major genetic algorithm operators in one file.
 *
 * @author	Bob Roos
 * @version	5 April 2012
 */
public class BitString implements Comparable<BitString> {
  private static Random rng; // random number generator
  private String item;       // a string of 0s and 1s
  private double fitness;    // the fitness of the string
  private int n;             // the length of the string

  /**
   *  When the class is first loaded, initialize the random number generator:
   */
  static {
    rng = new Random();
  }

  /**********************************
   * CONSTRUCTORS
   **********************************/
  /**
   * Constructs a BitString of length n containing all zeros
   *
   * @param	n	length of the bit string
   */
  public BitString(int n) {
    item = "";
    for (int i = 0; i < n; i++) item += '0';
    this.n = n;
    fitness = calcFitness();
  }

  /**
   * Constructs a BitString with a given string value.
   *
   * @param	s	a string of 0s and 1s
   */
  public BitString(String s) {
    item = s;
    n = s.length();
    fitness = calcFitness();
  }

  /********************************
   * ACCESS METHODS:
   ********************************/

  /**
   * Returns the fitness of this bit string
   *
   * @return	this bit string's fitness
   */
  public double fitness() {
    return fitness;
  }

  /**
   * Returns the String component of this BitString object
   *
   * @return	the value of the String 'item'
   */
  public String item() {
    return item;
  }

  /***********************************
   * MUTATOR METHODS
   ***********************************/

  /**
   * Randomly fills this BitString, replacing anything that's there:
   */
  public void randomFill() {
    item = "";
    for (int i = 0; i < n; i++) {
      item += "01".charAt(rng.nextInt(2));
    }
    fitness = calcFitness();
  }

  /************************************
   * UTILITY METHODS
   ***********************************/
      
  /**
   * We must define the "compareTo" method if we want to be able to
   * use the "Arrays.sort" method on populations of BitString.
   *
   * NOTE: This class implements the "Comparable<BitString>" interface.
   *
   * @param	other	the BitString to which we are comparing this one
   *
   * @return	negative if this fitness < other fitness, positive
   *		if this fitness > other fitness, 0 otherwise.
   */
  public int compareTo(BitString other) {
    return (int)(fitness - other.fitness());
  }

  /***************************************
   * FITNESS METHODS. EXACTLY ONE "calcFitness" METHOD
   * SHOULD BE ACCESSIBLE; THE REMAINING ONES MUST BE
   * COMMENTED OUT.
   **************************************/

  /**
   * Sample calcFitness:
   *   For each block of 4 bits (or final partial block if n is not
   *   a multiple of 4), if the first bit in the block is '1'
   *   then the fitness is increased by the number of zeros in the
   *   remaining bits of the block or partial block; otherwise the
   *   fitness is reduced by 1 regardless of the remaining bits.
   * Examples:
   *        10001001101000001 (= 1000 1001 1010 0000 1)
   *   has fitness 3+2+2-1+0 = 6
   *        00000000000000 (= 0000 0000 0000 00)
   *   has fitness -1-1-1-1 = -4
   *
   * @return	the fitness of this bit string
   */
/*
  private double calcFitness() {
    double sum = 0; // result
    int i = 0;
    while (i < n) {
      if (item.charAt(i) =='1') { // is first bit in block a 1?
        for (int j = 1; j <= 3 && i+j < n; j++) // look at rest of block
          if (item.charAt(i+j) == '0') // each zero adds 1 to the sum
            sum += 1;
      }
      else // this block began with a 0, so the block contributes -1 to sum
        sum -= 1;
      i += 4; // advance to the next block of bits
    }

    return sum;
  }
*/

  /**
   * Sample calcFitness:
   * Solves a knapsack problem with 10 objects
   *
   * @return	the fitness of this bit string
   */
/*
  private double calcFitness() {
    double w[] = {3,9,2,11,18,20,15,4,21,10};   // weights
    double v[] = {40,20,10,15,18,21,15,5,8,13}; // values
    double cap = 55; // capacity

    double wt = 0; // accumulated weight of objects in knapsack
    double val = 0; // accumulated value of objects in knapsack

    for (int i = 0; i < 10; i++) { 
      double m = 0; // multiplier (0 means object not present)
      if (item.charAt(i) == '1') m = 1;
      wt = wt + m*w[i];
      if (wt > cap) // this item exceeds knapsack capacity
         return 0;
      val = val + m*v[i];
    }
    return val; // total value of items in knapsack
  }
*/

  /**
   * Sample calcFitness:
   *   Treats the string like an n-bit binary integer,
   *   scales it to a value x between -1 and +1. Fitness is
   *   the value of the function 3*sin(cos(x))-x+1. (So
   *   the GA tries to maximize this.) For reference: the
   *   maximum value is 3.8090546568502752 and it occurs at
   *   x = -0.5360518212837633
   *  
   *   NOTE: The value of n for this should be no bigger than 63
   *   (the number of bits in a positive long integer value).
   *
   * @return	the fitness of this bit string
   */
/*
  private double calcFitness() {
    long sum = 0; // the binary value of the bit string (sum of powers of 2)
    for (int i = 0; i < n; i++) {
      int bit = 0;
      if (item.charAt(i) == '1') bit = 1;
      sum = 2*sum+bit;
    }

    // Now scale this integer value down to a double between -1 and +1:
    double x = sum/Math.pow(2.0,n)*2-1;

    // Finally, plug the value of x into the function to be maximized:
    return  3*Math.sin(Math.cos(x))-x+1;
  } 
*/

  /**
   * Sample calcFitness: The "8 queens" problem. 
   *
   *   n must be a square: n = k*k. (64 is a typical value)
   *   This bitstring represents an arrangement of chess queens
   *   on a k by k chessboard (1 = queen, 0 = empty square). Fitness 
   *   is decreased by 1 for each pair of queens that are on the same 
   *   row, column, or diagonal line. Perfect fitness is 0.
   *
   * @return	the fitness of this bit string
   */

  private double calcFitness() {
    int k = (int)(Math.sqrt(n)+.5); // We are assuming n = k*k
    int[][] board = new int[k][k];
    for (int i = 0; i < k; i++) {
      Arrays.fill(board[i],0);
    }

    int count = 0;
    int qcount = 0;

    for (int i = 0; i < n; i++) {

      if (item.charAt(i) == '0') continue;
      qcount++;

      int row = i/k; 
      int col = i%k;
      // check row, col:
      for (int j = 0; j < k; j++) {
        if (board[row][j] > 0) count++; // two queens in same row 
        if (board[j][col] > 0) count++; // two queens in same row
      }
      // check diagonal 1:
      int r = row; 
      int c = col;
      while (r < k && c < k) {
         if (board[r][c] > 0) count++;
         r++;
         c++;
      }
      r = row-1;
      c = col-1;
      while (r >= 0 && c >= 0) {
         if (board[r][c] > 0) count++;
         r--;
         c--;
      }

      // check diagonal 2:
      r = row; 
      c = col;
      while (r >= 0 && c < k) {
         if (board[r][c] > 0) count++;
         r--;
         c++;
      }
      r = row+1;
      c = col-1;
      while (r < k && c >= 0) {
         if (board[r][c] > 0) count++;
         r++;
         c--;
      }
      board[row][col] = 1;
    }
    return -2*count + qcount;
  }


  /**
   * Binary string whose integer rep is a palindrome with all digits
   * represented at least once. (Example done in class on 9 April 2012)
   *
   * Fitness is number of palindrome matches plus number of distinct
   * digits used, negated. Optimal solution has fitness 29 (I think).
   *
   * You must specify a bit string length of 63 for this problem.
   */
  /*
  public double calcFitness() {
    long result = 0;
    for (int i = 0; i < item.length(); i++) {
      char c = item.charAt(i);
      result = 2*result + c-'0';
    }
    String s = ""+result;
    int count[] = new int[10];
    Arrays.fill(count,0);
    int fitness = 0;
    for (int i = 0; i < s.length(); i++) {
      char c = s.charAt(i);
      if (count[c-'0'] == 0) {
        count[c-'0']++;
        fitness++;
      }
      if (c == s.charAt(s.length()-i-1))
        fitness++;
    }
    return fitness;
  }*/
}
