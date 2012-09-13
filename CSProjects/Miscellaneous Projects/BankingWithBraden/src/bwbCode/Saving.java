/*Braden Licastro
 * Pd: 7/8
 * Project 10-5
 * AP Computer Science
 */

package bwbCode;

public class Saving
{
	//Initialize our variables
	public double runningBalance;
	public double interestRate;
	public double duration;
		
	//Construct the account
	public Saving (double startBalance, double startInterestRate, double startDuration)
	{
		runningBalance = startBalance;
		interestRate = startInterestRate;
		duration = startDuration;
	}
	
	//Lets make a deposit
	public void makeDeposit(double depositMoney)
	{
		runningBalance += depositMoney;
	}
	
	//What?! No pocket money?! Lets take some out!
	public void makeWithdrawal (double withdrawalMoney)
	{
		if (withdrawalMoney <= runningBalance)
			runningBalance -= withdrawalMoney;
		else
			runningBalance -= (withdrawalMoney + 36);	
	}
	
	//Lets see what we have in the account 
	public double getBalance()
	{
		return runningBalance;
	}
	
	//What will we gain in interest this year?!
	public double getInterest()
	{
		double interestEarned;
		interestEarned = runningBalance * (interestRate/1200) * duration;
		return interestEarned;
	}
	
	//What is our total for "x" amount of time after interest is calculated?
	public double getYearlyBalance()
	{
		double yearlyBalance;
		yearlyBalance = (runningBalance * (interestRate/1200) * duration) + runningBalance;
		return yearlyBalance;
	}
}