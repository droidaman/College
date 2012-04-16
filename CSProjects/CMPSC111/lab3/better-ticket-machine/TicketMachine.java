/**
 * TicketMachine models a ticket machine that issues
 * flat-fare tickets.
 * The price of a ticket is specified via the constructor.
 * Instances will check to ensure that a user only enters
 * sensible amounts of money, and will only print a ticket
 * if enough money has been input.
 * 
 * @author David J. Barnes and Michael Kolling and Braden Licastro
 * @version lab3 September 14th 2010
 */
public class TicketMachine
{
    // The price of a ticket from this machine.
    private int price;
    // The amount of money entered by a customer so far.
    private int balance;
    // The total amount of money collected by this machine.
    private int total;
    // The total number of tickets sold by this machine.
    private int numSold;

    /**
     * Create a machine that issues tickets of the given price.
     */
    public TicketMachine(int ticketCost)
    {
        price = ticketCost;
        balance = 0;
        total = 0;
        numSold=0;
    }

    /**
     * @Return The price of a ticket.
     */
    public int getPrice()
    {
        return price;
    }

    /**
     * Return The amount of money already inserted for the
     * next ticket.
     */
    public int getBalance()
    {
        return balance;
    }

    /**
     * @Return The number of tickets sold by this machine.
     */
    public int getNumSold()
    {
        return numSold;
    }
    
    /**
     * Receive an amount of money in cents from a customer.
     * Check that the amount is sensible.
     */
    public void insertMoney(int amount)
    {
        //Is our amount larger than 1000?
        if(amount <= 1000)
        {
            //No, so continue normally.
            if(amount > 0)
            {
                balance = balance + amount;
            }
            else
            {
                System.out.println("Use a positive amount: " + amount);
            }
        }
        else
        {
            System.out.println("\nAmount must not exceed 1000!\n");    
        }
    }

    /**
     * Print a ticket if enough money has been inserted, and
     * reduce the current balance by the ticket price. Print
     * an error message if more money is required.
     */
    public void printTicket()
    {
        if(balance >= price) {
            // Simulate the printing of a ticket.
            System.out.println("##################");
            System.out.println("# The BlueJ Line");
            System.out.println("# Ticket");
            System.out.println("# " + price + " cents.");
            System.out.println("##################");
            System.out.println();

            // Update the total collected with the price.
            total = total + price;
            // Reduce the balance by the prince.
            balance = balance - price;
            //Add one ticket sold every time it is appliccable.
            numSold += 1;
        }
        else {
            System.out.println("You must insert at least: " +
                               (price - balance) + " more cents.");
                    
        }
    }

    /**
     * Return the money in the balance.
     * The balance is cleared.
     */
    public int refundBalance()
    {
        int amountToRefund;
        amountToRefund = balance;
        balance = 0;
        //Print the total number to be refunded to the terminal.
        System.out.println ("Refunding " + amountToRefund + ".");
        return amountToRefund;
    }
    
       /**
     * Return a summary of the current ticket machines information.
     * Displays the total amount of money in the machine, number of tickets sold, and the remaining balance in te machine.
     */
    public void summary()
    {
        System.out.println("Summary:");
        System.out.println("     " + total + " collected.");
        System.out.println("     (" + numSold + " tickets at " + price + " per ticket)");
        System.out.println("     Balance of " + balance + " remaining in the current transaction.");
    }
}
