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
/** An array-based List of Comparables. */
public class SortableArrayList<E extends Comparable<E>>
  extends ArrayList<E> {

  public boolean contains(E target) {
    insertionSort();
    int bottom = 0;
    int top = size() - 1;
    while (bottom <= top) {
      int midpoint = (top + bottom) / 2;
      int comparison = target.compareTo(get(midpoint));
      if (comparison < 0) {
        top = midpoint - 1;
      } else if (comparison == 0) {
        return true;
      } else {
        bottom = midpoint + 1;
      }
    }
    return false;
  }

  /** Arrange the elements in this List from smallest to largest. */
  public void insertionSort() {
    for (int i = 1; i < size(); i++) {
      E target = get(i);
      int j;
      for (j = i - 1; (j >= 0) && (get(j).compareTo(target) > 0);
	       j--) {
        set(j + 1, get(j));
      }
      set(j + 1, target);
    }
  }

}
