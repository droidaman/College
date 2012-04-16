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
/** Searches for a pattern String in various text Strings. */
public abstract class AbstractStringMatcher {

  /** The pattern being sought. */
  private String pattern;

  /** Pattern is the pattern being sought. */
  public AbstractStringMatcher(String pattern) {
    this.pattern = pattern;
  }

  /** Return the pattern this StringMatcher seeks. */
  protected String getPattern() {
    return pattern;
  }

  /** Return true if the pattern appears in text at position. */
  protected boolean matchAt(String text, int position) {
    for (int i = 0; i < pattern.length(); i++) {
      if (pattern.charAt(i) != text.charAt(i + position)) {
        return false;
      }
    }
    return true;
  }

  /**
   * Return the index of the first appearance of the pattern in
   * text, or -1 if it does not appear.
   */
  public abstract int match(String text);

}
