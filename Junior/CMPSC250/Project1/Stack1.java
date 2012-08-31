import java.util.*;

/**
 * Stack1 -- use built-in Stack class to create stacks of different
 * types and test the "push", "pop", and "isEmpty" methods.
 *
 * Input: none
 * Output: the sequence of "popped" values resulting from
 *    randomly choosing a stack and popping something from it
 *
 * Usage:
 *       java Stack1
 *
 * @author	Bob Roos
 * @version	30 August 2012
 */
public class Stack1 {

  public static void main(String[] args) {
    // Create three stacks, one for integers, one for doubles, one
    // for Strings:

    Stack<Integer> istack = new Stack<Integer>();
    Stack<Double> dstack = new Stack<Double>();
    Stack<String> sstack = new Stack<String>();

    // Push some data onto the stacks:

    istack.push(10); istack.push(20); istack.push(30);
    dstack.push(3.14159); dstack.push(1.732); dstack.push(2.71828);
    sstack.push("abc"); sstack.push("def"); sstack.push("ghi");

    // Randomly pick a stack and pop something from it (if it
    // is not empty); quit when all three stacks are empty:

    while(!istack.isEmpty() || !dstack.isEmpty() || !sstack.isEmpty()) {
      // randomly pick one of the stacks and pop it:
      double r = Math.random();

      if (r < .333333 && !istack.isEmpty())
        System.out.println("popping " + istack.pop());

      else if (r < .6666667 && !dstack.isEmpty())
        System.out.println("popping " + dstack.pop());

      else if (!sstack.isEmpty())
        System.out.println("popping " + sstack.pop());
    }
  }
}
