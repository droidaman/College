//Braden Licastro
//Pd: 7/8

	import info.gridworld.actor.ActorWorld;
	import info.gridworld.actor.Actor;
	import info.gridworld.grid.UnboundedGrid;
	import info.gridworld.grid.Location;
	import java.awt.Color;

	/**
	 * This class runs a world that contains circle bugs. <br />
	 * This class is not tested on the AP CS A and AB exams.
	 */

public class SpiralBugRunner
{
	    public static void main(String[] args)
	    {
	    	UnboundedGrid grid = new UnboundedGrid<Actor>(); 
	        ActorWorld world = new ActorWorld();
	        SpiralBug fred = new SpiralBug(6);
	        fred.setColor(Color.BLACK);
	        SpiralBug bob = new SpiralBug(3);
	        world.add(new Location(7, 8), fred);
	        world.add(new Location(5, 5), bob);
	        world.show();
	    }
}
