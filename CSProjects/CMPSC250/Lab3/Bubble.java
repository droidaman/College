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
    public static void sort(Comparable a[])
    {
        Comparable temp = 0;
               
        for(int i=0; i < a.length; i++)
        {
           for(int j=1; j < (a.length-i); j++)
           {
               if(a[j-1].compareTo(a[j]) > 0)
               {
                   //swap the elements!
                   temp = a[j-1];
                   a[j-1] = a[j];
                   a[j] = temp;
               }
           }
        }          
    }
}
