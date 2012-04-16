
/**
 * A Sandwich consists of bread, meat (we include vegetarian
 * options, of course!), and cheese. The user specifies these
 * using constructor parameters.
 * 
 * @author Bob Roos 
 * @version 2 (Sept. 13, 2010)
 */
public class Sandwich
{
    // instance variables 
    private Meat meat;
    private Cheese cheese;
    private Bread bread;

    /**
     * Constructor for objects of class Sandwich (user-supplied values)
     */
    public Sandwich(Meat m, Cheese c, Bread b)
    {
        // initialise instance variables
        meat = m;
        cheese = c;
        bread = b;
    }
}
