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


// Introduced in Chapter 3
/** A colored light bulb. */
public class ColoredLight extends Light {

  /** Color of the ColoredLight. */
  private char color;

  /** Set the color randomly to one of 'R', 'G', or 'B'. */
  public ColoredLight() {
    super();
    int x = (int)(Math.random() * 3);
    switch (x) {
      case 0:
        color = 'R';
        break;
      case 1:
        color = 'G';
        break;
      default:
        color = 'B';
    }
  }
  
  /** Return the color of this ColoredLight. */
  public char getColor() {
    return color;
  }
  
  public String toString() {
    if (isOn()) {
      return "" + color;
    } else {
      return ".";
    }
  }

}
