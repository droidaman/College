import java.util.*;
import java.io.*;

public class CountingWords
{
    File wordListFile = new File("the-wordlist.txt");
    ArrayList<String> wordList = new ArrayList<String>();
    public static final int STUFF = 0;

    public CountingWords()
    {
        Scanner sc = null;
        try {
            sc = new Scanner(new FileInputStream(wordListFile), "UTF-8");

            // Load every word into a list to start,
            // so we can work with it everywhere else in this class.
            while (sc.hasNextLine()) {
                wordList.add(sc.nextLine());
            }

        } catch (Exception e) {
            System.out.println("SCANNING DIED: " + e);
            System.exit(1);
        }

    }

    // Count Lengths
    // We don't know what lengths we will encounter, so we want to
    // take each word in turn, get its length, and use that length
    // as a key into a hash table. The value will be the number of 
    // times a word of that length has come up.
    public HashMap<Integer, Integer> countLengths() {
        // Declare a new hashmap named 'h' that has Integers for keys 
        // and stores Integers as values.
        // ... YOUR CODE HERE ... //
        HashMap<Integer, Integer> h = new HashMap<Integer, Integer>();
        
        // Go through the list of words we've cached
        for (String word : wordList) {
            // Get the length of the word.
            int length = STUFF;    

            // Find out how many words of that length are already
            // in the hashmap. We use the big Integer here because
            // the HashMap may return null if nothing of that length
            // exists yet.
            Integer count = STUFF;

            // Increment the count, and put it back into the HashMap
            // for words of this length.

        }

        // Return the results of our work.
        return h;
    }

    public void runAll () {
        // Set up a place for the results to be stored.
        // Specfically, the variable 'counters' needs to be a HashMap
        // containing Integers for keys and Integers for values.
        HashMap<Integer, Integer> counters = new HashMap<Integer, Integer>();

        // ... YOUR CODE HERE ... //
        counters = countLengths();

        // Get the keys in the counter HashMap.
        // The keys will be word lengths. A Set is like
        // a list, but there is no ordering of the data.
        Set<Integer> keys = null;

        // Although it is unsorted, the Set class implements
        // List and Comparable, so we can sort the data.
        // This is one way to do it -- create a sortable ArrayList
        // from the Set, and then sort that using the static
        // method "sort" from the Collections class.
        List<Integer> sorted = new ArrayList<Integer>(keys);
        Collections.sort(sorted);

        // Go through the keys, and print out the values for each key.
        // The values will be the count for each word length.
        for (Integer i : sorted) {
            // Each value 'i' is a key into the HashMap.
            // First, get the number of words at that length.

            int length = STUFF;

            // Then, print out a message showing the length and count.
        }
    }
}

