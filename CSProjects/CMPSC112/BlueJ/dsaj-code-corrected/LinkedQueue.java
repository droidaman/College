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
/** A linked Queue. */
public class LinkedQueue<E> implements Queue<E> {

  /** The front ListNode in the Queue. */
  private ListNode<E> front;

  /** The back ListNode in the Queue. */
  private ListNode<E> back;

  /** The Queue is initially empty. */
  public LinkedQueue() {
    front = null;
    back = null;
  }

  public void add(E target) {
    ListNode<E> node = new ListNode<E>(target);
    if (isEmpty()) {
      front = node;
      back = node;
    } else {
      back.setNext(node);
      back = node;
    }
  }
  
  public boolean isEmpty() {
    return front == null;
  }

  public E remove() {
    if (isEmpty()) {
      throw new EmptyStructureException();
    }
    E result = front.getItem();
    front = front.getNext();
    return result;
  }
  
}
