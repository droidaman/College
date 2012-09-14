// Braden Licastro
// Pd: 7/8
// Assignment 3.3

package mmtfiles;

import java.util.Scanner;

public class mmtcalcsource {

	public static void main(String[] args) 
	{
		//Set up the program to accept user input
		Scanner reader = new Scanner (System.in);
		
		//Define Variable(s)
		int momentum;
		int kenergy;
		int mass;
		int velocity;
		
		//Tell the user to input mass and velocity.
		System.out.println ("What is the objects mass in kilos?");
		mass = reader.nextInt();
		System.out.println ("What is the objects velocity in m/s?");
		velocity=reader.nextInt();
		
		//Calculate Momentum
		kenergy = (1/2)*mass*velocity^2;
		momentum = mass*velocity;
		
		//Print the momentum after calculations
		System.out.print ("The momentum of your object is ");
		System.out.println (momentum);
		System.out.print ("The kinetic energy of your object is ");
		System.out.print (kenergy);
		System.out.println (" kg*m/s");
		System.out.println ("Thank you for using the Kiment-ulator!!!");
	}
}
