/**
 * Write a description of interface List here.
 * 
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110227)
 */

package sourceCode;

public class Node<E> {

	// A node has two fields: a first, and a rest.
	E item;
	Node nextRight;
	Node nextLeft;

	public Node(E item, Node left, Node right) {
		this.item = item;
		this.nextLeft = left;
		this.nextRight = right;
	}

	public E getItem() {
		return item;
	}

	public void setItem(E newItem) {
		this.item = newItem;
	}

	public Node getNextLeft() {
		return nextLeft;
	}

	public Node getNextRight() {
		return nextRight;
	}

	public void setNextLeft(Node newNode) {
		this.nextLeft = newNode;
	}

	public void setNextRight(Node newNode) {
		this.nextRight = newNode;
	}
}
