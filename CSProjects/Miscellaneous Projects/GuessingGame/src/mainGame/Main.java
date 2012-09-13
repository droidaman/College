/*
Braden Licastro
Pd: 7/8
AP Computer Science
 */

package mainGame;

import java.util.Scanner;
import java.util.Random;

public class Main {

	public static void main(String[] args)
	{
		//Declare necessary variables.
		int tries = 0, number, guess = 0;
		
		//Generate our random numbers!
		Random numGen = new Random ();
		number = numGen.nextInt(99);
		//Add 1 to the generated number so it starts at 1 and ends at 100.
		number++;
		
		//Initialize the reader.
		Scanner reader = new Scanner (System.in);
		
		//Ask them for the guess!
		System.out.println ("Welcome to the fabulous world of Braden's number guessing game!" + "\n\nThe number you will be guessing is from 1 to 100, good luck!" + "\nPlease enter your first guess now...");
		System.out.println (number);
		
		//Initialize the number checker.
		while (guess != number)
		{
			//What did they guess?
			guess = reader.nextInt();
			
			//Is the number higher or lower?
			if (guess < number)
			{
				System.out.println (guess + " is too LOW, guess higher!");
				tries++;				
			}
			else if(guess > number)
			{
				System.out.println (guess + " is too HIGH, guess lower!");
				tries++;
			}
			else
				tries++;
		}
		//Tell the user they did a good job guessing...well... unless they did a bad job guessing!
		if (tries == 1)
		{
			System.out.println ("\nWOW! You must be a god!" + "\nThe number was " + number +" and you got it on the first try!");
			
		}
		else if (tries > 1 && tries <6)
		{
			System.out.println ("\nAwesome!!" + "\nThe number was " + number +"\nIt only took you " + tries + " tries to get it right!");
			
		}
		else if (tries >= 15)
		{
			System.out.println ("\nOh man... your a failure!" + "\nThe number was " + number + "\nI can't believe it took you " + tries + " tries to guess that...");
			
		}
		else
		{
			System.out.println ("\nNot bad!" + "\nThe number was " + number + " and it only took you " + tries + " tries to guess it!");
		}
	}
}
