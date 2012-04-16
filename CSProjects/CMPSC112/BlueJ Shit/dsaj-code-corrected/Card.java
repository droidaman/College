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
/** A playing card. */
public class Card {

  /** Suit of spades. */
  public static final int SPADES = 0;

  /** Suit of hearts. */
  public static final int HEARTS = 1;

  /** Suit of diamonds. */
  public static final int DIAMONDS = 2;

  /** Suit of clubs. */
  public static final int CLUBS = 3;

  /** Rank of ace, equivalent to 1. */
  public static final int ACE = 1;

  /** Rank of jack. */
  public static final int JACK = 11;

  /** Rank of queen. */
  public static final int QUEEN = 12;

  /** Rank of king. */
  public static final int KING = 13;

  /** Number or face on this Card. */
  private int rank;

  /** Suit of this Card. */
  private int suit;

  /** Initialize the rank and suit. */
  public Card(int rank, int suit) {
    this.rank = rank;
    this.suit = suit;
  }

  /**
   * Return true if and only if that Card has the same rank as
   * this one.  Suit is ignored.
   */
  public boolean equals(Object that) {
    if (this == that) {
      return true;
    }
    if (that == null) {
      return false;
    }
    if (getClass() != that.getClass()) {
      return false;
    }
    Card thatCard = (Card)that;
    return rank == thatCard.rank;
  }
  
  /** Return the rank of this Card. */
  public int getRank() {
    return rank;
  }

  /** Return the suit of this Card. */
  public int getSuit() {
    return suit;
  }

  public String toString() {
    return "" + "-A23456789TJQK".charAt(rank) + "shdc".charAt(suit);
  }
  
}
