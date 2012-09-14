//Braden Licastro
//Pd: 7/8
//Project 7-3

package pack;

import java.util.Scanner;

public class YeahMan {
	
	private static final double interest = .10;
	
	public static void main(String[] args) {
		//Accept inputs for program
		Scanner reader = new Scanner (System.in);
		
		//What is the investment amount?
		System.out.print("Please enter the amount to invest: $");
		double investment = reader.nextDouble();
		
		//Duration to calculate?
		System.out.print ("How long should we stay in the fund? (Years) ");
		double duration = reader.nextDouble();
		
		//Investment must be more than $0.00
		if (investment <= 0)
			//...or we better throw an exception...
			System.out.println ("You must invest more than $0.00");
		//...which it is greater than $0.00
		else{
		//What should our columns look like?
		String columnInfo = String.format("%5s", "Year") + String.format ("%22s", " Starting Principal")+ String.format ("%20s", " Interest Earned")+ String.format ("%19s", " Ending Principal") + "\n";	
			//Its the first month!
			int year = 1;
		//Are we done investing? (year limit reached?)
		while (year <= duration)
		{
			//Lets calculate!
			double interestEarned = (investment * (1 + interest / 400)) - investment;
			double finalPrincipal = (investment * .25) + investment;
			String data = String.format("%5d", year) + String.format("%22.2f", investment) + String.format("%20.2f", interestEarned) + String.format ("%19.2f", finalPrincipal) + "\n";
			columnInfo += data;
			year++;
			investment = interestEarned + finalPrincipal;
		}
		System.out.println("Interest Chart");
		System.out.println(columnInfo);
	}
	}
}
