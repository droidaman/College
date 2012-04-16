/**
 * Solution to the eight puzzle (using A* search).
 *
 * @author Bob Roos
 * @reaurhor Braden Licastro
 * @version 8 February 2012
 * @revision 15 February 2012
 */

import java.util.*;

public class EightAStar {
  private int count;   // keeps track of number of nodes visited

  public static void main(String[] args) {
    if (args.length < 1) {
      System.out.println("Usage: java EightAStar initial");
      System.exit(1);
    }
    String init = args[0];

    EightAStar eight = new EightAStar();

    Puzzle solution = eight.solve(init);

    if (solution != null) {
      // Since solution path is backwards, place on a stack:
      Stack<Puzzle> reverse = new Stack<Puzzle>();
      while (solution != null) {
        reverse.push(solution);
        solution = solution.parent();
      }

      // Stack now contains solution from top to bottom,
      // so pop and print:
      System.out.println("Solution (" + (reverse.size()-1) + " moves):");
      while (!reverse.isEmpty()) {
        reverse.pop().display();
        System.out.println();
      }
    }
    else
      System.out.println("No solution");

    System.out.println(eight.count+" nodes examined");
  }


  /**
   * Returns a goal state for the Eight puzzle if a solution exists.
   *
   * This follows the best-first search algorithm
   * on page 134 of Luger, "Artificial Intelligence," 6th ed.
   *
   * @return	A goal state of the eight puzzle (if a solution
   *		has been found) or null (if no solution)
   */
  public Puzzle solve(String init) {
    PriorityQueue<Puzzle> open = new PriorityQueue<Puzzle>();
    ArrayList<Puzzle> closed = new ArrayList<Puzzle>();

    open.add(new Puzzle(init));

    count = 0;

    // Repeat as long as there are new states to examine:
    while (! open.isEmpty()) {
      count++;
      Puzzle x = open.poll();
      // See if we have reached the goal state:
      if (x.board().equals("12345678_")) {
        return x;
      } else {
    	  // Add the new children to the arraylist to process below.
    	  ArrayList<Puzzle> children = findChildren(x);
    	  // For each puzzle state on the arraylist
    	  for(Puzzle process : children)
    	  {
    		  // If the puzzle isn't on open or closed give it a heuristsic and offer it to open!
        	  if(!open.contains(process) && !closed.contains(process))
        	  {
            	  open.offer(process);    		  
        	  }
        	  // If the puzzle state is already on open...
        	  if(open.contains(process))
        	  {
        		  // Find the puzzle, check the heuristic, if its longer
        		  // replace it with the shorter of the solutions.
        		  Puzzle temp = locate(process, open);
        		  if(temp.h() < process.h())
        		  {
        			  open.remove(temp);
        			  open.offer(process);
        		  }
        	  }
        	  // If the puzzle state is already on closed...
        	  if(closed.contains(process))
        	  {
        		  // Find the puzzle, check the heuristic, if its longer
        		  // replace it with the shorter of the solutions.
        		  Puzzle temp = locate(process, closed);
        		  if(temp.h() < process.h())
        		  {
        			  closed.remove(temp);
        			  closed.add(process);
        		  }
        	  }        	  
    	  }
    	  // We're  done with this state, add it to the closed list.
          closed.add(x);
      }

    } // end of while loop
    return null; // we failed to find a solution
  }
          


  /**
   * Compute "children" of current state, i.e.,
   * states reachable from x in a single legal move. This is
   * not the most elegant code, but it works.
   *
   * @param x    current state
   *
   * @return  a list of the children of state x
   */
  public ArrayList<Puzzle> findChildren(Puzzle x) {

    ArrayList<Puzzle> childList = new ArrayList<Puzzle>();

    // First, locate the blank:
    String board = x.board();
    int blankLoc = board.indexOf("_");

    int swapLoc; // location of element to be swapped with blank
    String newBoard = ""; // used to build up the child state

    // Move blank up?
    swapLoc = blankLoc-3;
    if (swapLoc >= 0) {
      newBoard = board.substring(0,swapLoc)
                + "_"
                + board.substring(swapLoc+1,blankLoc)
                + board.charAt(swapLoc)
                + board.substring(blankLoc+1);
      Puzzle child = x.clone();
      child.setBoard(newBoard);
      childList.add(child);
    }

    // Move blank down?
    swapLoc = blankLoc+3;
    if (swapLoc < board.length()) {
      newBoard = board.substring(0,blankLoc)
                + board.charAt(swapLoc)
                + board.substring(blankLoc+1,swapLoc)
                + "_"
                + board.substring(swapLoc+1);
      Puzzle child = x.clone();
      child.setBoard(newBoard);
      childList.add(child);
    }

    // Move blank left?
    if (blankLoc % 3 > 0) {
      swapLoc = blankLoc-1;
      newBoard = board.substring(0,swapLoc)
                + "_"
                + board.substring(swapLoc+1,blankLoc)
                + board.charAt(swapLoc)
                + board.substring(blankLoc+1);
      Puzzle child = x.clone();
      child.setBoard(newBoard);
      childList.add(child);
    }

    // Move blank right?
    if (blankLoc % 3 < 2) {
      swapLoc = blankLoc+1;
      newBoard = board.substring(0,blankLoc)
                + board.charAt(swapLoc)
                + board.substring(blankLoc+1,swapLoc)
                + "_"
                + board.substring(swapLoc+1);
      Puzzle child = x.clone();
      child.setBoard(newBoard);
      childList.add(child);
    }
    return childList;
  }


  /**
   * Locate and return a Puzzle p in a collection c. This
   * can be either an ArrayList or a PriorityQueue (it works
   * for either one).
   *
   * This is a very slow linear search algorithm; the PriorityQueue
   * class is not well-designed for locating elements other than the
   * minimum.
   *
   * @param	p	a Puzzle to search for
   * @param	c	an ArrayList or a PriorityQueue containing * Puzzles
   *
   * @return	the puzzle found, or null
   */
  public Puzzle locate(Puzzle p, Collection c) {
    Iterator<Puzzle> iter = (Iterator<Puzzle>) c.iterator();
    while (iter.hasNext()) {
      Puzzle temp = iter.next();
      if (p.equals(temp))
        return temp;
    }
    return null;
  }
}
