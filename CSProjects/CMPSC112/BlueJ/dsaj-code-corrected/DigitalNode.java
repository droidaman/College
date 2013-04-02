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


// Introduced in Chapter 14
import java.util.*;

/** Node in a digital search tree. */
public class DigitalNode<E> {

  /** Map associating Characters with child nodes. */
  private Map<Character,DigitalNode<E>> children;

  /** True if this node is the end of a word. */
  private E item;

  /** A new node has no children. */
  public DigitalNode(E item) {
    children = new HashMap<Character,DigitalNode<E>>(1);
    this.item = item;
  }

  /** Return the child associated with c. */
  public DigitalNode<E> getChild(char c) {
    return children.get(c);
  }

  /** Return the item stored at this node. */
  public E getItem() {
    return item;
  }

  /** Return true if this node is a leaf. */
  public boolean isLeaf() {
    return children.isEmpty();
  }

  /**
   * Choose a random letter from those for which this node has children.
   */
  public char randomLetter() {
    java.util.Set<Character> letters = children.keySet();
    int i = (int)(Math.random() * letters.size());
    for (char letter : letters) {
      if (i == 0) { return letter; }
      i--;
    }
    return '?';                 // This should never happen
  }

  /** Associate c with child. */
  public void setChild(char c, DigitalNode<E> child) {
    children.put(c, child);
  }

  /** Set the item associated with this node. */
  public void setItem(E item) {
    this.item = item;
  }
  
}
