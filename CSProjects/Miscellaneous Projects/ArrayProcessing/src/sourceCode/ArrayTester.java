package sourceCode;

import java.util.*;

public class ArrayTester {
	
	public static final Scanner READER = new Scanner(System.in);
	
	public static void main(String[] args) {
		System.out.print("What size would you like the array to be?");
		int arraySize = READER.nextInt();
		
		int[] tempArray = new int[arraySize];
		
		for(int i = 0; i < tempArray.length; i++){
			System.out.print("Enter number: " );
			tempArray[i] = READER.nextInt();
		}
		
		IntArray inta = new IntArray(tempArray);
		
		System.out.println(inta.toString());
		
		System.out.print("What index would you like to get a value from? ");
		int index = READER.nextInt();
		System.out.println("The value at index " + index + " is " + inta.getElement(index));

	}

}
