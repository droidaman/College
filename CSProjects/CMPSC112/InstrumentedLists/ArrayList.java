// Disclaimer: The program code is made available under the
// following copyright notice: Copyright 2006, by Pearson
// Education, Inc. by Drake; all rights reserved. Permission
// is granted for use in non-commercial applications provided
// this copyright notice remains intact and unchanged. The
// author and publisher make no warranty of any kind, expressed
// or implied, with regard to these programs. The author and
// publisher shall not be liable in any event for incidental or
// consequential damages in connection with, or arising out of
// the furnishing, performance of use of this program code.

// Introduced in Chapter 5
/** An array-based List. */
public class ArrayList<E> implements List<E> {

    /** Array of elements in this List. */
    private E[] data;

    /** Number of elements currently in this List. */
    private int size;
    int opCount = 0;

    public int getOpCount() {
        return opCount;
    }
    
    public void resetOpCount() {
        opCount = 0;
    }
    
    /** The List is initially empty. */
    public ArrayList() {
        data = (E[])(new Object[1]); // This causes a compiler warning
        size = 0;
    }

    public void add(E target) {
        if (isFull()) {
            stretch();
        }
        data[size] = target;
        size++;
        // INTRUMENT
        // We set data
        opCount++;
    }

    public boolean contains(E target) {
        for (int i = 0; i < size; i++) {
            // INSTRUMENT
            // We check data[i]
            opCount++;
            if (data[i].equals(target)) {
                return true;
            }
        }
        return false;
    }

    public boolean isEmpty() {
        // INSTRUMENT
        opCount++;
        return size == 0;
    }

    /** Return true if data is full. */
    protected boolean isFull() {
        // INSTRUMENT
        opCount++;
        return size == data.length;
    }

    public java.util.Iterator<E> iterator() {
        return new ArrayIterator<E>(this);
    }

    public E get(int index) {
        // INSTRUMENT
        opCount++;
        return data[index];
    }
    
    public E remove(int index) {
        // INSTRUMENT
        opCount++;
        E result = data[index];
        for (int i = index + 1; i < size; i++) {
            // INSTRUMENT
            // Two ops.
            opCount += 2;
            data[i - 1] = data[i];
        }
        // INSTRUMENT
        // And another
        opCount++;
        size--;
        return result;
    }

    public boolean remove(E target) {
        for (int i = 0; i < size; i++) {
            if ((opCount++ > -1) && data[i].equals(target)) {

                for (int j = i; j < size - 1; j++) {
                    // INSTRUMENT
                    // Two ops
                    opCount += 2;
                    data[j] = data[j + 1];
                }
                // INSTRUMENT 
                // One more...
                opCount++;
                size--;
                return true; 
            }
        }
        return false;
    }

    public void set(int index, E target) {
        // INSTRUMENT
        opCount++;
        data[index] = target;
    }

    public int size() {
        // INSTRUMENT
        opCount++;
        return size;
    }

    /** Double the length of data. */
    protected void stretch() {
        // INSTRUMENT
        // One allocation
        opCount++;
        E[] newData = (E[])(new Object[data.length * 2]); // Warning
        for (int i = 0; i < data.length; i++) {
            // INSTRUMENT
            // Copy all the data...
            opCount++;
            newData[i] = data[i];
        }
        // INSTRUMENT
        // One op
        opCount++;
        data = newData;
    }

    public String toString() {
        String result = "[ ";
        for (int i = 0; i < size; i++) {
            result += data[i] + " ";
        }
        return result + "]";
    }

}
