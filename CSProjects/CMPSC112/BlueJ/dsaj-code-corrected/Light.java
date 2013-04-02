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
/** A light bulb. */
public class Light {

  /** Whether the Light is on. */
  private boolean on;

  /** A Light is off by default. */
  public Light() {
    on = false;
  }

  /** Return true if the Light is on. */
  public boolean isOn() {
    return on;
  }

  /** Set whether the Light is on. */
  public void setOn(boolean on) {
	this.on = on;
  }

  public String toString() {
    if (on) {
      return "O";
    } else {
      return ".";
    }
  }

}
