/**
 * Solution to the frog puzzle (backtracking). See:
 *   http://www.hellam.net/maths2000/frogs.html
 *
 * Convert the string "YYY_RRR" to "RRR_YYY"
 * where Y can only move or jump right and
 * R can only move or jump left
 *
 * For consistency with Luger's book I have used all-caps
 * variable names like "SL" and "NSL", even though most
 * Java style guides encourage the use of uncapitalized
 * variable names.
 *
 * @author Bob Roos
 * @version 10 January 2012
 */

package pkg;
import java.util.*;

public class Frog {
	
	public int counter = 0;

  public static void main(String[] args) {
    Frog puzzle = new Frog();

    Stack<String> solution = puzzle.backtrack();
    if (solution != null) {
      for (String s: solution) 
        System.out.println(s);
    }
    else
      System.out.println("no solution");
    
    System.out.println(puzzle.counter + " nodes examined");
  }



  /**
   * Returns a stack containing a sequence of moves for
   * solving the frog puzzle (empty stack means no solution)
   *
   * This follows the general backtracking algorithm
   * on page 97 of Luger, "Artificial Intelligence," 6th ed.
   * (but using stack terminology).
   *
   * @return A stack containing a sequence of moves for solving
   *         the frog puzzle
   */
  public Stack<String> backtrack() {
    Stack<String>     SL,  // state list (current path) 
                      NSL; // new state list (not yet evaluated)
    ArrayList<String> DE;  // dead ends (discarded states)
    String CS;             // current state

    SL = new Stack<String>();
    SL.push("YYYY_RRRR");    
    NSL = new Stack<String>();
    NSL.push("YYYY_RRRR");    
    DE = new ArrayList<String>();
    CS = "YYYY_RRRR";

    // Repeat as long as there are new states to examine:
    while (! NSL.isEmpty()) {
      // See if we have reached the goal state:
      if (CS.equals("RRRR_YYYY")) {
        return SL;
      }

      // We haven't reached the goal, so expand:
      ArrayList<String> children = findChildren(CS,SL,NSL,DE);
      if (children.isEmpty()) {
         while(!SL.isEmpty() && CS.equals(SL.peek())){
        	 // Increase the counter every time to loop runs
        	 counter++;
           DE.add(CS);
           SL.pop();
           NSL.pop();
           // Try to execute this code, will fail in the case of no solution.
           try {
           CS = NSL.peek();
           // It failed, catch the error and move on.
           } catch(EmptyStackException e) {
           CS = null;
         }
         }
         SL.push(CS);
      }
      else {
        NSL.addAll(children);
        CS = NSL.peek();
        SL.push(CS);
      }
    }
    return null;
  }



  /**
   * Compute "children" of current state, i.e.,
   * states reachable from CS in a single legal move:
   *
   * @param CS    current state
   * @param SL    current solution stack
   * @param NSL   current stack of new states
   * @param DE    list of dead-end states
   *
   * @return  a list of the children of state CS that do
   *          not appear in either SL, NSL, or DE
   */
  public ArrayList<String> findChildren(String CS, Stack<String> SL,
                  Stack<String> NSL, ArrayList<String> DE) {

    ArrayList<String> childList = new ArrayList<String>();

    // Look at each substring that represents a legal
    // move, e.g., the move:
    //       YYY_RRR -> Y_YYRRR (yellow jumps yellow)
    // is represented by the substring YY_, which gets replaced by _YY

    String[] before = {"Y_" , "_R" , "YY_" , "YR_" , "_RR" , "_YR"};
    String[] after  = {"_Y" , "R_" , "_YY" , "_RY" , "RR_" , "RY_"};

    for (int i = 0; i < before.length; i++) {

      int location = CS.indexOf(before[i]);
      if (location >= 0) {
        String child = CS.substring(0,location) + 
                       after[i] +
                       CS.substring(location + after[i].length());
        if (!SL.contains(child) && 
            !NSL.contains(child) && 
            !DE.contains(child)) {
          childList.add(child);
        }
      }
    }
    return childList;
  }
}