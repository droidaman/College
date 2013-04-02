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


// Introduced in Chapter 8
/** A linked List of Comparables. */
public class SortableLinkedList<E extends Comparable<E>>
  extends LinkedList<E> {

  /** Add target in order, assuming this List is currently sorted. */
  protected void addInOrder(E target) {
    Predecessor<E> prev = this;
    ListNode<E> node = getNext();
    while ((node != null)
		  && (node.getItem().compareTo(target) < 0)) {
      prev = node;
      node = node.getNext();
    }
    prev.setNext(new ListNode<E>(target, node));
  }

  /** Arrange the elements in this List from smallest to largest. */
  public void insertionSort() {
    SortableLinkedList<E> newList = new SortableLinkedList<E>();
    for (E e : this) {
      newList.addInOrder(e);
    }
    setNext(newList.getNext());
  }
  
  public static void main(String[] args) {
    SortableLinkedList<String> ls = new SortableLinkedList<String>();
    ls.add("command-line-args-please");
    for (String s : args) {
      ls.add(s);
    }
    System.out.println(ls);
    ls.insertionSort();
    System.out.println(ls);
  }

}
