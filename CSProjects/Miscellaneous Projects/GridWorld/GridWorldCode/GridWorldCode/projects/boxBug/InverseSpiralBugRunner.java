//Braden Licastro
//Pd: 7/8

	import info.gridworld.actor.ActorWorld;
	import info.gridworld.grid.Location;
	import java.awt.Color;

	/**
	 * This class runs a world that contains circle bugs. <br />
	 * This class is not tested on the AP CS A and AB exams.
	 */

public class InverseSpiralBugRunner
{
	    public static void main(String[] args)
	    {
	        ActorWorld world = new ActorWorld();
	        SpiralBug fred = new SpiralBug(6);
	        fred.setColor(Color.BLACK);
	        SpiralBug bob = new SpiralBug(3);
	        world.add(new Location(7, 8), fred);
	        world.add(new Location(5, 5), bob);
	        world.show();
	    }
}
