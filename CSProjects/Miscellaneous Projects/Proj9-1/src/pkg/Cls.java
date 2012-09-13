/*Braden Licastro
 * Pd: 7/8
 * AP Computer Science
 * Project 9-1
 */

package pkg;

import java.util.Scanner;

public class Cls {

	public static void main(String[] args) {
		//Arrays, variables and reader
		int [] evenList = new int [10], oddList = new int [10], negativeList = new int [10];
		int temp = 0, evenPosition = 0, oddPosition = 0, negativePosition = 0;
		Scanner reader = new Scanner (System.in);
		
		//Ask for 10 inputs
		for (int i = 0; i < 10; i++)
		{
			//Ask for and accept integer
			System.out.println ("Please enter an integer but not zero...");
			temp = reader.nextInt();
			
			//Figure out what kind of a number it is!?.
			if	(temp % 2 == 0 && temp > 0)
			{
				evenList[evenPosition] = temp;
				evenPosition ++;
				temp = 0;
				
			}
			else if (temp % 2 == 1 && temp > 0)
			{
				oddList[oddPosition] = temp;
				oddPosition ++;
				temp = 0;
			}
			else if (temp < 0)
			{
				negativeList[negativePosition] = temp;
				negativePosition ++;
				temp = 0;
			}
			else
			{
				System.out.println ("Sorry, but you cannot use the number '0'!");
				i--;
			}
		}
		//Tell them they are done!
		System.out.println ("\n\nYou have entered all 10 integers, printing results...\n");
		//Display even numbers
		System.out.println ("Even Positive Numbers:");
		for(int y = 0; y < evenList.length; y++)
		{
		System.out.println (evenList [y]);
		}
		//Display odd numbers
		System.out.println ("Odd Positive Numbers:");
		for(int j = 0; j < oddList.length; j++)
		{
		System.out.println (oddList [j]);
		}
		//Display negative numbers
		System.out.println ("Negative numbers:");
		for(int k = 0; k < negativeList.length; k++)
		{
		System.out.println (negativeList [k]);
		}
	}
}