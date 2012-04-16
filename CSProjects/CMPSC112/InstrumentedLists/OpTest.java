import java.util.*;

// @author (your name) 
// @version (a version number or a date)

public class OpTest
{
    public static final int TEST_RUNS = 10000;
    LinkedList<Object> ll;
    ArrayList<Object> al; 
    Object[] arr = new Object[TEST_RUNS];

    public void resetLists () {
        ll = new LinkedList<Object>();
        al = new ArrayList<Object>();
        ll.resetOpCount();
        al.resetOpCount();
    }

    public long testTime (List<Object> ls, int length, int index) {
        for (int i = 0 ; i < length ; i++) {
            ls.add(new String("" + i));
        }

        long before = System.currentTimeMillis();
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            arr[i] = ls.get(index + (int)(Math.random() + 0.5));
        }
        long after = System.currentTimeMillis();

        // Use things, just in case
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            arr[i] = ((String)arr[i]) + "i";
        }

        return (after - before);
    }

    public int testOps (List<Object> ls, int length, int index) {

        for (int i = 0 ; i < length ; i++) {
            ls.add(new String("" + i));
        }

        ls.resetOpCount();
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            arr[i] = ls.get(index + (int)(Math.random() + 0.5));
        }
        int ops = (int)(ls.getOpCount() / TEST_RUNS);

        // Use things, just in case
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            arr[i] = ((String)arr[i]) + "i";
        }   

        return ops;
    }

    public long testRemoveTime (LinkedList<Object> ls, int length, int index) {
        LinkedListMethods lsm = new LinkedListMethods();
        
        for (int i = 0 ; i < length ; i++) {
            ls.add(new String("" + i));
        }

        long before = System.currentTimeMillis();
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            lsm.removeDupes(ls);
        }
        long after = System.currentTimeMillis();

        return (after - before);
    }

    public int testRemoveOps (LinkedList<Object> ls, int length, int index) {
        LinkedListMethods lsm = new LinkedListMethods();
        
        for (int i = 0 ; i < length ; i++) {
            ls.add(new String("" + i));
        }

        ls.resetOpCount();
        for (int i = 0 ; i < TEST_RUNS ; i++) {
            lsm.removeDupes(ls);
        }
        int ops = (int)(ls.getOpCount() / TEST_RUNS);

        return ops;
    }

    public void runTests() {

        int[] testLengths = {10, 100, 1000, 10000};
        int[] testItems = {5, 50, 500, 5000};
        for (int i = 0 ; i < testLengths.length ; i++) {

            // LinkedList
            resetLists();
            int ops = testOps(ll, testLengths[i], testItems[i]);
            resetLists();
            long time = testTime(ll, testLengths[i], testItems[i]);
            System.out.println("LinkedList," + testLengths[i] + "," + testItems[i] + "," + ops + "," + time);
        }

        for (int i = 0 ; i < testLengths.length ; i++) {
            // ArrayList
            resetLists();
            int ops = testOps(al, testLengths[i], testItems[i]);
            resetLists();
            long time = testTime(al, testLengths[i], testItems[i]);
            System.out.println("ArrayList," + testLengths[i] + "," + testItems[i] + "," + ops + "," + time);
        }

        for (int i = 0 ; i < testLengths.length ; i++) {
            // ArrayList
            resetLists();
            int ops = testRemoveOps(ll, testLengths[i], testItems[i]);
            resetLists();
            long time = testRemoveTime(ll, testLengths[i], testItems[i]);
            System.out.println("RemoveDupes," + testLengths[i] + "," + testItems[i] + "," + ops + "," + time);
        }

        System.out.println("DONE");
    }   

    public static void main (String args[]) {
        OpTest op = new OpTest();

        op.runTests();
    }

}
