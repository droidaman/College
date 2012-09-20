/**
 * Write a description of interface List here.
 * 
 * @author (Braden Licastro and Trent Dale) 
 * @version (20110227)
 */

package sourceCode;

public class BinaryTree<E> {

	private Node<E> first;
	private Node<E> previous;
	private int listSize;

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
			return "[ " + n.getItem() + " ] => "
					+ privToString(n.getNextLeft())
					+ privToString(n.getNextRight());
		}
	}

	public BinaryTree() {
		first = null;
		previous = null;
		listSize = 0;
	}

	public void add(E item) {
		// If the Node called 'first' is null,
		// then there must be no nodes in this list.
		// Therefore, it must be empty.
		if (first == null) {
			first = new Node<E>(item, null, null);
		} else {
			addToEnd(item, first, first);
		}
		listSize++;
	}

	private void addToEnd(E item, Node<E> nl, Node<E> nr) {
		if (nl.getNextLeft() == null) {
			Node<E> last = new Node<E>(item, null, null);
			nl.setNextLeft(last);
		} else if (nr.getNextRight() == null) {
			Node<E> last = new Node<E>(item, null, null);
			nr.setNextRight(last);
		} else {
			addToEnd(item, nl.getNextLeft(), null);
			addToEnd(item, null, nr.getNextRight());

		}
	}

	public boolean contains(E myItem) {
		if (isEmpty()) {
			return false;
		} else {
			return privContains(myItem, first);
		}
	}

	private boolean privContains(E myItem, Node<E> n) {
		if (n == null) {
			return false;
		} else if (myItem == n.getItem()) {
			return true;
		} else {
			return privContains(myItem, n.getNextLeft());
		}
	}

	public E get(int index) {
		if (first == null) {
			return null;
		} else {
			int counter = 0;
			return getPriv(index, first, counter);
		}
	}

	private E getPriv(int index, Node<E> n, int counter) {
		if (n == null) {
			return null;
		} else {
			// The node is not null. Is it the one we're
			// looking for? I don't know. Let's check
			// the counter.
			if (index == counter) {
				return n.getItem();
			} else {
				counter++;
				return getPriv(index, n.getNextLeft(), counter);
			}
		}
	}

	public boolean isEmpty() {
		return first == null;
	}

	public E remove(int index) {
		if (first == null) {
			return null;
		} else {
			int counter = 0;
			return removePriv(index, previous, first, counter);
		}
	}

	private E removePriv(int index, Node<E> p, Node<E> n, int counter) {
		if (n == null) {
			return null;
		} else {
			if (index == counter) {
				E temp = n.getItem();
				if (index == 0) {
					this.first = n.getNextLeft();
				} else {
					p.setNextLeft(n.getNextLeft());
				}
				listSize--;
				return temp;
			} else {
				p = n;
				return removePriv(index, p, n.getNextLeft(), counter++);
			}

		}
	}

	public void set(int index, E item) {
		if (first == null) {
		} else {
			int counter = 0;
			setPriv(index, item, first, counter);
		}
	}

	private void setPriv(int index, E item, Node<E> n, int counter) {
		if (n == null) {

		} else {
			if (index == counter) {
				n.setItem(item);
			} else {
				setPriv(index, item, n.getNextLeft(), counter++);
			}
		}
	}

	public int size() {
		return listSize;
	}

	public BinaryTree<E> removeDupes(BinaryTree<E> bt) {
		if (bt.first == null) {
			return bt;
		} else {
			BinaryTree<E> clean = removeDupes(bt);
			return clean;
		}
	}
}
