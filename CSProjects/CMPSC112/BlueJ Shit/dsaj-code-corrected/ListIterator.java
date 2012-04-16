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
/** Iterator used by the LinkedList class. */
public class ListIterator<E> implements java.util.Iterator<E> {

  /** The Predecessor of node. */
  private Predecessor<E> prev;
  
  /**
   * The ListNode containing the last element returned, or the
   * LinkedList itself if no elements have yet been returned.
   */
  private Predecessor<E> node;

  /** The ListIterator starts at the beginning of the List. */
  public ListIterator(LinkedList<E> list) {
    prev = null;
    node = list;
  }

  public boolean hasNext() {
    return node.getNext() != null;
  }

  public E next() {
    prev = node;
    node = node.getNext();
    return ((ListNode<E>)node).getItem();
  }

  public void remove() {
    prev.setNext(node.getNext());
    node = prev;
  }

}
