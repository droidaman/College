	//Braden Licastro
	//Pd: 7/8

	/**
	 * A <code>SpiralBug</code> traces out a square "spiral" of a given size. <br />
	 * The implementation of this class is testable on the AP CS A and AB exams.
	 */

import info.gridworld.actor.Bug;

public class InverseSpiralBug extends Bug
{
		    private int steps;
		    private int sideLength;

		    /**
		     * Constructs a box bug that traces a "spiral" of a given side length
		     * @param length the side length
		     */
		    public InverseSpiralBug(int length)
		    {
		        steps = 0;
		        sideLength = length;
		    }

		    /**
		     * Moves to the next location of the "spiral".
		     */
		    public void act()
		    {
		        if (steps < sideLength && canMove())
		        {
		            move();
		            steps++;
		        }
		        else
		        {
		        	turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            turn();
		            steps = 0;
		            
		        }
		    }
}