/**
 * Write a description of interface List here.
 * 
 * @author (Braden Licastro) 
 * @version (20110227)
 */

package llcode;

public class Node<E> {
 
    // A node has two fields: a first, and a rest.
    E item;
    Node next;
 
    public Node (E item, Node next) {
        this.item = item;
        this.next = next;
    }
 
    public E getItem () {
        return item;
    }
 
    public void setItem (E newItem) {
        this.item = newItem;
    }
 
    public Node getNext () {
        return next;
    }
 
    public void setNext (Node newNode) {
        this.next = newNode;
    }
}