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
/** A linked list. */
public class LinkedList<E> implements List<E>, Predecessor<E> {

  /** The first node in the List. */
  private ListNode<E> front;

  /** A LinkedList is initially empty. */
  public LinkedList() {
    front = null;
  }

  public void add(E target) {
    Predecessor<E> last = this;
    while (last.getNext() != null) {
      last = last.getNext();
    }
    last.setNext(new ListNode<E>(target));
  }

  public boolean contains(E target) {
    for (ListNode<E> node = front;
         node != null;
         node = node.getNext()) {
      if (node.getItem().equals(target)) {
        return true;
      }
    }
    return false;
  }

  public E get(int index) {
    ListNode<E> node = front;
    for (int i = 0; i < index; i++) {
      node = node.getNext();
    }
    return node.getItem();
  }

  public ListNode<E> getNext() {
    return front;
  }
  
  public boolean isEmpty() {
    return front == null;
  }

  public java.util.Iterator<E> iterator() {
    return new ListIterator<E>(this);
  }
  
  public E remove(int index) {
    Predecessor<E> prev = this;
    ListNode<E> node = front;
    for (int i = 0; i < index; i++) {
      prev = node;
      node = node.getNext();
    }
    prev.setNext(node.getNext());
    return node.getItem();
  }

  public boolean remove(E target) {
    Predecessor<E> prev = this;
    ListNode<E> node = front;
    while (node != null) {
      if (node.getItem().equals(target)) {
        prev.setNext(node.getNext());
        return true;
      }
      prev = node;
      node = node.getNext();
    }
    return false;
  }

  public void set(int index, E target) {
    ListNode<E> node = front;
    for (int i = 0; i < index; i++) {
      node = node.getNext();
    }
    node.setItem(target);
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
