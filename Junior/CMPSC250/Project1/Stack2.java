import java.util.*;

/**
 * Stack2 -- use built-in Stack class to test input strings
 * to see if they are palindromes.
 *
 * Input: a string of letters in the command line (uses "args")
 * Output: either confirmation that the string is a palindrome or
 *    a list of positions in the second half that fail to match up
 *    with the first half.
 *
 * Usage:
 *       java Stack2 string
 * where string is any sequence of letters.
 *
 * @author	Bob Roos
 * @version	30 August 2012
 */
public class Stack2 {

  public static void main(String[] args) {
    // Create a stack of characters to hold left half of input:

    Stack<Character> cstack = new Stack<Character>();

    // Input comes from the command line:
    String input = args[0];

    // Push left half of string onto stack, character-by-character:
    int len = input.length();
    for (int i = 0; i < len/2; i++) {
      char ch = input.charAt(i);
      cstack.push(ch);
    }

    // As right half is read in, try to match with characters
    // popped from stack; issue warning when match fails.
    // NOTE: for odd-length strings, we skip the center character.
    // This is done by using "(len+1)/2", which is equal to
    // len/2 when len is even, but is one bigger than len/2 when
    // len is odd. (All division is truncated division, i.e., int
    // division.)

    boolean isPalindrome = true;
    for (int i = (len+1)/2; i < len; i++) {
      char ch1 = input.charAt(i);
      char ch2 = cstack.pop();
      if (ch1 != ch2) {
        System.out.println("palindrome failed at position " + i);
        isPalindrome = false;
      }
    }

    if (isPalindrome)
      System.out.println(input + " is a palindrome");
  }
}
