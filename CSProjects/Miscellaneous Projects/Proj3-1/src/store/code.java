// Braden Licastro
// Pd: 7/8
// Assignment 3.2

package store;

import java.util.Scanner;

public class code {
	
	public static void main(String[] args) {

		//Set up the program to accept user input
		Scanner reader = new Scanner (System.in);
		
		//Define variables.
		double radius;
		double diam;
		double circum;
		double surfarea;
		double volume;
			
		//Input accepter...
		System.out.println ("What is the radius of the circle?");
		radius = reader.nextDouble();
		
		//Calculate
		diam = radius*2;
		circum = 3.14*diam;
		surfarea = (4*(3.14*radius))*(4*(3.14*radius));
		volume = ((4/3)*(3.14*radius))*((4/3)*(3.14*radius))*((4/3)*(3.14*radius));		

		//Output
		System.out.println ("The circles diameter is " + diam + " units."); 
		System.out.println ("The circles circumference is " + circum + " units.");
		System.out.println ("The circles surface area is " + surfarea + " units.");
		System.out.println ("The circles volume is " + volume + " units squared.");
		
	}

}
