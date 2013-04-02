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


// Introduced in Chapter 6
/** A linked Stack. */
public class LinkedStack<E> implements Stack<E> {

  /** The top ListNode in the Stack. */
  private ListNode<E> top;

  /** The Stack is initially empty. */
  public LinkedStack() {
    top = null;
  }
  
  public boolean isEmpty() {
    return top == null;
  }

  public E peek() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    return top.getItem();
  }

  public E pop() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    E result = top.getItem();
    top = top.getNext();
    return result;
  }

  public void push(E target) {
    top = new ListNode<E>(target, top);
  }

}
