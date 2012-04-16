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


// Introduced in Chapter 4
/** A last-in, first-out stack. */
public interface Stack<E> {

  /** Return true if this Stack is empty. */
  public boolean isEmpty();

  /**
   * Return the top item on this Stack, but do not modify the Stack.
   * @throws EmptyStructureException if this Stack is empty.
   */
  public E peek();

  /**
   * Remove and return the top item on this Stack.
   * @throws EmptyStructureException if this Stack is empty.
   */
  public E pop();

  /** Add targer to the top of this Stack. */
  public void push(E target);

}
