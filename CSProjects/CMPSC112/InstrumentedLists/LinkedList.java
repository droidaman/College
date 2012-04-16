// @author Matt Jadud
// @version 20110301
public class LinkedList<E> implements List<E>
{
    Node<E> first;
    int opCount = 0;
    
    public int getOpCount() {
        return opCount;
    }
    
    public void resetOpCount() {
        opCount = 0;
    }
    
    public LinkedList() {
    }
    
    // Contrast with setting first = null.
    public LinkedList(Node<E> ln) {
        first = ln;
    }

    // Returns the first item in the list.

    public E first() {
        if (first != null) {
            return (E)first.getItem();
        } else {
            // FIXME: This could be an exception.
            return null;
        }

    }

    public LinkedList<E> rest() {
        // Constructs a new, non-empty LinkedList<E>
        // beginning with the second node.
        if (first != null) {
            return new LinkedList<E>(first.getNext());
        } else {    
            // FIXME: This could be an exception.
            return null;
        }
    }

    /* *********************************** */
    // You need to add your code in below this point.
    /* *********************************** */    
    
    // Adds an item to the list.
    public void add (E item) {
        // INSTRUMENT
        // Check for null...
        opCount++;
        if (first == null) {
            first = new Node(item, null);
        } else {
            // INSTRUMENT
            opCount++;
            add (item, first);
        }
    }
    
    private void add (E item, Node<E> n) {
        // INSTRUMENT
        opCount++;
        if (n.getNext() == null) {
            // INSTRUMENT
            // Create a new node... and do a set.
            opCount += 2;
            n.setNext(new Node(item, null));
        } else {
            // INSTRUMENT
            opCount++;
            add (item, n.getNext());
        }
    }

    // Returns true if the list contains the item.
    public boolean contains (E item){
        // INSTRUMENT
        opCount++;
        if (first == null) {
            return false;
        } else {
            //
            opCount++;
            return contains (item, first);
        }
    }
    
    private boolean contains (E item, Node<E> n) {
        // INSTRUMENT
        opCount++;
        if (n == null) {
            return false;
        } else if ((opCount++ > -1) && (n.getItem().equals(item))) {
            return true;
        } else {
            // INSTRUMENT
            opCount++;
            return contains (item, n.getNext());
        }
    }   

    // Returns the item at the given index.
    public E get (int index){
        // INSTRUMENT
        opCount++;
        if (first == null) {
            return null;
        } else {
            // INSTRUMENT
            opCount++;
            return get (index, 0, first);
        } 
    }
            
    private E get (int index, int counter, Node<E> n) {
        // INSTRUMENT
        opCount++;
        if (n == null) {
            return null;
        } else if ((opCount++ > -1) && (index == counter)) {
            // INSTRUMENT
            opCount++;
            return n.getItem();
        } else {
            // INSTRUMENT
            opCount++;
            return get (index, ++counter, n.getNext());
        }
    }

    // Returns true if the list is empty.
    public boolean isEmpty (){
        // INSTRUMENT
        opCount++;
        return !(first == null);
    }

    // Removes the element at the given index.
    public E remove (int index){
        // INSTRUMENT
        opCount++;
        if (first == null) {
            return null;
        } else {
            // INSTRUMENT
            opCount++;
            return remove (index, 0, first, null);
        }
    }
    
    private E remove (int index, int counter, Node<E> prev, Node<E> curr) {
        // INSTRUMENT
        opCount++;
        if (curr == null) {
            return null;
        } else if ((opCount++ > -1) && (index == counter)) {
            // Handle the case where we're the first item in the list.
            if ((opCount++ > -1) && (prev == null)) {
                E item;
                // INSTRUMENT
                opCount += 2;
                item = first.getItem();
                first = curr;
                return item;
            } else {
                // INSTRUMENT
                opCount += 2;
                prev.setNext(curr.getNext());
                return curr.getItem();
            }
        } else {
            // INSTRUMENT
            opCount++;
            return remove (index, ++counter, curr, curr.getNext());
        }
    }
        
    // Changes the value of the node at the 
    // given index to the given item.
    public void set (int index, E item) {
        // INSTRUMENT
        opCount++;
        if (first == null) {
            // Exception
        } else {
            // INSTRUMENT
            opCount++;
            set (index, 0, item, first);
        } 
    }
            
    private void set (int index, int counter, E item, Node<E> n) {
        // INSTRUMENT
        opCount++;
        if (n == null) {
           // Exception
        } else if ((opCount++ > -1) && (index == counter)) {
            // INSTRUMENT
            opCount++;
            n.setItem(item);
        } else {
            // INSTRUMENT
            opCount++;
            set (index, ++counter, item, n.getNext());
        }
    }

    // Returns the length of the list.
    public int size (){
        // INSTRUMENT
        opCount++;
        return size(first);
    }
    
    private int size (Node<E> n) {
        opCount++;
        if (n == null) {
            return 0;
        } else {
            opCount++;
            return 1 + size(n.getNext());
        }
    }
}
