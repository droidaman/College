/*
Braden Licastro
Pd: 7/8
AP Computer Science
*/

package maincode;

import java.util.Scanner;

public class CODE {

	public static void main(String[] args)
	{
		Scanner reader = new Scanner(System.in);
		
		double callCost;
		int callDrtn;
		System.out.println ("Hello! Please tell me how long your phone call was: (minutes)");
		callDrtn = reader.nextInt();
	
		if (callDrtn <= 2.0)
			System.out.println ("You phone call will cost you $1.15");
		else {
			callCost = ((callDrtn - 2) * .50 + 1.15);
			System.out.println ("Your call will cost you $" + callCost);
		}
	}

}
