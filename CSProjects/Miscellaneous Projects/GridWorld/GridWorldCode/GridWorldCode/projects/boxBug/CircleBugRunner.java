//Braden Licastro
//Pd: 7/8

	import info.gridworld.actor.ActorWorld;
	import info.gridworld.grid.Location;

	import java.awt.Color;

	/**
	 * This class runs a world that contains circle bugs. <br />
	 * This class is not tested on the AP CS A and AB exams.
	 */
	
	public class CircleBugRunner
	{

	    public static void main(String[] args)
	    {
	        ActorWorld world = new ActorWorld();
	        CircleBug devin = new CircleBug(6);
	        devin.setColor(Color.CYAN);
	        CircleBug braden = new CircleBug(3);
	        world.add(new Location(7, 8), devin);
	        world.add(new Location(5, 5), braden);
	        world.show();
	    }
}
