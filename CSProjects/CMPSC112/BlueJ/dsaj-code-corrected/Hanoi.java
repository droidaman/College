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


// Introduced in Chapter 9
/** Program to solve the Towers of Hanoi puzzle. */
public class Hanoi {

  /**
   * Move the specified number of disks from source to dest, making
   * use of a spare peg.
   */
  public static void hanoi(int disks, int source, int dest, int spare) {
    if (disks == 1) {
      System.out.println(source + " => " + dest);
    } else {
      hanoi(disks - 1, source, spare, dest);
      System.out.println(source + " => " + dest);
      hanoi(disks - 1, spare, dest, source);
    }
  }

  
  /** Move a single disk from source to dest. */
  public static void hanoi1(int source, int dest) {
    System.out.println(source + " => " + dest);
  }

  /** Move two disks from source to dest, making use of a spare peg. */
  public static void hanoi2(int source, int dest, int spare) {
    hanoi1(source, spare);
    System.out.println(source + " => " + dest);
    hanoi1(spare, dest);
  }
  
  /** Move three disks from source to dest, making use of a spare peg. */
  public static void hanoi3(int source, int dest, int spare) {
    hanoi2(source, spare, dest);
    System.out.println(source + " => " + dest);
    hanoi2(spare, dest, source);
  }

  /** Run hanoi() for three disks. */
  public static void main(String[] args) {
    hanoi(3, 1, 3, 2);
  }
  
}
