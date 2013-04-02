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


// Introduced in Chapter 4
import java.util.Scanner;

/** The card game War for two players. */
public class War {

  /** For reading from the Console. */
  public static final Scanner INPUT = new Scanner(System.in);
  
  /** Player 1's pile of Cards. */
  private Queue<Card> hand1;

  /** Player 2's pile of Cards. */
  private Queue<Card> hand2;

  /** Deal all the Cards out to the players. */
  public War() {
    hand1 = new ArrayQueue<Card>();
    hand2 = new ArrayQueue<Card>();
    Deck deck = new Deck();
    deck.shuffle();
    while (!(deck.isEmpty())) {
      hand1.add(deck.deal());
      hand2.add(deck.deal());
    }
  }

  /** Give all of the Cards played to the winning player. */
  public void give(Stack<Card> stack1,
                   Stack<Card> stack2,
                   Queue<Card> winner) {
    if (winner == hand1) {
      System.out.println("Player 1 gets the cards");
    } else {
      System.out.println("Player 2 gets the cards");
    }
    while (!(stack1.isEmpty())) {
	  winner.add(stack1.pop());
	}
    while (!(stack2.isEmpty())) {
	  winner.add(stack2.pop());
	}
  }

  /** Play until one player runs out of Cards. */
  public void play() {
    while (!(hand1.isEmpty() || hand2.isEmpty())) {
      System.out.print("\nHit return to play round: ");
      INPUT.nextLine();
      playRound();
      if (hand1.isEmpty()) {
        System.out.println("Player 2 wins!");
      }
      if (hand2.isEmpty()) {
        System.out.println("Player 1 wins!");
      }
    }
  }

  /** Play one round. */
  public void playRound() {
    Stack<Card> stack1 = new ArrayStack<Card>();
    Stack<Card> stack2 = new ArrayStack<Card>();
    stack1.push(hand1.remove());
    stack2.push(hand2.remove());
    do {
      Card card1 = stack1.peek();
      Card card2 = stack2.peek();
      System.out.println(card1 + " " + card2);
      Queue<Card> winner = null;
      if (card1.getRank() > card2.getRank()) {
		winner = hand1;
	  }
      if (card1.getRank() < card2.getRank()) {
		winner = hand2;
      }
      if (winner != null) {
        give(stack1, stack2, winner);
        return;
      }
    } while (!settledByWar(stack1, stack2));
  }

  /**
   * Play a war over stack1 and stack2.  If this ends the game because
   * one player runs out of cards, give the cards to the winning
   * player and return true.  Otherwise, return false.
   */
  public boolean settledByWar(Stack<Card> stack1, Stack<Card> stack2) {
    System.out.println("War!");
    for (int i = 0; i < 4; i++) {
      if (hand1.isEmpty()) {
        give(stack1, stack2, hand2);
        return true;
      }
      stack1.push(hand1.remove());
      if (hand2.isEmpty()) {
        give(stack1, stack2, hand1);
        return true;
      }
      stack2.push(hand2.remove());
    }
    return false;
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to War.");
    War game = new War();
    game.play();
  }
  
}
