import java.util.Random;

/**
 * Write a description of class RandomTester here.
 * 
 * @author (Braden Licastro) 
 * @version (11.19.2010)
 */
public class RandomTester
{
    // 
    private int x;
    private Random randomGenerator = new Random();

    /**
     * Constructor for objects of class RandomTester
     */
    public RandomTester()
    {
        // initialise instance variables
        x = 0;
    }

    /**
     * An example of a method - replace this comment with your own
     * 
     * @param  y   a sample parameter for a method
     * @return     the sum of x and y 
     */
    public void printOneRandom()
    {
        //Generate the random number.
        int rNum = randomGenerator.nextInt();
        // Print out the random number
        System.out.println("The random number of the day is " + rNum);
    }

    /**
     * An example of a method - replace this comment with your own
     * 
     * @param  y   a sample parameter for a method
     * @return     the sum of x and y 
     */
    public void sampleMethod(int howMany)
    {
        //Keep printing until we get to the outer bound allowed.
        for(int i = 0; i < howMany; i++)
        {
            //Generate the random number.
            int rNum = randomGenerator.nextInt();
            // Print out the random number
            System.out.println("The random number of the second is " + rNum);   
        }
    }
}
