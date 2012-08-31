/**
 * Animal -- objects are animals in a zoo.
 *
 * Written for use with the "Queue1" program to demonstrate use of
 * LinkedLists as queues.
 *
 * @author	Bob Roos
 * @version	30 August 2012
 */

public class Animal {
  private String species; // e.g., "lion", "elephant", "penguin", etc.
  private String name;

  /**
   * Construct an animal of a given species with a given name.
   *
   * @param	sp	the animal's species
   * @param	n	the animal's name
   */
  public Animal(String sp, String n) {
    species = sp;
    name = n;
  }

  /**
   * Return the species of this Animal
   * @return	string containing the species
   */
  public String getSpecies() { return species; }

  /**
   * Return the name of this Animal
   * @return	string containing the name
   */
  public String getName() { return name; }
}
