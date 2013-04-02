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


// Introduced in Chapter 13
/** Simply checks each position in the text for the pattern. */
public class NaiveStringMatcher extends AbstractStringMatcher {

  /** Pattern is the pattern being sought. */
  public NaiveStringMatcher(String pattern) {
    super(pattern);
  }

  public int match(String text) {
    for (int position = 0;
         position + getPattern().length() <= text.length();
         position++) {
      if (matchAt(text, position)) {
        return position;
      }
    }
    return -1;
  }

}
