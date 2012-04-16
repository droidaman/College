
/**
 * Provide a demonstration of the Club and Membership
 * classes.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ClubDemo
{
    // instance variables - replace the example below with your own
    private Club club;

    /**
     * Constructor for objects of class ClubDemo
     */
    public ClubDemo()
    {
        club = new Club();
    }

    /**
     * Add some members to the club, and then
     * show how many there are.
     * Further example calls could be added if more functionality
     * is added to the Club class.
     */
    public void demo(int month)
    {
        
        club.join(new Membership("David", 2, 2004));
        club.join(new Membership("Michael", 1, 2004));
        club.join(new Membership("Daveed", 1, 2003));
        club.join(new Membership("Micheal", 1, 4200));
        club.join(new Membership("Davaad", 1, 1991));
        club.join(new Membership("Miguel", 1, 1776));
        club.join(new Membership("Daniel", 1, 1234));
        club.join(new Membership("Mitchel", 1, 9547));
        System.out.println("The club has " +
            club.numberOfMembers() +
            " members.");
       System.out.println ("Club membership is as follows:\n");
       club.listAll();
       System.out.println (club.joinedInMonth(month) + "members joined in the " + month + "given month.");
    }
}
