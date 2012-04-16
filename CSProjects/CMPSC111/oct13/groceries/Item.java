/**
 * An item to be placed in a grocery bag.
 *
 * @author   Bob Roos
 * @version  13 October 2010
 */
public class Item
{
  private String name; // name of the item
  private int pounds;  // weight of the item: pounds component
  private int ounces;  // weight of the itee; ounces component
  private int cost;    // price of the item

  /**
   * Constructor -- create a new item with given name, weight, and cost.
   */
  public Item(String n, int p, int o, int c)
  {
    name = n;
    pounds = p;
    ounces = o;
    cost = c;

    // Make sure ounces is less than 16; if not, adjust values:
    if (ounces >= 16) {
       pounds += ounces / 16;   // ex: if ounces = 40, add 2 to pounds
       ounces = ounces % 16;    // ex: if ounces = 40, change to 8
    }
  }

  /**
   * Return the name of the item. (Accessor method)
   *
   * @return the item's name
   */
   public String getName()
   {
     return name;
   }


  /**
   * Return the number of pounds. (Accessor method)
   *
   * @return the "pounds" component of the weight
   */
   public int getPounds()
   {
     return pounds;
   }


  /**
   * Return the number of ounces. (Accessor method)
   *
   * @return the "ounces" component of the weight
   */
   public int getOunces()
   {
     return ounces;
   }


  /**
   * Return the cost. (Accessor method)
   *
   * @return the cost of the item
   */
   public int getCost()
   {
     return cost;
   }

   /**
    * Prints a description of the item.
    */
   public void display()
   {
     System.out.println(name + ": " + pounds + " lbs. " + ounces
         + " oz.; price = " + cost);
   }
}
