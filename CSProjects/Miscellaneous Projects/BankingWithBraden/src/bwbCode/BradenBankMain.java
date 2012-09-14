/*Braden Licastro
 * Pd: 7/8
 * Project 10-5
 * AP Computer Science
 */

package bwbCode;

import java.util.Scanner;

public class BradenBankMain {

	public static void main(String[] args) {
		
		//Lets initialize our scanner!
		Scanner reader = new Scanner(System.in);		
		
		//Welcome home!
		System.out.printf ("%38s%n%n","Welcome to Banking With Braden!");
		
		//Start a loop that checks the following:
		//Do they want to change the account they were working on?
		//Is the menu choice they entered a valid one?
		int menuChoice = 0;
		String anotherAccount = "y";
		while (anotherAccount.equalsIgnoreCase("y") && menuChoice < 1 || menuChoice > 4)
		{
			//Where do we want to go captain?? Take us there!
			System.out.println ("Please choose an account from the menu below.");
			System.out.printf("%-5s%-10s%n%-5s%-10s%n%-5s%-10s%n%-5s%-10s%n"," 1.","Checking"," 2.","Savings"," 3.","Credit"," 4.","Exit");
			System.out.print ("Go to account number: ");
			menuChoice = reader.nextInt();
			System.out.print("\n\n");
			
			//Checking Account
			if (menuChoice == 1)
			{
				//Start a loop, they might want to do something else with this account
				String doAgain = "y";
				System.out.printf ("%-40s%n","Welcome to your Braden Banking Checking Account!");
				//Collect an initial balance man!
				System.out.print ("Enter the initial balance for this account: $");
				double startFunds = reader.nextDouble();
				while(doAgain.equalsIgnoreCase("y")){
					//Display the account actions menu
					int menuChoice2 = 0;
					System.out.printf ("%n%s%n%-5s%-20s%n%-5s%-20s%n%-5s%-20s%n","Please choose an action from the list"," 1.","Deposit Funds"," 2.","Withdrawal Funds"," 3.","View Current Balance");
					System.out.print ("Perform action number: ");
					menuChoice2 = reader.nextInt();
					System.out.print ("\n");
					//Initialize a checking account to be used below
					Checking chk = new Checking(startFunds);

					//1. Make a deposit
					if (menuChoice2 == 1)
					{
						//Ask how much and make the deposit
						System.out.printf ("%-35s%-1s","Enter the amount to deposit:","$");
						double depositMoney = reader.nextDouble();
						chk.makeDeposit(depositMoney);
						//Display the updated stats
						System.out.printf ("%-35s%-1s%-8.2f%n%-35s%-1s%-8.2f%n","Your initial balance was:","$",startFunds,"Your new balance is:","$",chk.getBalance());
						startFunds = chk.getBalance();
					}
					//2. Make a withdrawal
					else if (menuChoice2 == 2)
					{
						//Ask how much and make the withdrawal
						System.out.println ("Reminder! $36.00 will be charged for any bounced transactions.");
						System.out.printf("%s%.2f%s%n","There is currently $",startFunds," available.");
						System.out.printf ("%n%-35s%-1s","Enter the amount to withdrawal:","$");
						double withdrawlMoney = reader.nextDouble();
						chk.makeWithdrawal(withdrawlMoney);
						//Display the updated stats.
						System.out.printf ("%-35s%-1s%-8.2f%n%-35s%1s%-8.2f%n","Your initial balance was:","$",startFunds,"Your new balance is:","$",chk.getBalance());
						startFunds = chk.getBalance();
					}
					//3. Check balance
					else if (menuChoice2 == 3)
					{
						//Display the current account balance
						System.out.printf ("%-35s%-1s%-8.2f","Your current balance is:","$",chk.getBalance());
					}
					else
					{
						//Invalid choice, sorry!
						System.out.println("The choice you have entered is not valid.");
					}
					//This is self explanatory. Though if it is I don't know why I had to say it.
					System.out.print("\nWould you like to perform another action with this account? Y/N ");
					doAgain = reader.next();
				}
			}
			//Savings Account
			else if (menuChoice == 2)
			{
				//Start a loop, they might want to do something else with this account
				String doAgain = "y";
				System.out.printf ("%-40s%n","Welcome to your Braden Banking Savings Account!");
				//Collect the initial balance, interest rate, and compilation time, man!
				System.out.print ("Enter the initial balance for this account: $");
				double startFunds = reader.nextDouble();
				System.out.print ("Enter the interest rate percentage for this account: ");
				double interestRate = reader.nextDouble();
				System.out.print ("Enter the interest rate compiling duration for this account (in months): ");
				double compileDuration = reader.nextDouble();
				//Start a loop, they may want to do something else with this account.
				while(doAgain.equalsIgnoreCase("y")){
					//Display the menu for them to blast commands at
					int menuChoice2 = 0;
					System.out.printf ("%n%s%n%-5s%-20s%n%-5s%-20s%n%-5s%-20s%n%-5s%-20s%n","Please choose an action from the list"," 1.","Deposit Funds"," 2.","Withdrawl Funds"," 3.","View Current Balance"," 4.","Calculate Current Yearly Interest and Final Balance");
					System.out.print ("Perform action number: ");
					menuChoice2 = reader.nextInt();
					System.out.print ("\n");
					//Initialize our savings account to be used below
					Saving sav = new Saving(startFunds,interestRate,compileDuration);

					//1. Make a deposit
					if (menuChoice2 == 1)
					{
						//Ask how much and make the deposit.
						System.out.printf ("%-35s%-1s","Enter the amount to deposit:","$");
						double depositMoney = reader.nextDouble();
						sav.makeDeposit(depositMoney);
						//Display the updated stats.
						System.out.printf ("%-35s%-1s%-8.2f%n%-35s%-1s%-8.2f%n","Your initial balance was:","$",startFunds,"Your new balance is:","$",sav.getBalance());
						startFunds = sav.getBalance();
					}
					//2. Make a withdrawl
					else if (menuChoice2 == 2)
					{
						//Ask how much and make the withdrawl.
						System.out.println ("Reminder! $36.00 will be charged for any bounced transactions.");
						System.out.printf("%s%.2f%s%n","There is currently $",startFunds," available.");
						System.out.printf ("%n%-35s%-1s","Enter the amount to withdrawal:","$");
						double withdrawalMoney = reader.nextDouble();
						sav.makeWithdrawal(withdrawalMoney);
						//Display the updated stats.
						System.out.printf ("%-35s%-1s%-8.2f%n%-35s%1s%-8.2f%n","Your initial balance was:","$",startFunds,"Your new balance is:","$",sav.getBalance());
						startFunds = sav.getBalance();
					}
					//3. Display the current balance
					else if (menuChoice2 == 3)
					{
						//Shows the current balance of the account
						System.out.printf ("%-35s%-1s%-8.2f","Your current balance is:","$",sav.getBalance());
					}
					//4. Display yearly balance w/ interest
					else if (menuChoice2 == 4)
					{
						//Gathers the interest earned for the time specified and displays your yearly balance
						System.out.printf ("%-35s%-1s%-8.2f%n%-35s%-1s%-8.2f%n%-35s%-1s%-8.2f%n","Your yearly interest is:","$",sav.getInterest(),"Your current balance is:","$",startFunds,"Your final yearly balance is:","$",sav.getYearlyBalance());
					}
					else
					{//Invalid choice, sorry!
						System.out.println("The choice you have entered is not valid.");
					}
					//Self explanatory, but yet again I'm telling you anyway!
					System.out.print("\nWould you like to perform another action with this account? Y/N ");
					doAgain = reader.next();
				}
			}
			//Credit Account
			else if (menuChoice == 3)
			{
				//Start a loop, they might want to do something else with this account
				String doAgain = "y";
				System.out.printf ("%-40s%n","Welcome to your Braden Banking Credit Account!");
				//Collect the initial balance, APR, and duration of the loan, man!
				System.out.print ("Enter the initial balance for this account: $");
				double startFunds = reader.nextDouble();
				System.out.print ("Enter the annual percentage rate (APR) for this loan: ");
				double interestRate = reader.nextDouble();
				System.out.print ("Enter the duration of this loan in months: ");
				double compileDuration = reader.nextDouble();
				//Start a loop, they may want to do something else with this account.
				while(doAgain.equalsIgnoreCase("y")){
					//Display the darn menu
					int menuChoice2 = 0;
					System.out.printf ("%n%s%n%-5s%-20s%n%-5s%-20s%n%-5s%-20s%n%-5s%-20s%n","Please choose an action from the list"," 1.","Take a Loan"," 2.","Make Loan Payments"," 3.","View Current Loan"," 4.","Calculate Current Yearly Interest and Final Loan Balance");
					System.out.print ("Perform action number: ");
					menuChoice2 = reader.nextInt();
					System.out.print ("\n");
					//Initialize a credit account t obe used below
					Credit cre = new Credit(startFunds,interestRate,compileDuration);

					//1. Take out a loan
					if (menuChoice2 == 1)
					{
						//Ask how much and work the borrowed loan.
						System.out.println ("Reminder! There is a $10,000 credit limit.");
						System.out.printf("%s%.2f%s%n","You have already used $",startFunds," of your credit limit.");
						double borrowMoney, doesItWork;
						//Loop to see if they exceeded the credit limit!
						do {
						System.out.printf ("%n%-40s%-1s","Enter the amount to borrow:","$");
						borrowMoney = reader.nextDouble();
						doesItWork = startFunds + borrowMoney;
						//OOPS! Greedy nincompoops!
						if (doesItWork > 10000)
						{System.out.println("You have exceeded the maximum credit limit of $10,000. Please borrow a lesser amount.");}
						} while(doesItWork > 10000);
						cre.takeLoan(borrowMoney);
						//Display the updated stats.
						System.out.printf ("%-40s%-1s%-8.2f%n%-40s%1s%-8.2f%n","Your initial loan balance was:","$",startFunds,"Your new loan balance is:","$",cre.getBalance());
						startFunds = cre.getBalance();
					}
					//2. Pay off loan
					else if (menuChoice2 == 2)
					{
						//Ask how much to pay back.
						System.out.printf ("%-40s%-1s","Enter the amount to pay back:","$");
						double paymentMoney = reader.nextDouble();
						cre.makePayment(paymentMoney);
						//Display the updated stats.
						System.out.printf ("%-40s%-1s%-8.2f%n%-40s%-1s%-8.2f%n","Your initial loan balance was:","$",startFunds,"Your new loan balance is:","$",cre.getBalance());
						startFunds = cre.getBalance();
					}
					//3. Display current loan
					else if (menuChoice2 == 3)
					{
						//Displays the current amount of the loan, not including interest
						System.out.printf ("%-40s%-1s%-8.2f%n","Your current loan balance is:","$",cre.getBalance());
					}
					//4. Display interest and the loan value for the duration specified
					else if (menuChoice2 == 4)
					{
						//Gathers the interest earned for the time specified and displays your yearly balance
						System.out.printf ("%-40s%-1s%-8.2f%n%-40s%-1s%-8.2f%n%-40s%-1s%-8.2f%n","Your yearly loan interest is:","$",cre.getInterest(),"Your current balance is:","$",startFunds,"Your final yearly loan balance is:","$",cre.getYearlyBalance());
					}
					else
					{//Invalid choice, sorry!
						System.out.println("The choice you have entered is not valid.");
					}
					//I dont need to comment this one, oops! Look at that, silly me
					System.out.print("\nWould you like to perform another action with this account? Y/N ");
					doAgain = reader.next();
				}
			}
			//Exit the program
			else if (menuChoice == 4)
			{
				//Thank them and close, '0' signifies a successful close with no errors
				System.out.print("Thank-you for banking with Braden. Have a nice day!");
				System.exit(0);
			}
			//Invalid choice, sorry!
			else
			{
				System.out.println("The menu choice you have entered is not valid.");
			}
			
			//Try another account?
			menuChoice = 0;
			System.out.print ("Would you like to work with a different account? Y/N ");
			anotherAccount = reader.next();
			System.out.print ("\n\n");
		}
		//Nope, they're done!
		System.out.print("Thank-you for banking with Braden. Have a nice day!");
	}
}
