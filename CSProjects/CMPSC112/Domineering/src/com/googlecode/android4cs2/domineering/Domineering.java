package com.googlecode.android4cs2.domineering;

/** The game of Domineering */
public class Domineering {

	/**Array of board squares, true if occupied */
	private boolean[][] squares;
	
	/**This is the constructor, it sets the boards initial size to 8x8, the whole array is empty though. */
	public Domineering() {
	squares = new boolean[8][8];
		// Java initializes all array elements to false
	}
	
	/**Prints out a welcome message for the user to see, creates a new instance of the game, and it calls the play method to enter the game and begin playing. */
	public static void main(String[] args) {
		System.out.println("Welcome to Domineering.");
		Domineering game = new Domineering();
		game.play();
	}
	
	/** Makes a visual representation of the board and prints it to the screen so the user knows what is going on */
	public String toString() {
		String result = "  0 1 2 3 4 5 6 7";
		for (int row = 0; row < 8; row ++) {
			result += "\n" + row;
			for (int column = 0; column < 8; column++) {
				if (squares[row][column]) {
					result += " #";
				} else {
					result += " .";
				}
			}
		}
		return result;
	}
	
	/** Reading from the console */
	public static final java.util.Scanner READER = new java.util.Scanner(System.in);
	
	/**The player who plays horizontally. */
	public static final boolean HORIZONTAL = false;
	
	/**The player who plays vertically. */
	public static final boolean VERTICAL = false;
	
	/** Play the game by telling them whose turn, if there is a legal move or not, accept the input, and make the move. */
	public void play() {
		boolean player = HORIZONTAL;
		while (true) {
			System.out.println("\n" + this);
			if (player == HORIZONTAL) {
				System.out.println("Horizontal to play");
			} else {
				System.out.println("Vertical to play");
			}
			if (!(hasLegalMoveFor(player))) {
				System.out.println("No legal moves -- you lose!");
				return;
			}
			System.out.println("Row: ");
			int row = READER.nextInt();
			System.out.println("Column: ");
			int column = READER.nextInt();
			playAt(row, column, player);
			player = !player;
		}
	}
	
	/**
	 * Moves to the intersection of the user defined row or column and places a "domino"
	 */
	public void playAt(int row, int column, boolean player) {
		squares[row][column] = true;
		if (player == HORIZONTAL) {
				squares[row][column + 1] = true;
		} else {
			squares[row + 1][column] = true;
		}
	}
	
	/**
	 * Checks to see if there is a valid move for the given player, either vertical or horizontal
	 */
	public boolean hasLegalMoveFor(boolean player) {
		int rowOffset = 0;
		int columnOffset = 0;
		if (player == HORIZONTAL) {
			columnOffset = 1;
		} else {
			rowOffset = 1;
		}
		for (int row = 0; row < (8 - rowOffset); row++) {
			for (int column = 0; column < (8 - columnOffset); column++) {
				if (!(squares[row][column] || squares[row + rowOffset][column + columnOffset])) {
					return true;
				}
			}
		}
		return false;
	}
	public boolean getPlayer(){
		if 
	}
}