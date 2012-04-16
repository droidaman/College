import java.util.ArrayList;
/**
 * Simulates a grocery bag. The bag can hold any number of
 * items.
 *
 * @author Braden Licastro
 * @version 20 October 2010
 */
public class Bag
{
    private ArrayList<Item> contents; // the list of items in the bag
    private int pounds;   // total weight of all items: pounds component
    private int ounces;   // total weight of all items: ounces component
    private int total;    // total cost of items in bag
    private int count;    // number of items currently in bag

    /**
     * Constructor -- an initially empty bag
     */
    public Bag() {
        contents = new ArrayList<Item>();
        pounds = 0;
        ounces = 0;
        total = 0;
        count = 0;
    }

    /**
     * Add a new item to the bag. (Mutator method)
     *
     * @param item the Item to be added
     */
    public void addItem(Item item)
    {
        contents.add(item);
        count++; // update the item count
        updateWeight(item);
        total += item.getCost();
    }

    /**
     * Adjust the total weight by adding in the weight of a
     * new item.
     * 
     * @param item the new Item being added
     */
    private void  updateWeight(Item item)
    {
        ounces = ounces + item.getOunces();
        pounds = pounds + item.getPounds() + ounces / 16;
        ounces = ounces % 16;
    }

    /**
     * Print the bag's contents.
     */
    public void printContents()
    {
        System.out.println("There are " + count + " items in the bag.");

        for (Item itemmmm : contents) {
            itemmmm.display();
        }
        System.out.println("Total weight: " + pounds + " lbs, " + ounces + " oz.");
        System.out.println("Total cost: " + total);
    }

    /**
     * Prints out all items in the bag that have price equal to p, the
     * paramater.
     *
     * @param p The desired price to be searched for
     */
    public void findByPrice(int p)
    {
        System.out.println("Items having a cost of " + p + ":");
        for (Item iteem : contents)
        {
            // Loop through contents, looking at the cost of each item
            if (iteem.getCost() == p)
            {
                iteem.display();
            }
        }
    }

    /**
     * For ease of testing, this method loads the bag with several items.
     * It is just a programming convenience; it is not an intended part
     * of the functionality of the Bag class, and can be
     * deleted once the program is completed and thoroughly debugged.
     */
    public void test()
    {
        this.addItem(new Item("raisins", 0, 6, 75));
        this.addItem(new Item("bread", 0, 12, 159));
        this.addItem(new Item("light bulbs", 0, 10, 250));
        this.addItem(new Item("sugar", 5, 0, 250));
        this.addItem(new Item("onions", 3, 8, 200));
    }
}
