package yes;

import java.util.Scanner;

public class HAHAHAAA {


	public static void main(String[] args)
	{
		Scanner reader = new Scanner (System.in);
		System.out.println ("Type a number: ");
		double num = reader.nextDouble();
		System.out.println (memLeak(num));
		
	}
	
	public static double memLeak(double n)
	{
		if (n == 0)
			return 1;
		else
			return 15 * memLeak(n - .5);
	}

}