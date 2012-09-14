/* Braden Licastro
 * AP Computer Science
 * ACSLLand - Winter Project
 * 1/5/2010
 * PD: 7/8
 */

package mainCode;

import java.util.Scanner;

public class game {

	public static void main(String[] args)
	{
		int player = 0, roll, scoreA = 0, scoreB = 0;
		
		//Initialize the reader.
		Scanner reader = new Scanner (System.in);
		
		//The game has started say hi and give the first instruction.
		System.out.println ("Welcome to a game without a user interface!" + "\nPlease choose who is player A and who is B\n");
		
		//Start the loop that will determine the end of the game.
		while (scoreA < 40 && scoreB < 40)
		{
			//Player "A" info.
			if (player == 0)
			{
				System.out.print ("\nPlayer A: Please roll the die and type your number. (1-8)  ");
				roll = reader.nextInt();
				//Is the number between 0 and 8?
				while (roll < 0 || roll > 8)
				{
					System.out.print ("The number you entered is invalid, it must be 1 thru 8 to play or 0 to exit. \n\nPlease try again...  ");
					roll = reader.nextInt();
				}
				//Is it a 4 or 6? Go back if so!
				if (roll == 4 || roll == 6)
				{
					scoreA = scoreA - roll;
					//Lets not go into the negatives now!
					if (scoreA < 0)
					{
						scoreA = 0;
					}
				}
				//Does the user want to end the game and see the results?
				else if (roll == 0)
				{
					break;
				}
				else
				{
					scoreA = scoreA + roll;
				}
				//Tell the user their new position
				System.out.println ("Player A, your new position is " + scoreA);
				//Did the other player just get squashed and sent to start?
				if (scoreA == scoreB)
				{
					scoreB = 0;
					System.out.println ("Player B, Player A just landed on your space. You have been kicked to the curb and sent back to start!");
				}
				//Its player B's turn now!
				player = 1;
				
			}
			//Whoops! We're player "B" now aren't we!
			else if (player == 1)
			{
				System.out.print ("\nPlayer B: Please roll the die and type your number. (1-8)  ");
				roll = reader.nextInt();
				//Is the number between 0 and 8?
				while (roll < 0 || roll > 8)
				{
					System.out.print ("The number you entered is invalid, it must be 1 thru 8 to play or 0 to exit. \n\nPlease try again...  ");
					roll = reader.nextInt();
				}
				//Is it a 4 or 6? Go back if so!
				if (roll == 4 || roll == 6)
				{
					scoreB = scoreB - roll;
					//Lets not go into the negatives now!
					if (scoreB < 0)
					{
						scoreB = 0;
					}
				}
				//Does the user want to end the game and see the results?
				else if (roll == 0)
				{
					break;
				}
				else
				{
					scoreB = scoreB + roll;
				}
				//Tell the user their new position
				System.out.println ("Player B, your new position is " + scoreB);
				//Did the other player just get squashed and sent to start?
				if (scoreB == scoreA)
				{
					scoreA = 0;
					System.out.println ("Player A, Player B just landed on your space. You have been kicked to the curb and sent back to start!");
				}
				//Its player A's turn now!
				player = 0;
			}
			//What is this? Oops, Braden has a logic error! Lets tell him he failed!
			else
			{
			System.out.println ("Critical game error. Unknown player. Braden made a big oopsie!");
			}
		}
		//The game is now over, lets see how we did
		//Player A is basking in his/her victorious glory.
		if (scoreA >= 40)
		{
			System.out.println ("\n\nPlayer A has won the game!\nSorry Player B but you only made it to space " + scoreB);
		}
		//Player B takes the cake.
		else if (scoreB >= 40)
		{
			System.out.println ("\n\nPlayer B has won the game!\nSorry Player A but you only made it to space " + scoreA);
		}
		//Everybody fell short of finishing, must have become bored... lets tell them the outcome anyway!
		else
		{
			System.out.println ("\n\nOops, nobody won this round.\nPlayer A made it to space " + scoreA + "\nPlayer B made it to space " + scoreB);
		}
	}
}