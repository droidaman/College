
/**
 * Write a description of interface List here.
 * 
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110227)
 */
public interface List<E> {
	// Adds an item to the list.
	public void add (E item);
 
	// Returns true if the list contains the item.
	public boolean contains (E item);
 
	// Returns the item at the given index.
	public E get (int index);
 
	// Returns true if the list is empty.
	public boolean isEmpty ();
 
	// Removes the element at the given index.
//	public E remove (int index);
 
	// Changes the value of the node at the 
	// given index to the given item.
//	public void set (int index, E item);
 
	// Returns the length of the list.
	public int size ();
}