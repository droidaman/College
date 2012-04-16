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
import java.util.Iterator;

/** Hand of cards for the game of Go Fish. */
public class GoFishHand extends ArrayList<Card> {

  /**
   * Remove all Cards of the specified rank and add them to the hand
   * taker.  Return true if at least one Card was given.
   */
  public boolean give(int rank, GoFishHand taker) {
    boolean foundAny = false;
    Iterator<Card> iter = iterator();
    while (iter.hasNext()) {
      Card card = iter.next();
      if (card.getRank() == rank) {
        iter.remove();
        taker.add(card);
        foundAny = true;
      }
    }
    return foundAny;
  }

  /**
   * Remove all sets of four same-rank Cards from this GoFishHand.
   * Return the number of sets.
   */
  public int meldSets() {
    // Count number of Cards of each rank
    int[] rankCount = new int[14]; // Initialized to zeroes
    for (Card c : this) {
      rankCount[c.getRank()] += 1;
    }
    // Remove cards in complete sets
    int cardsRemoved = 0;
    Iterator<Card> iter = iterator();
    while (iter.hasNext()) {
      if (rankCount[iter.next().getRank()] == 4) {
        cardsRemoved += 1;
        iter.remove();
      }
    }
    // Return number of complete sets
    return cardsRemoved / 4;
  }

}
