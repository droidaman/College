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

/** The solitaire card game Idiot's Delight. */
public class IdiotsDelight {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);
  
  /** The four stacks of Cards. */
  private Stack<Card>[] stacks;

  /** The Deck of Cards. */
  private Deck deck;

  /** Create and shuffle the Deck.  Deal one Card to each Stack. */
  public IdiotsDelight() {
    deck = new Deck();
    deck.shuffle();
    stacks = new Stack[4]; // This causes a compiler warning
    for (int i = 0; i < 4; i++) {
      stacks[i] = new ArrayStack<Card>();
    }
    try {
      deal();
    } catch (IllegalMoveException e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

  /**
   * Deal one Card from the Deck onto each Stack.
   * @throws IllegalMoveException if the Deck is empty.
   */
  public void deal() throws IllegalMoveException {
    if (deck.isEmpty()) {
      throw new IllegalMoveException();
    }
    for (Stack<Card> s : stacks) {
      s.push(deck.deal());
    }
  }
  
  /** Play the game. */
  public void play() {
    while (true) {
      try {
        // Print game state
        System.out.println("\n" + this);
        // Check for victory
        boolean done = true;
        for (Stack<Card> s : stacks) {
          if (!(s.isEmpty())) {
            done = false;
            break;
          }
        }
        if (done) {
          System.out.println("You win!");
          return;
        }
        // Get command
        System.out.print("Your command (pair, suit, deal, or quit)? ");
        String command = INPUT.nextLine();
        // Handle command
        if (command.equals("pair")) {
          removePair();
        } else if (command.equals("suit")) {
          removeLowCard();
        } else if (command.equals("deal")) {
          deal();
        } else {
          return;
        }
      } catch (IllegalMoveException e) {
        System.out.println("I'm sorry, that's not a legal move.");
      }
    }
  }

  /**
   * Remove the lower of two Cards of the same suit, as specified by
   * the user.
   * @throws IllegalMoveException if the low card is not of the same
   * suit as, and of lower rank than, the high card.
   */
  public void removeLowCard() throws IllegalMoveException {
    System.out.print("Location (1-4) of low card? ");
    int i = INPUT.nextInt();
    System.out.print("Location (1-4) of high card? ");
    int j = INPUT.nextInt();
    INPUT.nextLine();         // To clear out input
    Card lowCard = stacks[i - 1].peek();
    Card highCard = stacks[j - 1].peek();
    if ((lowCard.getSuit() != highCard.getSuit())
        || ( lowCard.getRank() > highCard.getRank())) {
      throw new IllegalMoveException();
    }
    stacks[i - 1].pop();
  }

  /**
   * Remove two Cards of the same rank, as specified by the user.
   * @throws IllegalMoveException if the cards are not of the same
   * rank.
   */
  public void removePair() throws IllegalMoveException {
    System.out.print("Location (1-4) of first card? ");
    int i = INPUT.nextInt();
    System.out.print("Location (1-4) of second card? ");
    int j = INPUT.nextInt();
    INPUT.nextLine();         // To clear out input
    Card card1 = stacks[i - 1].peek();
    Card card2 = stacks[j - 1].peek();
    if (!(card1.equals(card2))) {
      throw new IllegalMoveException();
    }
    stacks[i - 1].pop();
    stacks[j - 1].pop();
  }

  public String toString() {
    String result = "";
    for (int i = 0; i < 4; i++) {
      if (stacks[i].isEmpty()) {
        result += "-- ";
      } else {
        result += stacks[i].peek() + " ";
      }
    }
    return result + "\n" + deck.size() + " cards left in the deck";
  }
  
  /** Create and play the game. */
  public static void main(String[] args) {
    System.out.println("Welcome to Idiot's Delight.");
    IdiotsDelight game = new IdiotsDelight();
    game.play();
  }
  
}
