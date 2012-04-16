package beetlegame;

//Import our utilities for use *cough* scanner *cough*
import java.util.*;

/* The game of beetle for 2 players. */
public class BeetleGame {

	/* For reading from the console. */
	public static final Scanner INPUT = new Scanner(System.in);
	
	/* Player 1s beetle. */
	private Beetle bug1;
	
	/* Player 2s beetle. */
	private Beetle bug2;
	
	/* A Die. */
	private Die die;
	
	/* Create and play the game */
	public static void main(String[] args) {
		System.out.println("Welcome to the Beetle.");
		BeetleGame game = new BeetleGame();
		game.play();
	}
	
	/* Create a die and the beetles. */
	public BeetleGame(){
		bug1 = new Beetle();
		bug2 = new Beetle();
		die = new Die();
	}
	
	/* Play until someone wins. */
	public void play(){
		int player = 1;
		Beetle bug = bug1;
		while(!(bug.isComplete())){
			if(!(takeTurn(player, bug))){
				if(player == 1){
					player = 2;
					bug = bug2;
				} else {
					player = 1;
					bug = bug1;
				}
			}
		}
		System.out.println("\nPlayer " + player + " wins!");
		System.out.println(bug);
	}
	
	/* Take a turn for the current player. Return true if the player earned a bonus turn. */
	public boolean takeTurn(int player, Beetle bug){
		System.out.println("\nPlayer " + player + ", your beetle:");
		System.out.println(bug);
		System.out.print("Hit return to roll: ");
		INPUT.nextLine();
		die.roll();
		System.out.print("You rolled a " + die.getTopFace());
		switch (die.getTopFace()){
			case 1:
				System.out.println(" (body) ");
				return bug.addBody();
			case 2:
				System.out.println(" (head) ");
				return bug.addHead();
			case 3:
				System.out.println(" (leg) ");
				return bug.addLeg();
			case 4:
				System.out.println(" (eye) ");
				return bug.addEye();
			case 5:
				System.out.println(" (feeler) ");
				return bug.addFeeler();
			default:
				System.out.println(" (tail) ");
				return bug.addTail();
		}
	}
}