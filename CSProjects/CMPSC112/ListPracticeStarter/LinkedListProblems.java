// @author Matt Jadud
// @version 20110301
public class LinkedListProblems<E>
{
    public int listSize(LinkedList<E> ls) {
        if (ls.first() == null) {
            return 0;
        } else { 
            return 1 + listSize(ls.rest());
        }
    }
    
    // Write the method count() so that it takes a list and a target object of type E, 
    // and returns the number of times that target appears in the list.
    public int count (LinkedList<E> ls, E target) {
        // If there is nothing in the list, then it is impossible for
        // our target to appear at all. Or, our target appears
        // zero times in the empty list. So, we should return 0.
        if (ls.first() == null) {
            return 0;
        } else {
            // If we're here, we have to ask: is the first node in the
            // list our target? If so, add one. Otherwise, keep looking.
            E current = ls.first();
            if (current.equals(target)) {
                return 1 + count (ls.rest(), target);
            } else {
                return count(ls.rest(), target);
            }
        }
    }
    
    // Write the method append(); it should consume two lists and return 
    // a list that is the combination of the two lists.
    public LinkedList<E> append (LinkedList<E> ls1, LinkedList<E> ls2) {
        // I'll do this by adding ls2 to ls1.
        if (ls2.first() == null) {
            return ls1;
        } else {
            // Get the first thing off ls2.
            E item = ls2.first();
            // Add it to ls1.
            ls1.add(item);
            
            // Continue exploring ls2
            return append (ls1, ls2.rest());
        }
    }

    public boolean member (E item, LinkedList<E> ls) {
        if (ls.first() == null) {
            return false;
        } else {
            if (ls.first() == item) {
                return true;
            } else {
                return member (item, ls.rest());
            }
        }
    }
        
    public LinkedList<E> removeDupes (LinkedList<E> ls) {
        if (ls.first() == null) {
            return ls;
        } else if (member(ls.first(), ls.rest())) {
            return removeDupes(ls.rest());
        } else {
            LinkedList<E> clean = removeDupes(ls.rest());
            clean.add(ls.first());
            return clean;
        }
    }
    
    public LinkedList<E> reverse (LinkedList<E> ls) {
        if (ls.first() == null) {
            return ls;
        } else {
            LinkedList<E> reversed = reverse(ls.rest());
            reversed.add(ls.first());
            return reversed;
        }
    }

}

