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
/** Node in a linked list. */
public class ListNode<E> implements Predecessor<E> {

  /** The item stored in this node. */
  private E item;

  /** The node following this one. */
  private ListNode<E> next;

  /** Put item in a node with no next node. */
  public ListNode(E item) {
    this.item = item;
    next = null;
  }

  /** Put item in a node with the specified next node. */
  public ListNode(E item, ListNode<E> next) {
    this.item = item;
    this.next = next;
  }

  /** Return the item stored in this node. */
  public E getItem() {
    return item;
  }

  /** Return the next node. */
  public ListNode<E> getNext() {
    return next;
  }

  /** Replace the item stored in this node. */
  public void setItem(E item) {
    this.item = item;
  }

  /** Set the next node. */
  public void setNext(ListNode<E> next) {
    this.next = next;
  }

}
