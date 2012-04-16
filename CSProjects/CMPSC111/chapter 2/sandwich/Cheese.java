
/**
 * A Cheese object contains just the name of the kind of cheese.
 * By default, this is "none", but the user can supply any
 * kind using a parameter.
 * 
 * @author Bob Roos 
 * @version Version 2 (13 Sept. 2010)
 */
public class Cheese
{
    // instance variables - replace the example below with your own
    private String typeOfCheese;
    
    /**
     * Constructor for objects of class Cheese (default value)
     */
    public Cheese()
    {
        // initialise instance variables
        typeOfCheese = "none";
    }

    /**
     * Constructor for objects of class Cheese (user-supplied value)
     */
    public Cheese(String cheeseType)
    {
        // initialise instance variables
        typeOfCheese = cheeseType;
    }

}
