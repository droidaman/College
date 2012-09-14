package edu.allegheny;

// @author Matthew Jadud
// @version 20110301
public class LinkedList<E> implements OEL<E>
{
    Node<E> first;

    public LinkedList() {
    }

    // Contrast with setting first = null.
    private LinkedList(Node<E> ln) {
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

    // Adds an item to the list.
    public LinkedList<E> add (E item) {
        if (first == null) {
            first = new Node(item, null);
            return this;
        } else {
            return add (item, first);
        }
    }

    private LinkedList<E> add (E item, Node<E> n) {
        if (n.getNext() == null) {
            n.setNext(new Node(item, null));
            return this;
        } else {
            return add (item, n.getNext());
        }
    }

    // Returns true if the list is empty.
    public boolean isEmpty (){
        return first == null;
    }

    public String toString() {
        return toString(first);
    }

    // toString is easier to write if it is recursive.
    private String toString(Node<E> n) {
        if (n == null) {
            return "[/]";
        } else {
            return "[" + n.getItem() + "]->" + toString(n.getNext());
        }
    }

}
