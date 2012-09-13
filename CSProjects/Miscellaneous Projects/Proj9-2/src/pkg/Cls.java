/*Braden Licastro
 * Pd: 7/8
 * AP Computer Science
 * Project 9-2
 */

package pkg;

import java.util.Scanner;

public class Cls {

	public static void main(String[] args) {
		//Arrays, variables and reader
		double [] averageList = new double [10];
		double temp = 0, average = 0;
		int averagePosition = 0;
		Scanner reader = new Scanner (System.in);
		
		//Ask for 10 inputs
		for (int i = 0; i < 10; i++)
		{
			//Ask for and accept integer
			System.out.print ("\nPlease enter an floating point number... ");
			temp = reader.nextDouble();
			averageList[averagePosition] = temp;
			averagePosition ++;
		}
		//Display and calculate the average.
		System.out.print ("\n\nThe average of the numbers entered is: ");
		for(int y = 0; y < averageList.length; y++)
		{
		average += averageList [y];
		}
		average = average / averageList.length;
		System.out.print (average);
		
		//Display odd numbers
		System.out.print ("\n\nNumbers greater than the average: ");
		for(int j = 0; j < averageList.length; j++)
		{
			if (averageList[j] > average)
			{
				System.out.print(averageList[j] + " ");
			}
		}
	}
}