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
public interface Domino {

  /** Swap the left and right numbers on the Domino. */
  public void flip();

  /** Return the number on the left side of the Domino. */
  public int getLeft();

  /** Return the number on the right side of the Domino. */
  public int getRight();

}
