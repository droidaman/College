// Braden Licastro
// Lab 3
// 9/23/2012

/***
  * YOUR NAME, LAB #, PROBLEM #, DATE, DESCRIPTION OF PROGRAM, INCLUDING
  * INSTRUCTIONS ON ITS INPUT, OUTPUT, AND PURPOSE.
  */

public class Lab3Part1 {

    //Prob 2b:The number is times to run the program for averaging the inversion counts.
    public static int TESTNUM = 10;

    public static void main(String[] args) {
        Integer a[] = {8,10,3,0,12,9,11,4};
        Double b[] = {3.5, -1.3, 12.8, 9.7, 3.0, -6.7, 4.5, 0.2};
        String c[] = {"adze","pyx","woofer","zither","kerf","zloty","iamb"};
        
        StdOut.println("a has " + inversions(a) + " inversions.");
        StdOut.println("b has " + inversions(b) + " inversions.");
        StdOut.println("c has " + inversions(c) + " inversions.");

        // Prob 2b: A place for calculating the average
        int average = 0;
        a = new Integer[30];
        
        // Prob 2b: Loop the program TESTNUM times to get the average.
        for(int k = 0; k < TESTNUM; k++)
        {
            //  fill the array with random numbers between 0 and 99 inclusive.
            for (int i = 0; i < a.length; i++)
            {
                a[i] = StdRandom.uniform(100);
            }
            // Print out the current number of possible inversions and accumulate inversions for average.
            System.out.println ("Inversions possible: " + inversions(a));
            average += inversions(a);
            
        }

        // Callculate the average number of inversions over n test runs and print the result.
        average = average / TESTNUM;
        System.out.println ("The average number of inversions for " + TESTNUM + " runs of the program is " + average +  ".");

    }
   
    /**********
     * inversions -- returns the number of inversions in array a
     *********/ 
    public static int inversions(Comparable[] a) {
        int inversions = 0;

        // Starting position
        for (int i = 0; i < a.length; i++)
        {
            // Every position after starting position.
            for (int j = i + 1; j < a.length; j++)
            {
                // Make necessary comparisons and tally up the number of possible inversions for the given array.
                if (a[i].compareTo(a[j]) > 0)
                    inversions ++;
            }   
        }
        return inversions;
    }
}
