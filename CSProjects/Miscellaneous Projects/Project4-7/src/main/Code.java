/*
Braden Licastro
Pd: 7/8
AP Computer Science
 */

package main;

import java.util.Scanner;


public class Code {

	public static void main(String[] args) {
		Scanner reader = new Scanner(System.in);

		int PosPower;
		double powerAnswer;

		System.out.println ("Please input a positive integer or type -1 to terminate the application.");
		PosPower = reader.nextInt();
		
		while(PosPower != -1)
		{
		powerAnswer = Math.pow(2, PosPower);
		System.out.println ("2 to the " + PosPower + " power is: " + powerAnswer + "\n");
		System.out.println("Please input another positive integer or type -1 to quit.");
		PosPower = reader.nextInt();
		}
	}

}
