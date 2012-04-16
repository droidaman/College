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


// Introduced in Chapter 12
import java.util.Map;
import java.util.TreeMap;

/** A bunch of games and their associated attributes. */
public class GameCollection {

  /** A game with this feature takes less than an hour to play. */
  public static final int LESS_THAN_ONE_HOUR = 1 << 10;

  /** A game with this feature takes an hour or two to play. */
  public static final int ONE_TO_TWO_HOURS = 1 << 11;

  /** A game with this feature takes over two hours to play. */
  public static final int OVER_TWO_HOURS = 1 << 12;

  /** A game with this feature is easy to pick up. */
  public static final int LOW_DIFFICULTY = 1 << 13;

  /** A game with this feature is of moderate difficulty. */
  public static final int MEDIUM_DIFFICULTY = 1 << 14;

  /** A game with this feature take considerable study to play. */
  public static final int HIGH_DIFFICULTY = 1 << 15;

  /** A game with this feature involves agility or a steady hand. */
  public static final int DEXTERITY = 1 << 16;

  /** A game with this feature involves talking people into things. */
  public static final int DIPLOMACY = 1 << 17;

  /** A game with this feature involves significant randomness. */
  public static final int LUCK = 1 << 18;

  /** A game with this feature involves careful planning. */
  public static final int STRATEGY = 1 << 19;

  /** Map associating game titles with attribute bit vectors. */
  private Map<String, Integer> games;

  /** A GameCollection is initially empty. */
  public GameCollection() {
    games = new TreeMap<String, Integer>();
  }

  /** Add a new game to this collection. */
  public void addGame(String title, int attributes) {
    games.put(title, attributes);
  }

  /**
   * Print the names of games which have all of the features in the
   * constraints bit vector.
   */
  public void findGames(int constraints) {
    for (Map.Entry<String, Integer> game : games.entrySet()) {
      if ((constraints & game.getValue()) == constraints) {
        System.out.println(game.getKey());
      }
    }
  }

  /**
   * Return a bit vector with a feature for each number of players
   * from minPlayers through maxPlayers.
   */
  public static int playerRange(int minPlayers, int maxPlayers) {
    int result = 0;
    for (int i = minPlayers; i <= maxPlayers; i++) {
      result |= 1 << (i - 1);
    }
    return result;
  }

  /** Create a GameCollection, fill it, and find some for today. */
  public static void main(String[] args) {
    GameCollection collection = new GameCollection();
    collection.addGame("Apples to Apples",
                       playerRange(4, 8) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | DIPLOMACY);
    collection.addGame("Bamboleo",
                       playerRange(2, 7) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | DEXTERITY);
    collection.addGame("Bohnanza",
                       playerRange(3, 7) | LESS_THAN_ONE_HOUR
                       | MEDIUM_DIFFICULTY | DIPLOMACY | LUCK);
    collection.addGame("Carcassonne",
                       playerRange(2, 5) | LESS_THAN_ONE_HOUR
                       | MEDIUM_DIFFICULTY | LUCK | STRATEGY);
    collection.addGame("Cosmic Wimpout",
                       playerRange(2, 10) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | LUCK);
    collection.addGame("Formula De",
                       playerRange(2, 10) | ONE_TO_TWO_HOURS
                       | MEDIUM_DIFFICULTY | LUCK | STRATEGY);
    collection.addGame("Give Me the Brain",
                       playerRange(3, 8) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | LUCK);
    collection.addGame("El Grande",
                       playerRange(2, 5) | ONE_TO_TWO_HOURS
                       | HIGH_DIFFICULTY | STRATEGY);
    collection.addGame("Lord of the Fries",
                       playerRange(3, 8) | LESS_THAN_ONE_HOUR
                       | MEDIUM_DIFFICULTY | LUCK);
    collection.addGame("Pitchcar",
                       playerRange(2, 8) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | DEXTERITY);
    collection.addGame("Puerto Rico",
                       playerRange(3, 5) | ONE_TO_TWO_HOURS
                       | HIGH_DIFFICULTY | STRATEGY);
    collection.addGame("Samurai Swords",
                       playerRange(2, 5) | OVER_TWO_HOURS
                       | HIGH_DIFFICULTY | STRATEGY);
    collection.addGame("Settlers of Catan",
                       playerRange(3, 4) | ONE_TO_TWO_HOURS
                       | MEDIUM_DIFFICULTY | DIPLOMACY | LUCK
                       | STRATEGY);
    collection.addGame("Starmada",
                       playerRange(2, 8) | OVER_TWO_HOURS
                       | HIGH_DIFFICULTY | STRATEGY);
    collection.addGame("Twister",
                       playerRange(2, 4) | LESS_THAN_ONE_HOUR
                       | LOW_DIFFICULTY | DEXTERITY);
    collection.findGames(playerRange(5, 5) | ONE_TO_TWO_HOURS
			            | STRATEGY);
  }

}
