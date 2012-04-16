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


// Introduced in Chapter 11
/** Collection of letters for use in Anagrams. */
public class LetterCollection {

  /** Total number of letters. */
  private int count;

  /**
   * Number of each letter.  For example, tiles[0] is the number of
   * 'a's.
   */
  private int[] tiles;

  /**
   * If full is true, there are 416 letters, with more copies of
   * more common letters like 'e'.  Otherwise, the new
   * LetterCollection is empty.
   */
  public LetterCollection(boolean full) {
    if (full) {
      tiles = new int[] {29, 5, 12, 16, 50, 9, 8, 20, 28,
                         4, 5, 16, 9, 30, 28, 8, 3, 30,
                         24, 36, 14, 8, 8, 4, 9, 3};
      count = 416;
    } else {
      tiles = new int[26];      // All zeroes
      count = 0;
    }
  }

  /** Add a single letter to this LetterCollection. */
  public void add(char letter) {
    tiles[letter - 'a']++;
    count++;
  }

  /** Add each letter in word to this LetterCollection. */
  public void add(String word) {
    for (char c : word.toCharArray()) {
      tiles[c - 'a']++;
    }
    count += word.length();
  }

  /** Remove and return a random letter. */
  public char draw() {
    int rand = (int)(Math.random() * count);
    for (int i = 0; i < 26; i++) {
      if (rand < tiles[i]) {
        tiles[i]--;
        count--;
        return (char)('a' + i);
      } else {
        rand -= tiles[i];
      }
    }
    return '?';                 // This should never happen
  }

  /** Remove each letter in word from this LetterCollection. */
  public void remove(String word) {
    for (char c : word.toCharArray()) {
      tiles[c - 'a']--;
    }
    count -= word.length();
  }

  public String toString() {
    String result = "";
    for (int i = 0; i < 26; i++) {
      for (int j = 0; j < tiles[i]; j++) {
        result += (char)('a' + i);
      }
    }
    return result;
  }
  
}
