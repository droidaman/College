/*
 * Braden Licastro
 * Pd: 7/8
 * AP Computer Science
 * 1/12/2010
 * Project 6-4
 */

package main;

import java.util.Scanner;

public class RoflmaoGrades {
	
	public static void main(String[] args) {
		//INPUT TIME!!!!!!!!!!
		Scanner reader = new Scanner(System.in);
		int grade = 0;
		
		/*Accept first grade
		System.out.println ("Please type the first grade or -1 to exit.");
		grade = reader.nextInt();
		*/
		
		//Keep calculating the grade until they say QUIT IT!
		while (grade != -1)
		{
		//Scream at the user and make them give you the grade!
		System.out.println ("Please input the grade or type -1 to exit!");
		grade = reader.nextInt();
		
		//What is the grade?
		if (grade >= 0 && grade <= 59)
			System.out.println ("The grade is an F...");
		else if (grade >= 60 && grade <= 61)
			System.out.println ("The grade is an D-...");
		else if (grade >= 62 && grade <= 65)
			System.out.println ("The grade is an D...");
		else if (grade >= 66 && grade <= 69)
			System.out.println ("The grade is an D+...");
		else if (grade >= 70 && grade <= 71)
			System.out.println ("The grade is an C-...");
		else if (grade >= 72 && grade <= 75)
			System.out.println ("The grade is an C...");
		else if (grade >= 76 && grade <= 79)
			System.out.println ("The grade is an C+...");
		else if (grade >= 80 && grade <= 81)
			System.out.println ("The grade is an B-...");
		else if (grade >= 82 && grade <= 85)
			System.out.println ("The grade is an B...");
		else if (grade >= 86 && grade <= 89)
			System.out.println ("The grade is an B+...");
		else if (grade >= 90 && grade <= 91)
			System.out.println ("The grade is an A-...");
		else if (grade >= 92 && grade <= 95)
			System.out.println ("The grade is an A...");
		else if (grade >= 96 && grade <= 100)
			System.out.println ("The grade is an A+...");
		//Too small!
		else if (grade < -1)
			System.out.println ("The number you have entered is out of the acceptable range of 0 - 100... \nPlease try again!\n");
		//Too big!
		else if (grade > 100)
			System.out.println ("The number you have entered is out of the acceptable range of 0 - 100... \nPlease try again!\n");

		}
	}

}
