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


// Introduced in Chapter 11
/**
 * Something which has children, such as a BinarySearchTree or a
 * BinaryNode.
 */
public interface Parent<E> {

  /**
   * Return the left child if direction < 0, or the right child
   * otherwise.
   */
  public BinaryNode<E> getChild(int direction);

  /**
   * Replace the specified child of this parent with the new child.
   * If direction < 0, replace the left child.  Otherwise, replace
   * the right child.
   */
  public void setChild(int direction, BinaryNode<E> child);
  
}
