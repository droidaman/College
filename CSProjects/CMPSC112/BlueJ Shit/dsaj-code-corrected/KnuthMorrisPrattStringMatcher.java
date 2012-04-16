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
/** String matcher using the Knuth-Morris-Pratt skipping algorithm. */
public class KnuthMorrisPrattStringMatcher
  extends AbstractStringMatcher {

  /**
   * Length of longest pattern prefix ending at each position in
   * pattern.
   */
  private int[] prefixArray;

  /** Pattern is the pattern being sought. */
  public KnuthMorrisPrattStringMatcher(String pattern) {
    super(pattern);
    prefixArray = new int[getPattern().length()]; // All zeroes
    int i = 1;
    int matches = 0;
    while (i < getPattern().length()) {
      if (getPattern().charAt(i) == getPattern().charAt(matches)) {
        matches++;
        prefixArray[i] = matches;
        i++;
      } else if (matches > 0) {
        matches = prefixArray[matches - 1];
      } else {
        i++;
      }
    }
  }

  public int match(String text) {
    int i = 0;
    int matches = 0;
    while (i < text.length()) {
      if (text.charAt(i) == getPattern().charAt(matches)) {
        matches++;
        if (matches == getPattern().length()) {
          return i + 1 - getPattern().length();
        } else {
          i++;
        }
      } else if (matches > 0) {
        matches = prefixArray[matches - 1];
      } else {
        i++;
      }
    }
    return -1;
  }

  public static void main(String[] args) {
    System.out.println(new KnuthMorrisPrattStringMatcher("plan").match("amanaplanacanalpanama"));
  }

}
