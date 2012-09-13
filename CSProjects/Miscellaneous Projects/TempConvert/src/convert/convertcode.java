package convert;

// Example 2.2: inputs degrees Farenheit 
//from the keyboard and outputs degrees celsius

import java.util.Scanner;

public class convertcode {
	
	public static void main (String [] args){
		
	//Set up the program to accept user input
	Scanner reader = new Scanner (System.in);
	
	//Define variables
	double farenheit;
	double celsius;
	
	//Accept the input from the user
	System.out.print ("Enter degrees farenheit: ");
	farenheit = reader.nextDouble();
	
	//Calculate the celsius value
	celsius = (farenheit-32.0)*5.0/9.0;
	
	//Output the results of the program
	System.out.print("The equivelant in celsius is ");
	System.out.println(celsius);
	}
}
