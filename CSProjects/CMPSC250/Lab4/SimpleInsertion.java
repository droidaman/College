/**
 * Braden Licastro
 * Lab 4
 * CMPSC250
 *
 * SimpleInsertion -- a trimmed-down version of the code
 * in Sedgewick and Wayne, pages 245 and 251.
 *
 * Compiling: javac SimpleInsertion.java
 *
 * Usage: java SimpleInsertion
 */

import java.util.*;

public class SimpleInsertion {

    // Keeps track of comparisons
    public static int count;

    public static void main(String[] args) {

        Scanner reader = new Scanner(System.in);

        // Initialize array of determined size and fill with random size.
        System.out.print("What array size would you like to sort? ");
        int[] a;
        a = new int [reader.nextInt()];
        
        for (int i = 0; i < a.length; i++)
        {
            a[i] = (int)(Math.random () * 10);
        }

        // Ask and set lo and hi values
        System.out.print("What lo value? ");
        int lo = reader.nextInt();
        System.out.print("What hi value? ");
        int hi = reader.nextInt();

        // Print out the array unsorted
        System.out.print("Unsorted array:\n");
        for (int i : a) {
            System.out.print(i + ", ");
        }

        // Call the sort on the array
        count = 0;
        insertion(a, lo, hi);

        // Print out the array sorted
        System.out.print("\nSorted array:\n");
        for (int i : a) {
            System.out.print(i + ", ");
        }
        System.out.print("\nComparison count: " + count +  ".\n");
        
    }

    /*********
     * main just asks for the name of a text file, calls insertion sort,
     * and prints out the sorted words.
     ********
    public static void main(String[] args) {

        StdOut.print("This sorts words. Enter the name of a text file: ");
        String filename = StdIn.readString();
        String[] data = In.readStrings(filename);
        sort(data);

        // Display results. Fit as many words on a line as possible.
        int linelength = 0;
        for (int i = 0; i < data.length; i++) {
            if (linelength + data[i].length() + 1 > 80) {
              StdOut.println();
              linelength = 0;
            }
            StdOut.print(data[i]+" ");
            linelength = linelength + data[i].length() + 1;
        }
        if (linelength > 0)
            StdOut.println();
    } */

    /********
     * Insertion sort -- one of the classic sorting methods
     *******/
    public static void sort(String[] data) {
        for (int i = 1; i < data.length; i++) {
            String hold = data[i];  // we are trying to insert data[i]
            int j = i-1;
            while (j >= 0 && data[j].compareTo(hold) > 0) {
                data[j+1] = data[j]; // shift larger element to make room
                j--;
            }
            data[j+1] = hold; // put data[i] into its correct place
        } // end "for i"
    }

    /********
     * Insertion subarray sort
     * @param a an array of int items.
     * @param lo the left-most index of the subarray.
     * @param hi the right-most index of the subarray.

     * Changed the outer loop to only operate within the high and low bounds.
     * We now start at the lo location, not one past the beginning.
     * Swap and sort still the same.
     *******/
    public static void insertion (int[] a, int lo, int hi) {
        for(int i = lo + 1; i <= hi; i++) {
            int hold = a[i];
            int j = i;
            while(j > lo && hold < a[j-1]) {
                a[j] = a[j-1];
                count++;
                j--;
            }
            a[j] = hold;
        }
    }
}


// Unsorted Array:
// ------------- (arrSize*2)+1
// |3|4|5|6|7|8|
// -------------
//
// Sorted Array:
