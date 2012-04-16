/**
 * Solution to the eight puzzle.
 *
 * @author Braden Licastro
 * @version 1 February 2012
 */

import java.util.*;

public class licastbEight {

	// Counter for seeing how many nodes we have visited.
	public int counter = 0;

	public static void main(String[] args) {
		licastbEight puzzle = new licastbEight();

		Stack<String> solution = puzzle.backtrack();
		if (solution != null) {
			String formatting = "";
			for (String s: solution)
			{
				// Let's format the output string to look like the game board we are playing on.
				formatting = s.substring(0, 3) + "\n" + s.substring(3, 6) + "\n" + s.substring(6, 9) + "\n";
				System.out.println(formatting);
			}
		}
		else
			System.out.println("no solution");

		System.out.println(puzzle.counter + " nodes examined");
	}



	/**
	 * Returns a stack containing a sequence of moves for
	 * solving the eight puzzle (empty stack means no solution)
	 *
	 * This follows the general backtracking algorithm
	 * on page 97 of Luger, "Artificial Intelligence," 6th ed.
	 * (but using stack terminology).
	 *
	 * @return A stack containing a sequence of moves for solving
	 *         the eight puzzle
	 */
	public Stack<String> backtrack() {
		Stack<String>     SL,  // state list (current path) 
		NSL; // new state list (not yet evaluated)
		ArrayList<String> DE;  // dead ends (discarded states)
		String CS;             // current state

		SL = new Stack<String>();
		SL.push("23_185476");    
		NSL = new Stack<String>();
		NSL.push("23_185476");    
		DE = new ArrayList<String>();
		CS = "23_185476";

		// Repeat as long as there are new states to examine:
		while (! NSL.isEmpty()) {
			// See if we have reached the goal state:
			if (CS.equals("12345678_")) {
				return SL;
			}

			// We haven't reached the goal, so expand:
			ArrayList<String> children = findChildren(CS,SL,NSL,DE);
			if (children.isEmpty() || SL.size() > 20) {
				while(!SL.isEmpty() && CS.equals(SL.peek())){
					// Increase the counter every time to loop runs
					counter++;
					DE.add(CS);
					SL.pop();
					NSL.pop();
					// Catch the stack error if there is no solution to the lab.
					try {
						CS = NSL.peek();
					} catch (EmptyStackException e) {
						// There was an error, just set CS to null and move on with things.
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

		//Variables necessary applicable to generating our children.
		String child;
		//Where is our "whitespace" at?
		int loc = CS.indexOf('_');

		// Based on the available move swap the appropriate characters.
		switch(loc){
		case 0:
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 1:
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 2:
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 3:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 4:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 5:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'u');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 6:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 7:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'l');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		case 8:
			child = swapper(CS, loc, 'd');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			child = swapper(CS, loc, 'r');
			if (!SL.contains(child) && !NSL.contains(child)) {
				childList.add(child);
			}
			break;
		}

		return childList;
	}


	// Separate method to cleanly swap the characters in the strings. Keeps the code cleaner.
	public String swapper (String CS, int loc, char direction){
		// To make things simple lets convert the string to a character array.
		char[] modified = CS.toCharArray();

		// Based on the available move swap the appropriate characters.
		switch(direction){
		case 'u':
			modified[loc] = modified[(loc + 3)];
			modified[(loc + 3)] = '_';
			break;
		case 'd':
			modified[loc] = modified[(loc - 3)];
			modified[(loc - 3)] = '_';
			break;
		case 'l':
			modified[loc] = modified[(loc + 1)];
			modified[(loc + 1)] = '_';
			break;
		case 'r':
			modified[loc] = modified[(loc - 1)];
			modified[(loc - 1)] = '_';
			break;

		}

		// Remember, we need to return a string, no0t a char array, change it back.
		String child = new String(modified);
		return child;
	}
}
