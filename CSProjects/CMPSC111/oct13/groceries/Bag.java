/**
 * Simulates a grocery bag. The bag has a maximum capacity of three
 * items.
 *
 * @author Bob Roos
 * @version 13 October 2010
 */
public class Bag
{
    private Item item1, item2, item3; // up to three items allowed
    private int pounds;   // total weight of all items: pounds component
    private int ounces;   // total weight of all items: ounces component
    private int total;    // total cost of items in bag
    private int count;    // number of items currently in bag
    private int ounceCheck;
    private int poundCheck;

    /**
     * Constructor -- an initially empty bag
     */
    public Bag() {
        item1 = new Item("none",0,0,0);
        item2 = new Item("none",0,0,0);
        item3 = new Item("none",0,0,0);
        pounds = 0;
        ounces = 0;
        total = 0;
        count = 0;
    }

    /**
     * Add a new item to the bag unless the maximum number of
     * items is exceeded. (Mutator method)
     *
     * @param item the Item to be added
     */
    public void addItem(Item item)
    {
        System.out.println (checkWeight(item));
        // First, see if bag is full:
        if (checkWeight(item) == true)
        {
            System.out.println ("Sorry, the bag cannot hold more than 5 pounds 0 ounces.");
        }
        else
        {
            if (count >= 3)
            {
                System.out.println("Sorry, bag already contains three items");
            }

            // Okay, add the new item. Use "count" to figure out which item.
            else
            {
                if (count == 0)
                {
                    item1 = item;
                }
                else if (count == 1)
                {
                    item2 = item;
                }
                else
                {
                    item3 = item;
                }

                count++; // update the item count
                updateWeight(item);
                total += item.getCost();
            }
        }
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

    private boolean checkWeight(Item item)
    {
        ounceCheck = ounces + item.getOunces();
        poundCheck = (pounds + item.getPounds()) + (ounceCheck / 16);
        ounceCheck %= 16;
        System.out.println (poundCheck + "\n" + ounceCheck);
        if (poundCheck > 5 && ounceCheck > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /**
     * Print the bag's contents.
     */
    public void printContents()
    {
        System.out.println("There are " + count + " items in the bag.");
        if (count > 0)
        {
            item1.display();
        }
        if (count > 1)
        {
            item2.display();
        }
        if (count > 2)
        {
            item3.display();
        }
        System.out.println("Total weight: " + pounds + " lbs, " + ounces + " oz.");
        System.out.println("Total cost: " + total);
    }
}
