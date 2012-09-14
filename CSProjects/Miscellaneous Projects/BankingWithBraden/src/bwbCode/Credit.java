/*Braden Licastro
 * Pd: 7/8
 * Project 10-5
 * AP Computer Science
 */

package bwbCode;

public class Credit
{
	//Initialize our variables
	public double runningBalance;
	public double interestRate;
	public double duration;
	
	//Construct the account
	public Credit(double startBalance, double startInterestRate, double startDuration)
	{
		runningBalance = startBalance;
		interestRate = startInterestRate;
		duration = startDuration;
	}
	
	//Lets take a loan out
	public void takeLoan(double borrowMoney)
	{
		runningBalance += borrowMoney;
	}
	
	//Make a payment on a loan
	public void makePayment (double returnMoney)
	{
			runningBalance -= returnMoney;	
	}
	
	//What is the current amount loaned out?
	public double getBalance()
	{
		return runningBalance;
	}
	
	//What will our interest be for "x" amount of time?
	public double getInterest()
	{
		double interestEarned;
		interestEarned = runningBalance * (interestRate/1200) * duration;
		return interestEarned;
	}
	
	//What is our yearly total after compiling interest and all that jazz
	public double getYearlyBalance()
	{
		double yearlyBalance;
		yearlyBalance = (runningBalance * (interestRate/1200) * duration) + runningBalance;
		return yearlyBalance;
	}
}
