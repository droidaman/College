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
/** Node in a RedBlackTree. */
public class RedBlackNode<E extends Comparable<E>> {

  /** Black node color. */
  public static final boolean BLACK = false;

  /** Red node color. */
  public static final boolean RED = true;

  /** Color of this node, BLACK or RED. */
  private boolean color;

  /** Item associated with this node. */
  private E item;

  /** Left child of this node. */
  private RedBlackNode<E> left;

  /** Parent of this node. */
  private RedBlackNode<E> parent;

  /** Right child of this node. */
  private RedBlackNode<E> right;

  /** Used for constructing a sentinel. */
  protected RedBlackNode() {
    color = BLACK;
    // All other fields are irrelevant
  }

  /**
   * The new node is red and both of its children are sentinel.
   * The node's parent is NOT set by this constructor.
   */
  public RedBlackNode(E item, RedBlackNode<E> sentinel) {
    color = RED;
    this.item = item;
    left = sentinel;
    right = sentinel;
  }

  /**
   * Return this node's left (if direction is negative) or right
   * (otherwise) child.
   */
  public RedBlackNode<E> getChild(int direction) {
    if (direction < 0) {
      return left;
    }
    return right;
  }

  /** Return the color of this node. */
  public boolean getColor() {
    return color;
  }

  /** Return the item associated with this node. */
  public E getItem() { return item; }

  /** Return this node's left child. */
  public RedBlackNode<E> getLeft() {
    return left;
  }

  /** Return this node's parent. */
  public RedBlackNode<E> getParent() {
    return parent;
  }

  /** Return this node's right child. */
  public RedBlackNode<E> getRight() {
    return right;
  }

  /** Return true if this node has two black children. */
  public boolean hasTwoBlackChildren() {
    return left.isBlack() && right.isBlack();
  }

  /** Return true if this node is black. */
  public boolean isBlack() {
    return color == BLACK;
  }

  /** Return true if this node is red. */
  public boolean isRed() {
    return color == RED;
  }

  /**
   * Set this node's left (if direction is negative) or right
   * (otherwise) child.
   */
  public void setChild(int direction, RedBlackNode<E> child) {
    if (direction < 0) {
      left = child;
    } else {
      right = child;
    }
  }

  /** Make this node black. */
  public void setBlack() {
    color = BLACK;
  }

  /** Set the color of this node. */
  public void setColor(boolean color) {
    this.color = color;
  }

  /** Set the item associated with this node. */
  public void setItem(E item) {
    this.item = item;
  }

  /** Set the parent of this node. */
  public void setParent(RedBlackNode<E> parent) {
    this.parent = parent;
  }

  /** Make this node red. */
  public void setRed() {
    color = RED;
  }
  
}
