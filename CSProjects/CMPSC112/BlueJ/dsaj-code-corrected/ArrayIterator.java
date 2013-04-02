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


// Introduced in Chapter 5
/** Iterator associated with an ArrayList. */
public class ArrayIterator<E> implements java.util.Iterator<E> {

  /** List being traversed. */
  private ArrayList<E> list;

  /** Index of the last element returned by next(). */
  private int previous;

  /** The Iterator begins ready to visit element 0. */
  public ArrayIterator(ArrayList<E> list) {
    this.list = list;
    previous = -1;
  }

  public boolean hasNext() {
    return (previous + 1) < list.size();
  }

  public E next() {
    previous++;
    return list.get(previous);
  }

  public void remove() {
    list.remove(previous);
    previous--;
  }

}
