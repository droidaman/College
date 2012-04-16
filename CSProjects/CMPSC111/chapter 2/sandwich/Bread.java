
/**
 * A Bread object contains just the name of the kind of bread.
 * By default, this is "white", but the user can supply any
 * other kind using a parameter.
 * 
 * @author Bob Roos 
 * @version Version 2 (13 Sept. 2010)
 */
public class Bread
{
    // instance variables
    private String typeOfBread;

    /**
     * Constructor for objects of class Bread (default value)
     */
    public Bread()
    {
        // initialise instance variables
        typeOfBread = "white";
    }

    /**
     * Constructor for objects of class Bread (user-supplied value)
     */
    public Bread(String breadType)
    {
        // initialise instance variables
        typeOfBread = breadType;
    }
}
