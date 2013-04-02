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
/** A domino. */
public class FieldDomino implements Domino {

  /** The number on the left end of the Domino. */
  private int left;

  /** The number on the right end of the Domino. */
  private int right;

  /** Initialize the left and right numbers on the Domino. */
  public FieldDomino(int left, int right) {
    this.left = left;
    this.right = right;
  }

  public void flip() {
    int swap = left;
    left = right;
    right = swap;
  }
  
  public int getLeft() {
    return left;
  }

  public int getRight() {
    return right;
  }

  public String toString() {
    return left + "-" + right;
  }

  /** Create a Domino (0-6), print it, flip it, and print it again. */
  public static void main(String[] args) {
    Domino bone = new FieldDomino(0, 6);
    System.out.println(bone.getLeft() + "-" + bone.getRight());
    bone.flip();
    System.out.println(bone.getLeft() + "-" + bone.getRight());
  }

}
