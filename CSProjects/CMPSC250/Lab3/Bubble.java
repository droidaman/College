/***
 * YOUR NAME, LAB #, PROBLEM #, DATE, DESCRIPTION OF PROGRAM, INCLUDING
 * INSTRUCTIONS ON ITS INPUT, OUTPUT, AND PURPOSE.
 */
public class Bubble {
    
    // Generate random arrays of many sizes and sort them.
    public static void main(String[] args) {
        for (int n = 500; n <= 20000; n+=500) {
            Integer a[] = new Integer[n];
            StdRandom.setSeed(9876543212345L);
            for (int i = 0; i < n; i++) {
                a[i] = StdRandom.uniform(100000);
            }
            Stopwatch timer = new Stopwatch();
            double elapsed = timer.elapsedTime();
            sort(a); // fill in method "sort", below
            elapsed = timer.elapsedTime() - elapsed;
            System.out.printf("n = %d, time = %f\n",n,elapsed);
        }
    }
    
    /**
     * Bubble sort
     */
    public static void sort(Comparable a[]) {
          /******************************************************/
          /* FILL IN THIS METHOD WITH A BUBBLE SORT ALGORITHM.  */
          /* DON'T FORGET THAT YOU HAVE TO USE "compareTo" FOR  */
          /* MAKING ARRAY COMPARISONS. YOUR SORT SHOULD WORK    */
          /* FOR ANY Comparable TYPE, NOT JUST INTEGERS.        */
          /******************************************************/
    }
}
