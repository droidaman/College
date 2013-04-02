/**
 * Write a description of interface List here.
 * 
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110227)
 */

public class LinkedList<E> implements Iterable<E> {
    private Node<E> first;
    private Node<E> previous;
    private int listSize;

    public java.util.Iterator<E> iterator() {
        return new LinkedListIterator<E>(this);
    }

    public String toString() {
        String s;

        if (first == null) {
            return "[/]";
        } else {
            return privToString(first);
        }

    }

    public String privToString(Node<E> n) {
        if (n == null) {
            return "[/]";
        } else {
            return "[ " + n.getItem() + " ] => " + privToString(n.getNext());
        }
    }

    public LinkedList () {
        first = null;
        previous = null;
        listSize = 0;
    }

    public void add (E item) {
        // If the Node called 'first' is null,
        // then there must be no nodes in this list.
        //Therefore, it must be empty.
        if (first == null) {
            first = new Node<E>(item, null);
        } else {
            addToEnd(item, first);
        }
        listSize++;
    }

    private void addToEnd(E item, Node<E> n){
        if (n.getNext() == null){
            Node<E> last = new Node<E>(item, null);
            n.setNext(last);
        }else{
            addToEnd(item, n.getNext());
        }
    }

    public boolean contains (E myItem) {
        if (isEmpty()) {
            return false;
        } else {
            return privContains(myItem, first);
        }
    }

    private boolean privContains(E myItem, Node<E> n){
        if (n == null){
            return false;
        } else if(myItem == n.getItem()){
            return true;
        } else {
            return privContains(myItem, n.getNext());
        }
    }

    public E get (int index) {
        if(first == null){
            return null;
        } else {
            int counter = 0;
            return getPriv (index, first, counter);
        }
    }

    private E getPriv (int index, Node<E> n, int counter){
        if(n == null){
            return null;
        } else {
            //The node is not null. Is it the one we're
            //looking for? I don't know. Let's check
            //the counter.
            if (index == counter) {
                return n.getItem();
            } else {
                counter ++;
                return getPriv(index, n.getNext(), counter);
            }
        }
    }

    public boolean isEmpty() {
        return first == null;
    }

    public E remove (int index) {
        if(first == null){
            return null;
        } else {
            int counter = 0;
            return removePriv (index, previous, first, counter);
        }
    }

    private E removePriv (int index, Node<E> p, Node<E> n, int counter) {
        if(n == null){
            return null;
        } else {
            if (index == counter) {
                E temp = n.getItem();
                if(index == 0){
                    this.first = n.getNext();
                } else {
                    p.setNext(n.getNext());
                }
                listSize--;
                return temp;
            } else {
                p = n;
                return removePriv(index, p, n.getNext(), counter++);
            }

        }
    }

    public void set (int index, E item) {
        if(first == null){
        } else {
            int counter = 0;
            setPriv (index, item, first, counter);
        }
    }

    private void setPriv (int index, E item, Node<E> n, int counter) {
        if(n == null){

        } else {
            if (index == counter) {
                n.setItem(item);
            } else {
                setPriv(index, item, n.getNext(), counter++);
            }
        }
    }

    public int size() {
        return listSize;
    }

    public LinkedList<E> removeDupes (LinkedList<E> ls) {
        if (ls.first == null) {
            return ls;
        } else {
            LinkedList<E> clean = removeDupes(ls);
            return clean;
        }
    }
}