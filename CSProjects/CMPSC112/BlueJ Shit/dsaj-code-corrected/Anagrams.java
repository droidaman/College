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


// Introduced in Chapter 11
import java.util.Scanner;

/** The game of Anagrams. */
public class Anagrams {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);

  /** Letters in the bag. */
  private LetterCollection bag;

  /** Letters in the pool. */
  private LetterCollection pool;

  /** Large set of legal words. */
  private Set<String> words;

  /** Words scored by player 1. */
  private Set<String> words1;

  /** Words scored by player 2. */
  private Set<String> words2;

  /**
   * Read in the dictionary from the file "anagram-words" and create
   * the letters.
   */
  public Anagrams() {
    bag = new LetterCollection(true);
    pool = new LetterCollection(false);
    words = new HashTable<String>("");
    try {
      Scanner input = new Scanner(new java.io.File("words.txt"));
      while (input.hasNextLine()) {
        words.add(input.nextLine());
      }
    } catch (java.io.IOException e) {
      e.printStackTrace();
      System.exit(1);
    }
    words1 = new OrderedList<String>();
    words2 = new OrderedList<String>();
  }

  /** Play until someone gets five words. */
  public void play() {
    while (true) {
      System.out.println("PLAYER 1 TO PLAY");
      playTurn(words1, words2);
      if (words1.size() == 5) {
        System.out.println("Player 1 wins!");
        return;
      }
      System.out.println("PLAYER 2 TO PLAY");
      playTurn(words2, words1);
      if (words2.size() == 5) {
        System.out.println("Player 2 wins!");
        return;
      }
    }
  }

  /** Play one turn for the specified player. */
  public void playTurn(Set<String> player, Set<String> opponent) {
    pool.add(bag.draw());
    System.out.println("Letters in pool:\n" + pool);
    System.out.println("Player 1's words: " + words1);
    System.out.println("Player 2's words: " + words2);
    System.out.print("Your play: ");
    String play = INPUT.nextLine();
    int spaceIndex = play.indexOf(' ');
    if (spaceIndex != -1) {     // Stolen word
      String word = play.substring(0, spaceIndex);
      if (!(words.contains(word))) {
        System.out.println("Sorry, " + word + " is not a word.");
      } else {
        String stolen = play.substring(spaceIndex + 1, play.length());
        player.add(word);
        opponent.remove(stolen);
        pool.add(stolen);
        pool.remove(word);
      }
    } else if (!(play.equals(""))) { // Regular play
      if (!(words.contains(play))) {
        System.out.println("Sorry, " + play + " is not a word.");
      } else {
        player.add(play);
        pool.remove(play);
      }
    }
    System.out.println();
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    Anagrams game = new Anagrams();
    System.out.println("Welcome to Anagrams.");
    System.out.println();
    System.out.println("To make a word from the pool, enter it.");
    System.out.println("To steal a word, enter the new word, a"
                       + " space, and the word being stolen.");
    System.out.println("To pass, just hit return.");
    System.out.println();
    game.play();
  }
  
}
