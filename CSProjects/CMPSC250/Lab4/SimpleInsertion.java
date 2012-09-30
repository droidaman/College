/**
 * SimpleInsertion -- a trimmed-down version of the code
 * in Sedgewick and Wayne, pages 245 and 251.
 *
 * Compiling: javac SimpleInsertion.java
 *
 * Usage: java SimpleInsertion
 */

public class SimpleInsertion {
    /*********
     * main just asks for the name of a text file, calls insertion sort,
     * and prints out the sorted words.
     ********/
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
    }

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
}
