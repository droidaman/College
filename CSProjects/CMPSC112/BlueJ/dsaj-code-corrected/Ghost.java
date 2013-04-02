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


// Introduced in Chapter 14
import java.util.*;

/** The game of Ghost. */
public class Ghost {

  /** For reading from the console. */
  public static final Scanner INPUT = new Scanner(System.in);

  /** Root of the digital search tree holding the word list. */
  private DigitalNode<Boolean> root;

  /** Read in the words from the file "words.txt". */
  public Ghost() {
    root = new DigitalNode<Boolean>(false);
    try {
      Scanner input = new Scanner(new java.io.File("words.txt"));
      while (input.hasNextLine()) {
        addWord(input.nextLine());
      }
    } catch (java.io.IOException e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

  /** Add word to the digital search tree. */
  public void addWord(String word) {
    DigitalNode<Boolean> node = root;
    for (char c : word.toCharArray()) {
      DigitalNode<Boolean> child = node.getChild(c);
      if (child == null) {
        child = new DigitalNode<Boolean>(false);
        node.setChild(c, child);
      }
      node = child;
    }
    node.setItem(true);
  }

  /** Play one game. */
  public void play() {
    String word = "";
    DigitalNode<Boolean> node = root;
    boolean userTurn = true;
    char letter;
    while ((word.length() < 3) || !(node.getItem())) {
      if (userTurn) {
        System.out.println("The word so far: " + word);
        System.out.print("Your letter? ");
        letter = INPUT.nextLine().charAt(0);
        word += letter;
        if (node.getChild(letter) == null) {
          System.out.println("Sorry, there is no word that starts"
				            + " with " + word + ".");
          System.out.println("You lose.");
          return;
        }
      } else {
        if (node.isLeaf()) {
          System.out.println("I can't think of anything"
				            + " -- you win!");
          return;
        }
        letter = node.randomLetter();
        System.out.println("I choose " + letter + ".");
        word += letter;
      }
      node = node.getChild(letter);
      userTurn = !userTurn;
    }
    System.out.print("That completes the word '" + word + "'.  ");
    if (userTurn) {             // userTurn has been flipped
      System.out.println("You win!");
    } else {
      System.out.println("You lose.");
    }
  }

  /** Create and play the game. */
  public static void main(String[] args) {
    Ghost game = new Ghost();
    System.out.println("Welcome to Ghost.\n");
    game.play();
  }
  
}
