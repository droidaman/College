/*
Braden Licastro
AP Computer Science
Tic Tac Toe Project
Pd: 7/8
*/

package tttPackage;

//"syso" + CTRL + SPACE will type out the print line for you.
import java.util.Scanner;


public class TickieClass {

	public static void main(String[] args) {
		
		//Lets instantiate those variables fellas!
		int playerNum = 0, indexChoice = 0, row = 0, column = 0, winner = 0;
		String p1Name = "", p2Name = "", playerName = ""; 
		//Lets initialize the game board.
		//Lets set some initial values so we can see which block is which.
		//This way we can choose it with only one number AND WITHOUT THINKING!!!
		char [][] board = { {'1','2','3'}, {'4','5','6'}, {'7','8','9'} };
		//Lets accept our input.
		Scanner reader = new Scanner (System.in);
		
		
		//FINALLY! Lets get on to the actual program,
		//not that the previous was fake or anything.
		//What's yo' name dude?
		System.out.print("Player 1: Please enter your appellation or alias. ");
		p1Name = reader.next();
		System.out.print("Player 2: Please enter your appellation or alias. ");
		p2Name = reader.next();
		
		//Instead of checking for a full array, lets just go by turns, max: 9 (if no winner)
			for( int i = 0; i < 9 && winner == 0; i++)
				{
				//Sooooooo, what does our board look like? Man is that good lookin' huh?
				System.out.print("\n\n");
				System.out.printf(" %c | %c | %c\n", board[0][0], board[0][1], board[0][2]);
				System.out.print("---+---+---\n");
				System.out.printf(" %c | %c | %c\n", board[1][0], board[1][1], board[1][2]);
				System.out.print("---+---+---\n");
				System.out.printf(" %c | %c | %c\n", board[2][0], board[2][1], board[2][2]);
				//Lets select the next player, (alternate to my usual if statement)
				playerNum = playerNum%2 + 1;
				//We could use ternary operators to set current name, but we aren't allowed... :-(
				//  playerName = (playerNum == 1) ? p1Name:p2Name;
				if (playerNum == 1)
				{
					playerName = p1Name;
				}
				else
				{
					playerName = p2Name;
				}
				
			//They selected a square number, lets find the right index.
			do //Run the code once before while loop starts.
			{
				//Ask for and accept input, Sorry Mrs. Fennell, but i'm using a ternary operator here as its a lot of extra code otherwise...
				System.out.printf("\n%s, please enter the number of the square where you want to place your %c: ", playerName,(playerNum==1)?'X':'O');
				indexChoice = reader.nextInt();

				//Lets convert from the simple input to the array accessor.
				if (indexChoice == 1){row = 0; column = 0;}
				else if (indexChoice == 2) {row = 0; column = 1;}
				else if (indexChoice == 3) {row = 0; column = 2;}
				else if (indexChoice == 4) {row = 1; column = 0;}
				else if (indexChoice == 5) {row = 1; column = 1;}
				else if (indexChoice == 6) {row = 1; column = 2;}
				else if (indexChoice == 7) {row = 2; column = 0;}
				else if (indexChoice == 8) {row = 2; column = 1;}
				else if (indexChoice == 9) {row = 2; column = 2;}  
			}
			//Heres the loop for the code above, time to start it now!
			while(indexChoice < 0 || indexChoice > 9 || board[row][column] > '9');

			//Lets write the choice to the array... thank god for using type 'char'!
			//My special friend... the ternary operator... but i'm not allowed to use it yet again!!
			//  board[row][column] = (playerNum == 1) ? 'X' : 'O';
			if (playerNum == 1)
			{
				board[row][column] = 'X';
			}
			else
			{
				board[row][column] = 'O';
			}
		      
			//Check for winning diagonals RIGHT NOW!!!!!!! (There only better be one or I goofed!!)
			if((board[0][0] == board[1][1] && board[0][0] == board[2][2]) || (board[0][2] == board[1][1] && board[0][2] == board[2][0]))
				winner = playerNum;
			else
				//Check the rows and columns for a winning line!!
				for(int l = 0; l <= 2; l ++)
					if((board[l][0] == board[l][1] && board[l][0] == board[l][2]) || (board[0][l] == board[1][l] && board[0][l] == board[2][l]))
						winner = playerNum;
		   }
			
		   //Yes! That took long enough, game over. Lets display the final board!
		   System.out.print("\n\n");
		   System.out.printf(" %c | %c | %c\n", board[0][0], board[0][1], board[0][2]);
		   System.out.print("---+---+---\n");
		   System.out.printf(" %c | %c | %c\n", board[1][0], board[1][1], board[1][2]);
		   System.out.print("---+---+---\n");
		   System.out.printf(" %c | %c | %c\n", board[2][0], board[2][1], board[2][2]);

		   //Lets display the final results!
		   System.out.print("\n\n");
		   if(winner == 0)
		   {
		      System.out.print("\nHumm... this game ended in a draw. You are very evenly matched! Better luck next time!\n");
		   }
		   else
		   {
			   System.out.printf("\nCongratulations, %s. You have won this round! Your friend might want to take notes, young grasshopper...\n",playerName);
		   }
		   System.out.print("\n\n\nThis game of Tic Tac Toe was brought to you by\n  **  Braden Licastro  **");
	}
}