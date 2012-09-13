/*
Braden Licastro
Pd: 7/8
AP Computer Science
 */

import info.gridworld.actor.Bug;
import info.gridworld.grid.Location;

public class ZBug extends Bug
{
	private int segmentLength;
	private int steps;
	private int side;
	
	public ZBug (int length)
	{
		//Set the bug so it is ready to run in the right direction!
		setDirection(Location.EAST);
		steps = 0;
		side = 1;
		segmentLength = length;
	}
	public void act ()
	{
		//Has the bug moved and steps are less than the side length? if so move
		if (side <= 3 && steps < segmentLength)
		{
			if (canMove())
			{
				move();
				steps++;
			}
		}
		//Time for side 2? Lets move!
		else if (side == 1)
		{
			setDirection(Location.SOUTHWEST);
			steps = 0;
			side++;
		}
		//Time for side 3? Lets move some more! Then stop and stay stopped on this side.
		else if (side == 2)
		{
			setDirection(Location.EAST);
			steps = 0;
			side++;
		}
	}
}