// Braden Licastro

/*************************************************************************
 * YOU NEED TO MODIFY THIS FILE FOR LAB 2 
 * 
 * Compilation:  javac ThreeSumFast.java
 *  Execution:    java ThreeSumFast input.txt
 *  Data files:   http://algs4.cs.princeton.edu/14analysis/1Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/2Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/4Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/8Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/16Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/32Kints.txt
 *                http://algs4.cs.princeton.edu/14analysis/1Mints.txt
 *
 *  A program with N^2 log N running time. Read in N integers
 *  and counts the number of triples that sum to exactly 0.
 *
 *  Limitations
 *  -----------
 *     - we ignore integer overflow
 *     - doesn't handle case when input has duplicates
 *
 *
 *  % java ThreeSumFast 1Kints.txt
 *  70
 *  
 *  % java ThreeSumFast 2Kints.txt
 *  528
 *                
 *  % java ThreeSumFast 4Kints.txt
 *  4039
 * 
 *  % java ThreeSumFast 8Kints.txt
 *  32074
 *
 *  % java ThreeSumFast 16Kints.txt
 *  255181
 *
 *  % java ThreeSumFast 32Kints.txt
 *  2052358
 *
 *************************************************************************/

import java.util.Arrays;

public class ThreeSumFast {

    // print distinct triples (i, j, k) such that a[i] + a[j] + a[k] = 0
    public static void printAll(int[] a) {
        int N = a.length;
        Arrays.sort(a);
        for (int i = 0; i < N; i++) {
            for (int j = i+1; j < N; j++) {
                int k = Arrays.binarySearch(a, -(a[i] + a[j]));
                if (k > j) StdOut.println(a[i] + " " + a[j] + " " + a[k]);
            }
        }
    } 

    // return number of distinct triples (i, j, k) such that a[i] + a[j] + a[k] = 0
    public static int count(int[] a) {
        int N = a.length;
        Arrays.sort(a);
        int cnt = 0;
        for (int i = 0; i < N; i++) {
            for (int j = i+1; j < N; j++) {
                int k = Arrays.binarySearch(a, -(a[i] + a[j]));
                if (k > j) cnt++;
            }
        }
        return cnt;
    } 

    public static void main(String[] args)  { 

        StdDraw.setXscale(1,5000);
        StdDraw.setYscale(0,2000);   // YOU MAY NEED TO MODIFY THIS
        StdDraw.setPenRadius(.005);

        for (int n = 100; n < 5000; n = n + 100) {

            // Run the algorithm and time it:
            Stopwatch timer = new Stopwatch();
            double elapse = timer.elapsedTime();
 
            // Create and fill an array of size n
            int[] a = new int[n];
            for (int i = 0; i < n; i++) {
                a[i] = StdRandom.uniform(20001)-10000;
            }

            int cnt = count(a);

            // End the timer
            elapse = timer.elapsedTime()-elapse;

            StdOut.println(cnt);
            StdDraw.setPenColor(StdDraw.BLACK);
            StdDraw.point(cnt,elapse);

            Stopwatch timer2 = new Stopwatch();
            double elapsed = timer2.elapsedTime();
            // calculations
            long n2logn = (n * (long) n) * (long) Math.log(n);
            elapsed = timer2.elapsedTime()-elapsed;

            // Text output
            /* StdOut.println(n2logn / elapsed);*/
            // Second plot
            StdDraw.setPenColor(StdDraw.RED);
            StdDraw.point(n2logn,elapsed);
        }
    } 
} 
