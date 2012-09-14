package yeah;

import java.util.Random;
import java.util.Scanner;

public class ThisIsAClass {

	public static void main(String[] args) {
		
		int randnum = 1, number;
		
		//Initialize the reader.
		Scanner reader = new Scanner (System.in);
		System.out.println("What is the range of the random numbers???");
		randnum = reader.nextInt();
		//Generate our random numbers!
		Random numGen = new Random ();
		number = numGen.nextInt(randnum);
		//Add 1 to the generated number so it starts at 1 and ends at 100.
		number++;
		//Output
		System.out.println("The random number is " + number);
		}

	}
