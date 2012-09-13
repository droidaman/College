package cnSource;

import java.util.*;

public class CasinoNight {

	public static final Scanner READER = new Scanner(System.in);
	public static final Random rand = new Random();
	private int[] gameArray;
	private double cashAvail, netCash;
	private Die die;
	
	public static void main(String[] args) {
		CasinoNight cn = new CasinoNight();
		System.out.println("Welcome to Casino Night!\n\nHow to play:\n1. Place a bet.\n2. Guess two numbers 1-6.\n3. Roll two dice.\n\n   If guesses match numbers rolled - Double your bet.\n   If the sum of numbers guessed equals sum of numbers rolled - Lose your bet.\n   Otherwise keep your bet, no loss no gain.\n\nHow Much money do you have with you?(You will bet with this later)");
		cn.cashAvail = READER.nextDouble();
		cn.play();
		cn.showResult();
	}
	
	public CasinoNight(){
		die = new Die();
		gameArray = new int[5];
		netCash = 0;
	}
	
	public void play(){
		while(true){
			System.out.println("You currently have $" + (cashAvail + netCash) + " available. How much would you like to bet?");
			setBet(READER.nextInt());
			System.out.print("You have bet $" + gameArray[0] + ".\nWhat is your first guess? ");
			gameArray[1] = READER.nextInt();
			System.out.print("\nWhat is your second guess? ");
			gameArray[2] = READER.nextInt();
			System.out.println("Press enter to test your luck and roll the die!");
			READER.nextLine();
			die.roll();
			gameArray[3] = die.getTopFace();
			die.roll();
			gameArray[4] = die.getTopFace();
			System.out.println("You rolled a " + gameArray[3] + " and a " + gameArray[4] + ".");
			if ((gameArray[1] + gameArray[2]) == (gameArray[3] + gameArray[4])){
				if((gameArray[1] == gameArray[3] || gameArray[1] == gameArray[4]) && (gameArray[2] == gameArray[3] || gameArray[2] == gameArray[4])){
					calculateNet(gameArray[0]);
					gameArray[0] += gameArray[0];
					System.out.println("You have doubled your bet and now have $" + gameArray[0] + "!\n");
				}
				else{
					calculateNet(gameArray[0] * -1);
					System.out.println("Sorry, you lost $" + gameArray[0] + ". Better luck next time!\n");
				}
			}
			else{
				System.out.println("You guessed wrong, and the sum of the numbers doesn't match. No Loss or gain.\n");
			}
			System.out.println("Would you like to try agian? y/n");
			String r = READER.nextLine();
			if (r != "y" || r != "Y"){
				break;
			}
		}
	}
	
	public void setBet(int bet){
		gameArray[0] = bet;
	}
	
	public void calculateNet(int amount){
		netCash += amount;
	}
	
	public void showResult(){
		System.out.print("\nThanks for playing Casino Night!\nHere's your stats:\n\nYou started with $" + cashAvail + "\nYou ended with $" + (cashAvail + netCash));
	}

}
