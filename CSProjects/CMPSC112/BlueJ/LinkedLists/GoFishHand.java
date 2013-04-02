/**
 * Write a description of class GoFish here.
 * 
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110305)
 */

import java.util.Iterator;

/** Hand of cards for the game of Go Fish. */
public class GoFishHand extends LinkedList<Card>{

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