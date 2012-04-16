import java.util.Scanner;

/**
 * TryInput -- demonstration of user input with the Scanner class.
 * This class is just a collection of methods that do various
 * things involving user input -- echoing lines of text,
 * performing arithmetic, analyzing input data.
 * 
 * @author Braden Licastro
 * @version 16 November 2010
 */
public class TryInput
{
    // Lines of text from the user are received through the
    // following Scanner object:
    private Scanner reader;

    /**
     * Constructor for objects of class TryInput
     */
    public TryInput()
    {
        // Connect the userInput object to the keyboard and
        // terminal window:
        reader = new Scanner(System.in);
    }

    /**
     * Repeatedly receive lines typed by the user and echo
     * them back to the terminal window.
     */
    public void echo()
    {
        System.out.println("Enter lines of text. To quit, type" +
            " \"bye\" (without the quotes) on a line by itself.");

        String line = reader.nextLine(); // read first line

        // Keep echoing lines until user types "bye":
        while ( ! line.trim().equals("bye"))
        {
            System.out.println("You typed: " + line);
            line = reader.nextLine(); // read next line
        }

        System.out.println("Goodbye!");
    }

    /**
     * Adds two numbers provided by the user, prints the sum.
     */
    public void adder()
    {
        System.out.println("Enter two numbers to be added:");
        double x = reader.nextDouble();
        double y = reader.nextDouble();
        System.out.println("The sum is " + (x+y));
    }

    /**
     * Calculates a simple arithmetic expression with two
     * numbers and one of the operators "+", "-", "*", "/"
     * and prints the answer.
     */
    public void calc()
    {
        System.out.println("Enter an expression of the form" +
            "\n   number op number\nwhere op is +, -, *, or /" +
            "\nYou MUST put spaces around the operator!");

        // Obtain the inputs: number, string, number:
        double x = reader.nextDouble();
        String op = reader.next();
        double y = reader.nextDouble();

        double answer = 0;

        // Calculate answer based on operator string "op":
        if (op.equals("+"))
            answer = x+y;
        else if (op.equals("-"))
            answer = x-y;
        else if (op.equals("*"))
            answer = x*y;
        else if (op.equals("/"))
            answer = x/y;
        else
            System.out.println("Invalid operator");

        System.out.println("Answer: " + answer);
    }

    /**
     * Finds and prints the average of n numbers, where both
     * n and the numbers to averaged are input by the user.
     */
    public void avg()
    {
        // First we need to know how many values:
        System.out.println("How many values?");
        int n = reader.nextInt();

        System.out.println("Enter " + n + " values:");
        double sum = 0;

        // Loop to read in the values and add them to sum:
        for (int i = 0; i < n; i++)
        {
            sum = sum + reader.nextDouble();
        }

        System.out.println("Average is " + (sum/n));
    }

    /**
     * Finds and prints the average of any amount numbers, the numbers to average are input by the user.
     */
    public void avg2()
    {
        // First we need to know how many values:
        int count = 0;
        double sum = 0;
        double input = 0;

        //Give the user some directions.
        System.out.println ("Enter values. To retrieve average type -9999");

        //Run through loop until they want it terminated
        while (input != -9999)
        {
            //Accept the users input.
            input = reader.nextDouble();
            //Check is here, first time it is run the value wont have a condition checked.
            if(input != -9999)
            {
                sum += input;
                count++;
            }
        }

        //Tell them what the average is.
        System.out.println("Average is " + (sum/count));
    }

    /**
     * Finds and prints the average of n numbers, where both
     * n and the numbers to averaged are input by the user.
     */
    public void countVowels()
    {
        // First we need to know how many values:
        int vowelCount = 0;
        String letterCheck = "";
        String input = "";

        //Give the user some directions.
        System.out.println ("Enter a string of letters to be checked for vowels. Press enter to submit the string.");

        //Let the user input the string.        
        input = reader.nextLine();

        //Count how many vowels are in the string.
        for (int i = 0; i < input.length(); i++)
        {
            letterCheck = input.substring(i, i+1);

            if (letterCheck.contains("a"))
            {
                vowelCount++;
            }
            else if (letterCheck.contains("e"))
            {
                vowelCount++;
            }
            else if (letterCheck.contains("i"))
            {
                vowelCount++;
            }
            else if (letterCheck.contains("o"))
            {
                vowelCount++;
            }
            else if (letterCheck.contains("u"))
            {
                vowelCount++;
            }
        }

        //Tell them how many vowels there were.
        System.out.println("There were " + vowelCount + " vowels in the string\n" + input);
    } 

    public boolean isPrime()
    {
        // Store the inupt and the result:
        double input = 0;
        boolean bool = true;

        //Give the user some directions and take the input.
        System.out.println ("Enter the number you would like to check.");
        input = reader.nextDouble();

        //One is not a prime number so lets treat it as such
        if (input == 1)
        {
            bool = false;
        }

        //Run through loop until they want it terminated
        for (int i = 2; i < input; i++)
        {
            if(input%i == 0)
            {
                bool = false;
                break;
            }
        }

        //Tell them whether it is prime or not.
        return bool;
    }

    /**
     * Test method -- calls the demo methods defined in this
     * class to test them.
     */
    public void test()
    {
        // The following loop executes "forever" (but not really,
        // since the user can "break out" of the loop by typing
        // an appropriate response).
        while (true)
        {
            // Prompt the user for a choice:
            System.out.println("Enter a number from 1 to 5:");
            System.out.println("  1: echo user input");
            System.out.println("  2: perform addition");
            System.out.println("  3: perform simple arithmetic");
            System.out.println("  4: find average");
            System.out.println("  5: quit");

            int choice = reader.nextInt();

            // Decide what to do based upon user's choice:
            if (choice == 1)
            {
                echo();
            }
            else if (choice == 2)
            {
                adder();
            }
            else if (choice == 3)
            {
                calc();
            }
            else if (choice == 4)
            {
                avg();
            }
            else if (choice == 5)
            {
                break; // This means "break out of the loop"
            }
            else
            {
                System.out.println("Invalid choice");
            }
        }

    }
}