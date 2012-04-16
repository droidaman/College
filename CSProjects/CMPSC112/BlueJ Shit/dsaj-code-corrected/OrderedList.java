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
/** A linked list of Comparable items, in increasing order. */
public class OrderedList<E extends Comparable<E>>
  implements Set<E>, Predecessor<E> {

  /** The first node in the list. */
  private ListNode<E> front;

  /** An OrderedList is initially empty. */
  public OrderedList() {
    front = null;
  }

  public void add(E target) {
    Predecessor<E> prev = this;
    ListNode<E> node = front;
    while (node != null) {
      int comparison = target.compareTo(node.getItem());
      if (comparison < 0) {
        prev.setNext(new ListNode<E>(target, node));
        return;
      }
      if (comparison == 0) {
        return;
      }
      prev = node;
      node = node.getNext();
    }
    prev.setNext(new ListNode<E>(target));
  }

  public boolean contains(E target) {
    ListNode<E> node = front;
    while (node != null) {
      int comparison = target.compareTo(node.getItem());
      if (comparison < 0) {
        return false;
      }
      if (comparison == 0) {
        return true;
      }
      node = node.getNext();
    }
    return false;
  }

  public ListNode<E> getNext() {
    return front;
  }

  public void remove(E target) {
    Predecessor<E> prev = this;
    ListNode<E> node = front;
    while (node != null) {
      int comparison = target.compareTo(node.getItem());
      if (comparison == 0) {
        prev.setNext(node.getNext());
        return;
      }
      if (comparison < 0) {
        return;
      }
      prev = node;
      node = node.getNext();
    }
  }

  public void setNext(ListNode<E> next) {
    front = next;
  }

  public int size() {
    int tally = 0;
    for (ListNode<E> node = front;
	    node != null;
		node = node.getNext()) {
      tally++;
    }
    return tally;
  }

  public String toString() {
    String result = "( ";
    for (ListNode<E> node = front;
         node != null;
         node = node.getNext()) {
      result += node.getItem() + " ";
    }
    return result + ")";
  }

}
