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


// Methods introduced in Chapter 8
/** Methods for searching and sorting arrays. */
public class Search {

  /** Return true if target appears in the sorted array data. */
  public static boolean binarySearch(int[] data, int target) {
    int bottom = 0;
    int top = data.length - 1;
    while (bottom <= top) {
      int midpoint = (top + bottom) / 2;
      if (target < data[midpoint]) {
        top = midpoint - 1;
      } else if (target == data[midpoint]) {
        return true;
      } else {
        bottom = midpoint + 1;
      }
    }
    return false;
  }

  // Added in Chapter 12
  /**
   * Arrange the numbers in data from smallest to largest.
   * Assume each is 0.0 <= x < 1.0.
   */
  public static void bucketSort(double[] data) {
    int n = data.length;
    List<SortableLinkedList<Double>> buckets
      = new ArrayList<SortableLinkedList<Double>>();
    for (int i = 0; i < n; i++) {
      buckets.add(new SortableLinkedList<Double>());
    }
    for (int i = 0; i < n; i++) {
      buckets.get((int)(data[i] * n)).add(data[i]);
    }
    int i = 0;
    for (SortableLinkedList<Double> bucket : buckets) {
      bucket.insertionSort();
      for (Double d : bucket) {
        data[i] = d;
        i++;
      }
    }
  }

  /** Arrange the numbers in data from smallest to largest. */
  public static void insertionSort(int[] data) {
    for (int i = 1; i < data.length; i++) {
      int target = data[i];
      int j;
      for (j = i - 1; (j >= 0) && (data[j] > target); j--) {
        data[j + 1] = data[j];
      }
      data[j + 1] = target;
    }
  }

  // Added in Chapter 12
  /** Return true if target appears in the sorted array data. */
  public static boolean interpolationSearch(double[] data,
		                                   double target) {
    int bottom = 0;
    int top = data.length - 1;
    while (bottom <= top) {
      double lo = data[bottom];
      double hi = data[top];
      if (lo == hi) {
        return target == lo;
      }
      if ((target < lo) || (target > hi)) {
        return false;
      }
      double fraction = (target - lo) / (hi - lo);
      int midpoint = bottom + (int)((top - bottom) * fraction);
      if (target < data[midpoint]) {
        top = midpoint - 1;
      } else if (target == data[midpoint]) {
        return true;
      } else {
        bottom = midpoint + 1;
      }
    }
    return false;
  }

  /** Return true if target appears in the sorted array data. */
  public static boolean linearSearch(int[] data, int target) {
    for (int i = 0; (i < data.length) && (data[i] <= target); i++) {
      if (data[i] == target) {
        return true;
      }
    }
    return false;
  }

  // Added in Chapter 9
  /**
   * Combine the two sorted arrays a and b into a single, sorted array.
   */
  protected static int[] merge(int[] a, int[] b) {
    int[] result = new int[a.length + b.length];
    int i = 0;
    int j = 0;
    for (int k = 0; k < result.length; k++) {
      if ((j == b.length) || ((i < a.length) && (a[i] <= b[j]))) {
        result[k] = a[i];
        i++;
      } else {
        result[k] = b[j];
        j++;
      }
    }
    return result;
  }

  // Added in Chapter 9
  /**
   * Return an array containing the numbers from data, in order from
   * smallest to largest.
   */
  public static int[] mergeSort(int[] data) {
    return mergeSortHelper(data, 0, data.length - 1);
  }

  // Added in Chapter 9
  /**
   * Return an array containing the numbers in data between the indices
   * bottom and top, inclusive, in order from smallest to largest.
   */
  protected static int[] mergeSortHelper(int[] data, int bottom,
		                                int top) {
    if (bottom == top) {
      return new int[] { data[bottom] };
    } else {
      int midpoint = (top + bottom) / 2;
      return merge(mergeSortHelper(data, bottom, midpoint),
                   mergeSortHelper(data, midpoint + 1, top));
    }
  }

  // Added in Chapter 9
  /**
   * Choose one element of data in the region between bottom and top,
   * inclusive, as the pivot.  Arrange the numbers so that those less
   * than or equal to the pivot are to the left of it and those
   * greater than the pivot are to the right of it.  Return the final
   * position of the pivot.
   */
  protected static int partition(int[] data, int bottom, int top) {
    int pivot = data[top];
    int firstAfterSmall = bottom;
    for (int i = bottom; i < top; i++) {
      if (data[i] <= pivot) {
        swap(data, firstAfterSmall, i);
        firstAfterSmall++;
      }
    }
    swap(data, firstAfterSmall, top);
    return firstAfterSmall;
  }

  // Added in Chapter 9
  /** Arrange the numbers in data from smallest to largest. */
  public static void quicksort(int[] data) {
    quicksortHelper(data, 0, data.length - 1);
  }

  // Added in Chapter 9
  /**
   * Arrange the numbers in data between indices bottom and top,
   * inclusive, from smallest to largest.
   */
  protected static void quicksortHelper(int[] data, int bottom,
		                               int top) {
    if (bottom < top) {
      int midpoint = partition(data, bottom, top);
      quicksortHelper(data, bottom, midpoint - 1);
      quicksortHelper(data, midpoint + 1, top);
    }
  }
  
  public static int[] randomNumbers(int size) {
    int[] result = new int[size];
    for (int i = 0; i < size; i++) {
      result[i] = (int)(Math.random() * 100);
    }
    return result;
  }

  // Added in Chapter 9
  /** Swap the elements of data at indices i and j. */
  protected static void swap(int[] data, int i, int j) {
    int temp = data[i];
    data[i] = data[j];
    data[j] = temp;
  }

  public static void main(String[] args) {
    double[] data = new double[10];
    for (int i = 0; i < data.length; i++) {
      data[i] = Math.random();
    }
    System.out.println(java.util.Arrays.toString(data));
    bucketSort(data);
    System.out.println(java.util.Arrays.toString(data));
  }

}
