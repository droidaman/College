/*
 * Braden Licastro
 * Pd: 7/8
 * AP Computer Science
 * Project 9.4
 */

package pkg1;

import java.util.Arrays;
import java.util.Scanner;

public class aList {

	public static void main(String[] args)
	{
		Scanner reader = new Scanner(System.in);
		int list[] = new int[10];
		//Get the inputs.
		for (int i=0; i<10; i++)
		{
			System.out.print("Enter an integer: ");
			list[i] = reader.nextInt();
		}
		Method1(list);
	}
	
	private static void Method1(int[] list)
	{
		System.out.println("The list: ");
		Method6(list);
		int specialValue = Method2(list);
		double medianValue = Method5(list);
		System.out.println("\nThe mean Value of the list is " + specialValue);
		System.out.println("\nThe median value of the list is " + medianValue);
	}
	
	private static int Method2(int a[])
	{
		int values[] = new int [a.length];
		int someNumber[] = new int [a.length];
		int uniqueValueCount = 0;
		for(int i:a)
			uniqueValueCount = Method3(i, values, someNumber, uniqueValueCount);
		int positionOfSpecialValue = Method4(someNumber, uniqueValueCount);
		return values[positionOfSpecialValue];
	}
	
	private static int Method3(int value, int values[], int someNumber[], int uVC)
	{
		int probe = 0;
		boolean found = false;
		while(probe <uVC && !found)
			if(values[probe] == value)
			{
				someNumber[probe]++;
				found = true;
			}
			else
				probe++;
		if(!found)
		{
			values[probe] = value;
			someNumber[probe] = 1;
			return uVC + 1;
		}
		else
			return uVC;
	}
	
	private static int Method4(int a[], int count)
	{
		int Position = 0;
		for (int i = 1; i < count; i++)
			if(a[Position]<a[i])
				Position = i;
		return Position;
	}
	
	private static double Method5(int a[])
	{
		Arrays.sort(a);
		double medianValue = (a[4] + a[5]) /2;
		return medianValue;
	}
	
	private static void Method6(int a[])
	{
		for(int i:a)
			System.out.print(i+" ");
	}
}