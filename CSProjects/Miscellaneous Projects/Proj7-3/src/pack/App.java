//Braden Licastro
//Pd: 7/8
//Project 7-3

package pack;

import java.util.Scanner;

public class App {

private static final double INTEREST_RATE = 0.12;
private static final double PAYMENT_RATE = 	0.05;
private static final double DOWNPAY_RATE = 0.10;

	public static void main(String[] args) {
		Scanner reader = new Scanner (System.in);
		System.out.print("Enter the purchase price: $ ");
		double price = reader.nextDouble();
		if (price <= 0)
			System.out.println ("Price must be >= 0");
		else{
			int month = 1;
			String str = String.format("%5s", "Month") + String.format ("%22s", " Starting Principal")+ String.format ("%20s", " Interest Earned")+ String.format ("%19s", " Ending Principal") + "\n";
		double balance = price - price * DOWNPAY_RATE;
		double monthlyPayment = balance * PAYMENT_RATE;
		while (balance > 0){
			double interest = balance * INTEREST_RATE / 12;
			if (monthlyPayment > balance)
				monthlyPayment = balance;
			double principal = monthlyPayment - interest;
			String line = String.format("%5d", month) + String.format("%22.2f", balance) + String.format("%20.2f", interest) + 
							String.format ("%18.2f", principal) + 
							String.format("%10.2f", monthlyPayment) + 
							String.format ("%18.2f%n", balance - monthlyPayment);
			str += line;
			month++;
			balance = balance - monthlyPayment;
		}
		System.out.println("Payment schedule");
		System.out.println(str);
		}
		}
	}