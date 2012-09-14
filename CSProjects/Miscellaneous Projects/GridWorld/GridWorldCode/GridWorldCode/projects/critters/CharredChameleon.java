import java.util.ArrayList;
import java.util.Random;
import info.gridworld.actor.Actor;
import info.gridworld.actor.Critter;
import info.gridworld.actor.Rock;
import info.gridworld.grid.Grid;
import info.gridworld.grid.Location;
import java.awt.Color;

public class CharredChameleon extends Critter
{
    
    public void act()
    {
        if (getGrid() == null)
            return;
        ArrayList<Actor> actors = getActors();
        processActors(actors);
        ArrayList<Location> moveLocs = getMoveLocations();
        Location loc = selectMoveLocation(moveLocs);
        makeMove(loc);
        Color c = getColor();
        int red = (int)((c.getRed()) * .95);
        int green = (int)((c.getGreen()) * .95);
        int blue = (int)((c.getBlue()) * .95);
        setColor(new Color (red, green, blue));
    }
    
    public void processActors(ArrayList<Actor> actors)
    {
        for (Actor a : actors)
        {
            if (a instanceof Rock)
            {
            	Location loc = a.getLocation();
            	CrabCritter mrCrabs = new CrabCritter();
            	add(loc, mrCrabs);
            }
            else if (a instanceof CharredChameleon)
            {
            	a.setColor(Color.blue);
            }
        }
    }
    
    public void add(Location loc, Actor occupant)
    {
        occupant.putSelfInGrid(getGrid(), loc);
    }
   
    public Location selectMoveLocation(ArrayList<Location> locs)
    {
    	int[] directions = new int[4];
    	directions[0]=45;
    	directions[1]=135;
    	directions[2]=225;
    	directions[3]=315;
    	locs = getLocationsInDirections(directions);
    	Random rand = new Random(locs.size());
    	return locs.get(rand.nextInt(locs.size()));
    }
    
    public void makeMove(Location loc)
    {
        if (loc.equals(getLocation()))
        {
            double r = Math.random();
            int angle;
            if (r < 0.5)
                angle = Location.LEFT;
            else
                angle = Location.RIGHT;
            setDirection(getDirection() + angle);
        }
        else
            super.makeMove(loc);
    }
    
    public ArrayList<Location> getLocationsInDirections(int[] directions)
    {
        ArrayList<Location> locs = new ArrayList<Location>();
        Grid gr = getGrid();
        Location loc = getLocation();
    
        for (int d : directions)
        {
            Location neighborLoc = loc.getAdjacentLocation(getDirection() + d);
            if ((gr.get(neighborLoc) == null)){
            if (gr.isValid(neighborLoc))
                locs.add(neighborLoc);
            }
        }
        return locs;
    }
}
