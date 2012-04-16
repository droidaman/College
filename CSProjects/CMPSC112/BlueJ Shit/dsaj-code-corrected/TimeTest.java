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


// Introduced in Chapter 7
/** Time tests to compare performance of various algorithms. */
public class TimeTest {

  /** Number of Objects to store in each data structure. */
  public static final int LIST_LENGTH = 100;

  /** Number of times to perform the operation being timed. */
  public static final int TEST_RUNS = 1000000;

  /**
   * Store LIST_LENGTH Objects in list.  Time list's get() method,
   * printing the number of milliseconds taken.
   */
  public static void test(List<Object> list) {
    for (int i = 0; i < LIST_LENGTH; i++) {
      list.add(new Object());
    }
    long before = System.currentTimeMillis();
    for (int i = 0; i < TEST_RUNS; i++) {
      list.get(5);
    }
    long after = System.currentTimeMillis();
    System.out.println((after - before) + " milliseconds");
  }
  
  /** Compare ArrayList with LinkedList. */
  public static void main(String[] args) {
    System.out.print("ArrayList: ");
    test(new ArrayList<Object>());
    System.out.print("LinkedList: ");
    test(new LinkedList<Object>());
  }

}
