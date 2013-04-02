// Disclaimer: The program code is made available under the
// following copyright notice: Copyright 2006, by Pearson
// Education, Inc. by Drake; all rights reserved. Permission
// is granted for use in non-commercial applications provided
// this copyright notice remains intact and unchanged. The
// author and publisher make no warranty of any kind, expressed
// or implied, with regard to these programs. The author and
// publisher shall not be liable in any event for incidental or
// consequential damages in connection with, or arising out of
// the furnishing, performance of use of this program code.


// Introduced in Chapter 5
import java.util.Scanner;

/** The game of Go Fish. */
public class GoFish {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);
  
  /** The computer's hand of Cards. */
  private GoFishHand computerHand;

  /** Number of sets of four the computer has laid down. */
  private int computerScore;

  /** The Deck. */
  private Deck deck;

  /** The player's hand of Cards. */
  private GoFishHand playerHand;

  /** Number of sets of four the player has laid down. */
  private int playerScore;

  /** Shuffle the Deck and deal seven Cards to each player. */
  public GoFish() {
    computerScore = 0;
    playerScore = 0;
    deck = new Deck();
    deck.shuffle();
    computerHand = new GoFishHand();
    playerHand = new GoFishHand();
    for (int i = 0; i < 7; i++) {
      playerHand.add(deck.deal());
      computerHand.add(deck.deal());
    }
  }

  /**
   * Take a turn for the computer.  Return true if the computer has
   * earned a bonus turn.
   */
  public boolean computerTurn() {
    if (computerHand.isEmpty() && !(deck.isEmpty())) {
      computerHand.add(deck.deal());
    }
    System.out.println("\n" + this);
    int rank = ((int)(Math.random() * 13)) + 1;
    char rankCharacter = new Card(rank, Card.HEARTS).toString().charAt(0);
    System.out.println("The computer asks for " + rankCharacter);
    boolean bonusTurn = playerHand.give(rank, computerHand);
    if (!bonusTurn) {
      System.out.println("Go fish");
      Card card = deck.deal();
      computerHand.add(card);
      if (card.getRank() == rank) { bonusTurn = true; }
    }
    int sets = computerHand.meldSets();
    computerScore += sets;
    if (sets > 0) {
      System.out.println("The computer lays down " + sets
                        + " sets, bringing its total to "
                        + computerScore);
    }
    return bonusTurn;
  }

  /** Play until either the player or the computer wins. */
  public void play() {
    while (playerScore + computerScore < 13) {
      while ((playerScore + computerScore < 13) && (playerTurn())) {
      }
      while ((playerScore + computerScore < 13) && (computerTurn())) {
      }
    }
    System.out.println("The computer made " + computerScore + " sets");
    System.out.println("You made " + playerScore + " sets");
    if (playerScore > computerScore) {
      System.out.println("You win!");
    } else {
      System.out.println("The computer wins");
    }
  }

  /**
   * Take a turn for the player.  Return true if the player has earned
   * a bonus turn.
   */
  public boolean playerTurn() {
    if (playerHand.isEmpty() && !(deck.isEmpty())) {
      playerHand.add(deck.deal());
    }
    System.out.println("\n" + this);
    System.out.print("Which card will you ask for? ");
    char cardName = INPUT.nextLine().toUpperCase().charAt(0);
    int rank;
    if (cardName == 'A') {
      rank = Card.ACE;
    } else if (cardName == 'T') {
      rank = 10;
    } else if (cardName == 'J') {
      rank = Card.JACK;
    } else if (cardName == 'Q') {
      rank = Card.QUEEN;
    } else if (cardName == 'K') {
      rank = Card.KING;
    } else {
      rank = cardName - '0';
    }
    boolean bonusTurn = computerHand.give(rank, playerHand);
    if (!bonusTurn) {
      System.out.println("Go fish");
      Card card = deck.deal();
      System.out.println("You draw: " + card);
      playerHand.add(card);
      if (card.getRank() == rank) { bonusTurn = true; }
    }
    int sets = playerHand.meldSets();
    playerScore += sets;
    if (sets > 0) {
      System.out.println("You lay down " + sets
                        + " sets, bringing your total to "
                        + playerScore);
    }
    return bonusTurn;
  }

  public String toString() {
    String result = "There are " + deck.size() + " cards in the deck\n";
    result += "The computer has " + computerHand.size() + " cards\n";
    return result + "Your hand: " + playerHand;
  }
  
  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Go Fish.");
    GoFish game = new GoFish();
    game.play();
  }

}
