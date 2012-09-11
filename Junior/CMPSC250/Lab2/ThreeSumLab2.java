/*************************************************************************
 * ThreeSumLab2:
 * 
 * Modification of program ThreeSum.java
 *      (at http://algs4.cs.princeton.edu/home/)
 *  This modification uses random integer data rather than reading in
 *  from a file. It executes the algorithm for multiple values of N
 *  and plots timing information for each N.
 * 
 *  It may be necessary to modify the range in setYscale to adapt this
 *  to your particular system.
 * 
 *  Compilation:  javac ThreeSumLab2.java
 *  Execution:    java ThreeSumLab2
 *
 *  A program with cubic running time. Read in N integers
 *  and counts the number of triples that sum to exactly 0
 *  (ignoring integer overflow).
 *
 *************************************************************************/

public class ThreeSumLab2 {

    // print distinct triples (i, j, k) such that a[i] + a[j] + a[k] = 0
    // NO CHANGES WERE MADE TO THIS METHOD
    public static void printAll(int[] a) {
        int N = a.length;
        for (int i = 0; i < N; i++) {
            for (int j = i+1; j < N; j++) {
                for (int k = j+1; k < N; k++) {
                    if (a[i] + a[j] + a[k] == 0) {
                        StdOut.println(a[i] + " " + a[j] + " " + a[k]);
                    }
                }
            }
        }
    } 

    // return number of distinct triples (i, j, k) such that a[i] + a[j]
    // + a[k] = 0
    // NO CHANGES WERE MADE TO THIS METHOD
    public static int count(int[] a) {
        int N = a.length;
        int cnt = 0;
        for (int i = 0; i < N; i++) {
            for (int j = i+1; j < N; j++) {
                for (int k = j+1; k < N; k++) {
                    if (a[i] + a[j] + a[k] == 0) {
                        cnt++;
                    }
                }
            }
        }
        return cnt;
    } 

    // Old code has been commented out:
    public static void main(String[] args)  { 
        //int[] a = In.readInts(args[0]);
        StdDraw.setXscale(1,5000);
        StdDraw.setYscale(0,20);   // YOU MAY NEED TO MODIFY THIS
        StdDraw.setPenRadius(.005);
        
        // Repeatedly run the method "count" for many different values of n
        for (int n = 100; n < 5000; n = n + 100) {
            
            // Create and fill an array of size n
            int[] a = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = StdRandom.uniform(20001)-10000;
            }
            
            // Run the algorithm and time it:
            Stopwatch timer = new Stopwatch();
            double elapse = timer.elapsedTime();
            
            int cnt = count(a);
            
            elapse = timer.elapsedTime()-elapse;
            //StdOut.println("elapsed time = " + timer.elapsedTime());
            //StdOut.println(cnt);
            StdDraw.setPenColor(StdDraw.BLACK);
            StdDraw.point(n,elapse);
        }
    } 
} 

