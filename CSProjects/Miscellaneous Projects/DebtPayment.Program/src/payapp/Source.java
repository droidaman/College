// Braden Licastro
// Pd: 7/8
// AP Computer Science
// 10/12/2009

package payapp;

 import java.util.Scanner;

 public class Source {

	public static void main(String[] args) 
	{
		//Declare reader as the scanner.
		Scanner reader = new Scanner (System.in);
		//Define variables.
		double disposableIncome;
		
		//Gather users monthly disposable income.
		System.out.print("Please input your monthly disposable income: $");
		disposableIncome = reader.nextDouble();
		
		//Process the first debt and return a new value for the disposable income.
		disposableIncome = processDebt (disposableIncome);
		
		//Process the second debt and return a new value for the disposable income.
		disposableIncome = processDebt (disposableIncome);
		
		//Process the third debt and return a new value for the disposable income.
		disposableIncome = processDebt (disposableIncome);
		
		//Final amount of disposable income.
		System.out.print ("\nYour disposable income is: $" + disposableIncome);
	}
	
	public static double processDebt(double disposableIncome)
	{
		//Declare the scanner AGAIN!
		Scanner reader = new Scanner (System.in);
		//Declare variables.
		double interestRate, debtBalance, finalBalance, principalPaid, interestPaid, minimumPayment, paymentAmount;
		String debtName;
		
		//OUTPUT TIME!! OUTPUT TIME!! OUTPUT TIME!! COLLECTION TIME!!
		System.out.println ("\n\nENTERING A SINGLE DEBT\n");
		System.out.println ("----------------------------");
		System.out.print ("Enter a name for this debt: ");
		debtName = reader.next();
		
		//Debt balance  interest rate minimum payment collection time!
		System.out.print("Please input your debt balance: $");
		debtBalance = reader.nextDouble();
		System.out.print("Please input your interest rate: ");
		interestRate = reader.nextDouble();
		System.out.print("Please input your minimum payment: $");
		minimumPayment = reader.nextDouble();
		
		//Calculate amount of disposable income
		paymentAmount = disposableIncome;
		
		//Interest to be added each month,
		//also the amount to be paid each month.
		interestPaid = (interestRate/12) * debtBalance;
		
		//Principal to be paid each month
		principalPaid = paymentAmount - interestPaid;

		//Calculate the final debt balance at the end of the month
		finalBalance = debtBalance + interestPaid - paymentAmount;

		//Display the output to the user now.
		System.out.println ("\n\nDebt name: " + debtName);
		
		//Output the following calculated numbers to the user:
		//paymentAmount, finalBalance, principalPaid, and interestPaid
		System.out.print ("\nYour payment amount for the month is $" + paymentAmount);
		System.out.print ("\nYour final debt balance is $" + finalBalance);
		System.out.print("\nYour principal paid is $" + principalPaid);
		System.out.print("\nYou paid $" + interestPaid + " in interest.");
		System.out.println ("\nHave fun getting out of debt!");

		//Return the amount of disposable income to the program for more calculations.
		return disposableIncome - minimumPayment;
		
		
	}

}