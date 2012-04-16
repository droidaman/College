// @author Matt Jadud
// @version 20110301
public class LinkedList<E> implements List<E>
{
    Node<E> first;

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
    }

    // Returns true if the list contains the item.
    public boolean contains (E item){
        // FIXME: Not complete.
        return false;
    }

    // Returns the item at the given index.
    public E get (int index){
        // FIXME: Not complete.
        return null;
    }

    // Returns true if the list is empty.
    public boolean isEmpty (){
        // FIXME: Not complete.
        return false;
    }

    // Removes the element at the given index.
    public E remove (int index){
        // FIXME: Not complete.
        return null;
    }

    // Changes the value of the node at the 
    // given index to the given item.
    public void set (int index, E item){
    }

    // Returns the length of the list.
    public int size (){
        // FIXME: Not complete.
        return 0;
    }
}
