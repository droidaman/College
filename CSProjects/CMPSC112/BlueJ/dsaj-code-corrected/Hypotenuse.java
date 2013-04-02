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


// Introduced in Chapter 4
/** Compute the hypotenuse of a right triangle. */
public class Hypotenuse {

  /** Return the square of the number x. */
  public static double square(double x) {
    return x * x;
  }

  /**
   * Return the hypotenuse of a right triangle with side lengths x
   * and y.
   */
  public static double hypotenuse(double x, double y) {
    double x2 = square(x);
    double y2 = square(y);
    return Math.sqrt(x2 + y2);
  }

  /** Test the methods. */
  public static void main(String[] args) {
    double result = hypotenuse(3, 4);
    System.out.println(result);
  }
  
}
