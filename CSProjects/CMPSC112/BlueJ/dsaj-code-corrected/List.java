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
/** A list of elements. */
public interface List<E> extends Iterable<E> {

  /** Add target to the back of this List. */
  public void add(E target);

  /** Return true if some item in this List equals() target. */
  public boolean contains(E target);

  /** Return the indexth element of this List. */
  public E get(int index);

  /** Return true if this List is empty. */
  public boolean isEmpty();

  /**
   * Remove and return the indexth element from this List, shifting
   * all later items one place left.
   */
  public E remove(int index);

  /**
   * Remove the first occurrence of target from this List, shifting
   * all later items one place left.  Return true if this List
   * contained the specified element.
   */
  public boolean remove(E target);

  /** Replace the indexth element of this List with target. */
  public void set(int index, E target);
  
  /** Return the number of elements in this List. */
  public int size();

}
