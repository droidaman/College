import java.util.ArrayList;
import java.util.Iterator;

/**
 * Store details of club memberships.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class Club
{
    // Define any necessary fields here ...
    private ArrayList<Membership> memberships; 

    /**
     * Constructor for objects of class Club
     */
    public Club()
    {
        memberships = new ArrayList<Membership>();
    }

    /**
     * Add a new member to the club's list of members.
     * @param member The member object to be added.
     */
    public void join(Membership member)
    {
        memberships.add(member);
    }

    /**
     * @return The number of members (Membership objects) in
     *         the club.
     */
    public int numberOfMembers()
    {
        int numMembers = 0;
        Iterator memIt = memberships.iterator();
        while (memIt.hasNext())
        {
            numMembers++;
            memIt.next();
        }
        return numMembers;
    }

    /**
     * Prints all of the members currently in the membership object.
     */
    public void listAll()
    {
        Iterator memIt = memberships.iterator();
        while (memIt.hasNext())
        {
            System.out.println(memIt.next());
        }
    }

    /**
     * Deterwmine the number of members who joined in the
     * given month.
     * @param month The month we are interested in.
     * @return The number of members joining in month.
     * 
     * COME BACK
     * 
     */
    public int joinedInMonth(int month)
    {
        int numberJoined = 0;
        if (month >= 1 && month <= 12)
        {

            for (Membership memSh: memberships)
            {
                if (memSh.getMonth() == month )
                {
                    numberJoined ++;
                }
            }
        }
        else
        {
            System.out.println ("Error...\n Please enter a valid month (1 thru 12).");
        }
        return numberJoined;
    }

    /**
     * Remove from the club's collection all members who
     * joines in the given month and given year and return them stored
     * in a seperate collection object.
     * @param month The month of the Membership.
     * @param year The year of the Membership.
     * @return The members who joined in the given month and year.
     */
    public ArrayList<Membership> purge(int month, int year)
    {
        ArrayList<Membership> collection = new ArrayList<Membership>();
        
        if (month >= 1 && month <= 12)
        {

            for (Membership memSh: memberships)
            {
                if (memSh.getMonth() == month && memSh.getYear() == year)
                {
                    
                }
            }
        }
        else
        {
            System.out.println ("Error...\n Please enter a valid month (1 thru 12).");
        }
        return ;
     }
}
