
/**
 * Nim game bones.
 * 
 * @author (Braden Licastro) 
 * @version (9/28/2010)
 */

public class Nim
{
    //Initialize our Variables
    private int turn, pileOne, pileTwo, pileThree;

    /**
     * Constructor for objects of class Nim
     */
    public Nim(int pileOne, int pileTwo, int pileThree)
    {
        //Set the number of sticks in each pile and make sure they are greater than zero.
        if (pileOne > 0 && pileTwo > 0 && pileThree > 0 && pileOne < 11 && pileTwo < 11 && pileThree < 11)
        {
            this.pileOne = pileOne;
            this.pileTwo = pileTwo;
            this.pileThree = pileThree;
        }
        else
        {
            System.out.println ("The value(s) entered are invalid.\n  -- Default values of 3, 4, 5 will be used.\n");
            this.pileOne = 3;
            this.pileTwo = 4;
            this.pileThree = 5;
        }

        //Player one start...
        turn = 1;

        //Print out the current game status...
        System.out.println ("New Game\n  " + this.pileOne + " " + this.pileTwo + " " + this.pileThree + "\n----------\nPlayer " + turn + "'s turn:");
    }

    public void move(int pileNumber, int stickNumber)
    {
        //Select the pile number, check to make sure selected number of sticks is valid and return errors where necessary.
        if (pileNumber != 1 && pileNumber != 2 && pileNumber != 3)
        {
            System.out.println ("You have entered an invalid pile number. Choose 1, 2, 3. Try again.");
            if (turn == 1)
                turn = 2;
            else
                turn = 1;
        }
        else if (pileNumber == 1 && stickNumber > 0 && stickNumber <= pileOne)
        {
            //Remove requested sticks from the pile.
            pileOne -= stickNumber;
            System.out.println ("     " + stickNumber + " stick(s) removed from pile 1");
        }
        else if (pileNumber == 2 && stickNumber > 0 && stickNumber <= pileTwo)
        {
            //Remove requested sticks from the pile.
            pileTwo -= stickNumber;
            System.out.println ("     " + stickNumber + " stick(s) removed from pile 2");            
        }
        else if (pileNumber == 3 && stickNumber > 0 && stickNumber <= pileThree)
        {
            //Remove requested sticks from the pile.
            pileThree -= stickNumber;
            System.out.println ("     " + stickNumber + " stick(s) removed from pile 3");
        }
        else
        {
            System.out.println ("You have entered an invalid number of sticks to remove. Try again.");
            if (turn == 1)
                turn = 2;
            else
                turn = 1;

        }

        //Check to see if we have a winner yet...
        if (pileOne == 0 && pileTwo == 0 && pileThree == 0)
        {    
            //Tell the players who lost and terminate the program so you cant continue to remove invalid sticks.
            System.out.println ("\nPlayer " + turn + ", you have lost the game.");
            System.exit(0);
        }
        else
        { 
            //Player x just went, now its player y's turn.
            if (turn == 1)
                turn = 2;
            else
                turn = 1;
                
            //Print out whose turn it is this time...               
            System.out.println ("\n----------\nPlayer " + turn + "'s turn:");
            //Print out the current status of the board and continue playing.
            System.out.println ("  " + pileOne + " " + pileTwo + " " + pileThree);
        }
    }
}
