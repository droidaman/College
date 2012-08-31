import java.util.*;

/**
 * Queue1 -- use built-in LinkedList class to create a queue of
 * "Animal" objects and test the "addLast", "removeFirst", and
 * "isEmpty" methods of the LinkedList class.
 *
 * Input: none
 * Output: Results of removing values from the queue; some removed
 *   objects are placed back at the end of the queue (the decision
 *   is made randomly)
 *
 * Usage:
 *       java Queue1
 *
 * @author	Bob Roos
 * @version	30 August 2012
 */
public class Queue1 {
  public static void main(String[] args) {
    LinkedList<Animal> queue = new LinkedList<Animal>(); // a queue

    // Fill the queue:
    queue.addLast(new Animal("elephant","Dumbo"));
    queue.addLast(new Animal("lion","Leo"));
    queue.addLast(new Animal("penguin","Pengo"));
    queue.addLast(new Animal("Komodo dragon","Kevin"));
    queue.addLast(new Animal("Tasmanian devil","Terri"));
    queue.addLast(new Animal("newt","Newt"));

    // Print statement explains what's going on:

    System.out.println("Feeding time at the zoo. The animals line up "
                     + "for food, but some of them\nsneak back to "
                     + "the end of the line after they're fed.\n");

    while (! queue.isEmpty()) {
      Animal a = queue.removeFirst(); // Feed first animal in line
      System.out.println("Feeding " + a.getName() 
                          + " the " + a.getSpecies());
      double r = Math.random();
      if (r < .65) // 65% of the time, an animal gets back in line
      queue.addLast(a);
    }
  }
}
