
/**
 * A Meat object contains just the name of the kind of meat.
 * By default, this is "none", but the user can supply any
 * kind using a parameter.
 * 
 * @author Bob Roos 
 * @version Version 2 (13 Sept. 2010)
 */
public class Meat
{
    // instance variables 
    private String typeOfMeat;
    
    /**
     * Constructor for objects of class Meat (default value)
     */
    public Meat()
    {
        // initialise instance variables
        typeOfMeat = "none";
     }

     /**
     * Constructor for objects of class Meat (user-supplied value)
     */
    public Meat(String meatType)
    {
        // initialise instance variables
        typeOfMeat = meatType;
     }
}
