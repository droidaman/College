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
public class ArrayDomino implements Domino {

  /** The numbers on the Domino. */
  int[] numbers;

  /** Index of the left number.  The other one is the right number. */
  int leftIndex;

  /** Initialize the left and right numbers on the Domino. */
  public ArrayDomino(int left, int right) {
    numbers = new int[] {left, right};
    leftIndex = 0;
  }

  public void flip() {
    leftIndex = 1 - leftIndex;
  }

  public int getLeft() {
    return numbers[leftIndex];
  }

  public int getRight() {
    return numbers[1 - leftIndex];
  }

  public String toString() {
    return numbers[leftIndex] + "-" + numbers[1 - leftIndex];
  }

  /** Create a Domino (0-6), print it, flip it, and print it again. */
  public static void main(String[] args) {
    Domino bone = new ArrayDomino(0, 6);
    System.out.println(bone.getLeft() + "-" + bone.getRight());
    bone.flip();
    System.out.println(bone.getLeft() + "-" + bone.getRight());
  }

}
