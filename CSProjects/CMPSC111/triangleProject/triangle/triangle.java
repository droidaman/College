
/**
 * Write a description of class triangle here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

public class triangle
{
    // instance variables - replace the example below with your own
    private int a,b,c;

    /**
     * Constructor for objects of class triangle
     */
    public triangle(int sideA, int sideB, int sideC)
    {
        // initialise instance variables
        a = sideA;
        b = sideB;
        c = sideC;
    }

    public boolean equilateral()
    {
       if (a == b && a == c)
        {
            System.out.println ("Equilateral");
            return true;
        }
       else
       {
           System.out.println ("NOT Equilateral");
           return false;
       }
    }
    
    public boolean isoceles()
    {
        if (a == b || b == c || c == a)
        {
            System.out.println ("Isoceles");
            return true;
        }
        else
        {
            System.out.println ("NOT Isoceles");
            return false;
        }
    }
    
    public boolean right()
    {
        if (a*a + b*b == c*c || b*b + c*c == a*a || c*c + a*a == b*b)
        {
            System.out.println ("It is a right triangle");
            return true;
        }
        else
        {
            System.out.println ("Not a right triangle");
            return false;
        }
    }
}
