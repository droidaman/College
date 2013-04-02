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
/** A string of Lights, as used in Christmas decorating. */
public class LightString {

  /** The Lights in this LightString. */
  private Light[] bulbs;

  /** Every other Light is a ColoredLight. */
  public LightString(int size) {
    bulbs = new Light[size];
    for (int i = 0; i < size; i++) {
      if (i % 2 == 0) {
        bulbs[i] = new Light();
      } else {
        bulbs[i] = new ColoredLight();
      }
    }
  }

  /** Turn all of the Lights in the LightString on or off. */
  public void setOn(boolean on) {
    for (Light b : bulbs) {
      b.setOn(on);
    }
  }

  public String toString() {
    String result = "";
    for (Light b : bulbs) {
      result += b;
    }
    return result;
  }

  /** Create a LightString, print it, turn it on, and print it again. */
  public static void main(String[] args) {
    LightString lights = new LightString(20);
    System.out.println(lights);
    lights.setOn(true);
    System.out.println(lights);
  }

}
