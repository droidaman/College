//Braden Licastro
//Pd: 7/8

	import info.gridworld.actor.ActorWorld;
	import info.gridworld.grid.Location;
	import java.awt.Color;

	/**
	 * This class runs a world that contains circle bugs. <br />
	 * This class is not tested on the AP CS A and AB exams.
	 */

public class ZBugRunner
{
	    public static void main(String[] args)
	    {
	        ActorWorld world = new ActorWorld();
	        ZBug fermunda = new ZBug(4);
	        fermunda.setColor(Color.BLACK);
	        fermunda.setDirection(90);
	        world.add(new Location(2, 3), fermunda);

	        world.show();
	    }
}
