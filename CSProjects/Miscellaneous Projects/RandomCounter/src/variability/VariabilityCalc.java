package variability;

//I just used this because it makes the code more readable.
import java.util.*;

public class VariabilityCalc {

	//Initialize our ArrayList to type integer and other necessary variables.
	public static ArrayList<Integer> temps = new ArrayList<Integer>();
	public static double average;

	/**
	 * Runs the primary logic of the program and calls other methods.
	 * @param args Documentation unnecessary.
	 */
	public static void main(String[] args)
	{
		//Call a method to add numbers to the 
		addVals();
		//Compute the average after entering of numbers has completed.
		computeAvg();
	}

	/**
	 * Adds new values to the ArrayList by reading the stream from the keyboard.
	 * It will quit adding values when '999' is entered
	 */
	public static void addVals()
	{
		//Sets up input reader and variables for rest of method.
		Scanner reader = new Scanner(System.in);
		int tempVal = -999; //Safe number as not a real temperature and not 999

		System.out.println("You will now enter the forecasted temperature values.\nEnter 999 when finished.");
		System.out.print("Please enter the first value: "); //Enter first value outside loop to get it started

		/**
		 * This is actually a slightly more efficient loop so you don't have
		 * duplicate input that does the same thing before entering and once
		 * in the loop. In addition, instead of having to load and check
		 * variables in memory, the loop validation is always true so
		 * the loop operates several ms. faster than a conditional check.
		 */
		do
		{
			tempVal = reader.nextInt();
			/**
			 * If statement checks the same condition for 2 different purposes. 
			 * (ie. consolidating print and loop check)
			 * Keeps the loop from printing out the input line one extra time.
			 * Also breaks from the infinite loop at the appropriate time.
			 */
			if (tempVal != 999)
			{
				System.out.print("Please enter the next number (or 999): ");
				temps.add(tempVal);
			}
			else
			{
				break;
			}
		}
		while (true);

		//Also perfectly correct, just have duplicate code with this method and extra memory calls.
		/**
		 *tempVal = reader.nextInt();
		 *
		 *while(tempVal != 999)
		 *{
		 *	temps.add(tempVal);
		 *	System.out.print("Please enter the next number (or 999): ");
		 *	tempVal = reader.nextInt();
		 *}
		 */
	}

	/**
	 * Computes the average of all values currently in the ArrayList.
	 * <b>Important: </b> Do not call this method until all values you wish to add to 
	 * the ArrayList are added! Doing otherwise will result in an incorrect average.
	 */
	public static void computeAvg()
	{
		//Iterators usually need to be declared individually in each method so
		//it can't be called several times simultaneously. Thats what the error
		//you encountered was from.
		//In addition, unless you have a static access from a non-static context
		//error, you shouldn't have to "cast" anything from an iterator if done correctly.
		
		//Initialize the iterator and all necessary variables
		Iterator<Integer> iter = temps.iterator();
		int sum = 0, val;

		//While there is another column in the array...
		while(iter.hasNext())
		{
			//Set the integer arraylist object to integer variable val
			val = iter.next();
			//Print the numbers that were typed in a readable fashion.
			System.out.print(val + " ");
			//Calculate a sum from the value.
			sum += val;
		}
		
		//Calculate and print the average of the numbers in the most efficient manner.
		System.out.println("\nThe average of the numbers is: " + (average = sum / temps.size()));
	}
}
