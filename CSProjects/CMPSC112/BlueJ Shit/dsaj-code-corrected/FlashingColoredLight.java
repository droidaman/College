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
/** A flashing, colored light bulb. */
public class FlashingColoredLight extends ColoredLight {

  /** No special initialization is required. */
  public FlashingColoredLight() {
    super();
  }

  /** Toggle the light's on status after returning a String. */
  public String toString() {
    String result;
    if (isOn()) {
      result = "" + getColor();
    } else {
      result = ".";
    }
    setOn(!isOn());
    return result;
  }

}
