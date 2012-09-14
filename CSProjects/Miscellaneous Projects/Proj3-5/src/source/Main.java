package source;
import java.util.Scanner;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		Scanner reader = new Scanner (System.in);
		
		double hrwage, regpay, ovrpay, finalpay;
		int monr, tuer, wedr, thur, frir, satr, sunr,mono, tueo, wedo, thuo, frio, sato, suno;
		
		//Ask for the necessary inputs.
		System.out.print ("Please input your hourly wage:");
		hrwage = reader.nextDouble();
		System.out.print("Please input Mondays regular work hours for the week:");
		monr = reader.nextInt ();
		System.out.print ("Please input Mondays overtime hours for the week:");
		mono = reader.nextInt();
		System.out.print("Please input Tuesdays regular work hours for the week:");
		tuer = reader.nextInt ();
		System.out.print ("Please input Tuesdays overtime hours for the week:");
		tueo = reader.nextInt();
		System.out.print("Please input Wednesdays regular work hours for the week:");
		wedr = reader.nextInt ();
		System.out.print ("Please input Wednesdays overtime hours for the week:");
		wedo = reader.nextInt();
		System.out.print("Please input Thursdays regular work hours for the week:");
		thur = reader.nextInt ();
		System.out.print ("Please input Thursdays overtime hours for the week:");
		thuo = reader.nextInt();
		System.out.print("Please input Fridays regular work hours for the week:");
		frir = reader.nextInt ();
		System.out.print ("Please input Fridays overtime hours for the week:");
		frio = reader.nextInt();
		System.out.print("Please input Saturdays regular work hours for the week:");
		satr = reader.nextInt ();
		System.out.print ("Please input Saturdays overtime hours for the week:");
		sato = reader.nextInt();
		System.out.print("Please input Sundays regular work hours for the week:");
		sunr = reader.nextInt ();
		System.out.print ("Please input Sundays overtime hours for the week:");
		suno = reader.nextInt();
		
		//Do Calculations...
		//Total week work hours
		//Regular time...
		regpay = hrwage * (monr+tuer+wedr+thur+frir+satr+sunr);
		//Over time...
		ovrpay = hrwage * (mono+tueo+wedo+thuo+frio+sato+suno);
		//Total pay!!!
		finalpay = regpay + ovrpay;
		
		//OUTPUT! Ohnoes!! The user has to read plain text!
		System.out.println("\n\nYour total weekly pay is $" + finalpay + "\n Congratulations! You have money, now go buy yourself a Porche!");
	}

}
