/*Braden Licastro
 * Pd: 7/8
 * Project 10-5
 * AP Computer Science
 */

package bwbCode;

public class Checking
{
	//Initialize our variables
	public double runningBalance;
	
	//Construct the account
	public Checking(double startBalance)
	{
		runningBalance = startBalance;
	}
	
	//Lets make a deposit
	public void makeDeposit(double depositMoney)
	{
		runningBalance += depositMoney;
	}
	
	//We need to use our money, take some out
	public void makeWithdrawal (double withdrawalMoney)
	{
		if (withdrawalMoney <= runningBalance)
			runningBalance -= withdrawalMoney;
		else
			runningBalance -= (withdrawalMoney + 36);
	}
	
	//What is our current account balance?
	public double getBalance()
	{
		return runningBalance;
	}
}
