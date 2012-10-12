/********
 * YOUR NAME, LAB #, etc.
 *
 * QuickIns -- quicksort, modified with a cutoff value to switch to
 * insertion sort
 *
 * Compile: javac QuickIns.java
 *
 * Usage: java QuickIns n numexp cutoff
 * where:
 *          n      is the size of the array to be sorted
 *          numexp is the number of experiments to be averaged (e.g., 100)
 *          cutoff is the array size where we should switch to insertion
 *                 sort (see textbook, page 296)
 *
 * @author	Bob Roos
 * @version	25 Sept 2012
 *********/

public class QuickIns {
    public static int count, cutoff; // comparison count, insertion cutoff

    public static void main(String[] args) {
        // Input size of array from command line:
        int n = Integer.parseInt(args[0]);

        // Input number of experiments from command line:
        int numexp = Integer.parseInt(args[1]);

        // Input cutoff-to-insertion value from command line:
        cutoff = Integer.parseInt(args[2]);
        
        int a[] = new int[n];

        StdRandom.setSeed(2817283789123474L); // IMPORTANT!
        int total = 0;

        for (int experiment = 0; experiment < numexp; experiment++) {
            // Create a random array of size n:
            for (int i = 0; i < n; i++) {
                a[i] = StdRandom.uniform(n);
            }
            count = 0;
            
            /* Code to print the unsorted array
            for (int x : a)
                System.out.print(a[x] + ", ");
            System.out.print("\n\n");
            */

            // Sort the array
            sort(a);
            
            /* Code to print the sorted array
            for(int x : a)
                System.out.print(a[x] + ", ");
            System.out.print("\n");
            */

            // print three values so we can verify that the same
            // arrays are being sorted in both the "QuickIns" and the
            // "QuickNoIns" versions:
            StdOut.println("Experiment " + experiment + 
                           " ("+a[3]+" "+a[6]+" "+a[9]+
                           "): Number of comparisons: "+count);
            total += count;
        }
        StdOut.println("Average: " + total/(double)numexp);
    }

    public static void insertion(int[] a, int lo, int hi) {
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

    // Quicksort -- see textbook, pp 289-291
    public static void sort(int[] a) {
        // No shuffle in this version--it introduces a random
        // element that makes it harder to compare the 
        // two versions of quicksort.
        
        sort(a,0,a.length-1);
    }

    // Sort a between positions lo, ... hi
    //     *********************************
    //     *  YOU NEED TO MODIFY THIS CODE *
    //     *********************************
    public static void sort(int[] a, int lo, int hi) {
        if (hi <= lo) return; // array size 0 or 1--nothing to do

        int j = partition(a,lo,hi); // split array around index j

        if ((j-1)-lo >= cutoff && hi-(j+1) >= cutoff) {
            insertion(a,lo,j-1);
            insertion(a,j+1,hi);
        } else if ((j-1)-lo < cutoff && hi-(j+1) >= cutoff) {
            sort(a,lo,j-1);
            insertion(a,j+1,hi);
        } else if ((j-1)-lo >= cutoff && hi-(j+1) < cutoff) {
            insertion(a,lo,j-1);
            sort(a,j+1,hi);
        } else {
            sort(a,lo,j-1);  // sort values left of j
            sort(a,j+1,hi);  // sort values right of j
        }
    }

    // Partition an array (between positions lo and hi) so that
    // all values on the left are less than or equal to the 
    // value at the partition point and all values on the right
    // are greater than or equal to the value at the partition point.
    //
    // Return the partition point (also called pivot point)
    public static int partition(int[] a, int lo, int hi) {
        int i = lo, j = hi+1; // i, j move towards each other
        int v = a[lo];        // partition around a[lo]
        while (true) {
            count++;
            while (a[++i] < v) { // move right as long as values < v
                count++;
                if (i==hi) break;
            }
            count++;
            while (v < a[--j]) { // move left as long as values > v
                count++;
                if (j==lo) break;
            }
            if (i >= j) break;
            exch(a,i,j);
        }
        exch(a,lo,j);
        return j;
    }
    
    // exchange a[i] and a[j]
    private static void exch(int[] a, int i, int j) {
        int swap = a[i];
        a[i] = a[j];
        a[j] = swap;
    }
}
