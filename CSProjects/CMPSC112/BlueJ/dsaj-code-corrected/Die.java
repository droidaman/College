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
/** A six-sided die for use in games. */
public class Die implements Comparable<Die> {

  /** The face of this Die that is showing. */
  private int topFace;

  /** Initialize the top face to 1. */
  public Die() {
    this.topFace = 1;
  }

  // Added in Chapter 8
  public int compareTo(Die that) {
    return topFace - that.topFace;
  }
  
  // Added in Chapter 2
  /** Return true if that Die has the same top face as this one. */
  public boolean equals(Object that) {
    if (this == that) {
      return true;
    }
    if (that == null) {
      return false;
    }
    if (getClass() != that.getClass()) {
      return false;
    }
    Die thatDie = (Die)that;
    return topFace == thatDie.topFace;
  }

  /** Return the top face of this Die. */
  public int getTopFace() {
    return this.topFace;
  }

  /**
   * Set the top face to a random integer between 1 and 6, inclusive.
   */
  public void roll() {
    this.topFace = ((int)(Math.random() * 6)) + 1;
  }

  /** Set the top face to the specified value. */
  public void setTopFace(int topFace) {
    this.topFace = topFace;
  }

  public String toString() {
    return "" + this.topFace;
  }
  
  /** Create a Die, print it, roll it, and print it again. */
  public static void main(String[] args) {
    Die d = new Die();
    System.out.println("Before rolling: " + d);
    d.roll();
    System.out.println("After rolling: " + d);
  }

}
