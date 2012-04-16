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
/** A red-black tree of Comparables. */
public class RedBlackTree<E extends Comparable<E>>
  implements Set<E> {

  /** The root node of this tree. */
  private RedBlackNode<E> root;

  /** All "null" node references actually point to this node. */
  private RedBlackNode<E> sentinel;

  /** The tree is initially empty. */
  public RedBlackTree() {
    sentinel = new RedBlackNode<E>();
    root = sentinel;
  }
  
  public void add(E target) {
    RedBlackNode<E> targetNode
      = new RedBlackNode<E>(target, sentinel);
    RedBlackNode<E> parent = sentinel;
    RedBlackNode<E> node = root;
    int comparison = 0;
    while (node != sentinel) {
      parent = node;
      comparison = compare(targetNode, node);
      if (comparison == 0) {
        return;
      }
      node = node.getChild(comparison);
    }
    linkParentAndChild(parent, targetNode, comparison);
    if (parent == sentinel) {
      root = targetNode;
    }
    repairAfterInsertion(targetNode);
  }

  public boolean contains(E target) {
    RedBlackNode<E> node = root;
    while (node != sentinel) {
      int comparison = target.compareTo(node.getItem());
      if (comparison == 0) {
        return true;
      } else {
        node = node.getChild(comparison);
      }
    }
    return false;
  }

  /**
   * Return a negative number if child is to the left of parent,
   * positive otherwise.
   */
  protected int compare(RedBlackNode<E> child, RedBlackNode<E> parent) {
    if (child == parent.getLeft()) {
      return -1;
    }
    if (child == parent.getRight()) {
      return 1;
    }
    return child.getItem().compareTo(parent.getItem());
  }

  /** Return the inorder successor of node. */
  protected RedBlackNode<E> inorderSuccessor(RedBlackNode<E> node) {
    RedBlackNode<E> descendant = node.getRight();
    while (descendant.getLeft() != sentinel) {
      descendant = descendant.getLeft();
    }
    return descendant;
  }

  /**
   * Set child to be the left (if dir is negative) or right
   * (otherwise) child of parent.
   */
  protected void linkParentAndChild(RedBlackNode<E> parent,
                                    RedBlackNode<E> child,
                                    int dir) {
    parent.setChild(dir, child);
    child.setParent(parent);
  }

  public void remove(E target) {
    RedBlackNode<E> node = root;
    while (node != sentinel) {
      int comparison = target.compareTo(node.getItem());
      if (comparison == 0) {
        if ((node.getLeft() == sentinel)
            || (node.getRight() == sentinel)) {
          spliceOut(node);
        } else {
          RedBlackNode<E> successor = inorderSuccessor(node);
          node.setItem(successor.getItem());
          spliceOut(successor);
        }
        return;
      } else {
        node = node.getChild(comparison);
      }
    }
  }

  /** Restore the tree to validity after a deletion. */
  protected void repairAfterDeletion(RedBlackNode<E> node) {
    while ((node != root) && (node.isBlack())) {
      RedBlackNode<E> parent = node.getParent();
      int comparison = compare(node, parent);
      RedBlackNode<E> sibling = parent.getChild(-comparison);
      if (sibling.isRed()) {    // Red sibling
        sibling.setBlack();
        parent.setRed();
        rotate(-comparison, parent);
        sibling = node.getParent().getChild(-comparison);
      }
      if (sibling.hasTwoBlackChildren()) { // Two black children
        sibling.setRed();
        node = node.getParent();
      } else {
        if (sibling.getChild(-comparison).isBlack()) {
		  // Red inner child
          sibling.getChild(comparison).setBlack();
          sibling.setRed();
          rotate(comparison, sibling);
          sibling = parent.getChild(-comparison);
        }
        sibling.setColor(parent.getColor()); // Red outer child
        parent.setBlack();
        sibling.getChild(-comparison).setBlack();
        rotate(-comparison, parent);
        node = root;
      }
    }
    node.setBlack();
  }
  
  /** Restore the tree to validity after inserting a node. */
  protected void repairAfterInsertion(RedBlackNode<E> node) {
    while (node.getParent().isRed()) {
      RedBlackNode<E> parent = node.getParent();
      RedBlackNode<E> grandparent = parent.getParent();
      RedBlackNode<E> aunt
        = grandparent.getChild(-compare(parent, grandparent));
      if (aunt.isRed()) {       // Red aunt
        parent.setBlack();
        aunt.setBlack();
        grandparent.setRed();
        node = grandparent;
      } else {
        int nodeComparison = compare(node, parent);
        int parentComparison = compare(parent, grandparent);
        if (nodeComparison != parentComparison) { // Inner child
          rotate(nodeComparison, parent);
          node = parent;
        }
        node.getParent().setBlack(); // Outer child
        node.getParent().getParent().setRed();
        rotate(parentComparison, node.getParent().getParent());
      }
    }
    root.setBlack();
  }

  /**
   * Move node's left (if dir is negative) or right (otherwise)
   * child up into its place.  Move node down on the other side.
   */
  protected void rotate(int dir, RedBlackNode<E> node) {
    RedBlackNode<E> child = node.getChild(dir);
    RedBlackNode<E> parent = node.getParent();
    if (node.getParent() == sentinel) {
      root = child;
    }
    linkParentAndChild(node, child.getChild(-dir), dir);
    linkParentAndChild(parent, child, compare(node, parent));
    linkParentAndChild(child, node, -dir);
  }

  public int size() {
    return size(root);
  }
  
  /** Return the size of the subtree rooted at node. */
  protected int size(RedBlackNode<E> node) {
    if (node == sentinel) {
      return 0;
    } else {
      return 1 + size(node.getLeft()) + size(node.getRight());
    }
  }

  /** Splice node out of the tree. */
  protected void spliceOut(RedBlackNode<E> node) {
    RedBlackNode<E> child;
    if (node.getLeft() != sentinel) {
      child = node.getLeft();
    } else {
      child = node.getRight();
    }
    linkParentAndChild(node.getParent(),
                       child,
                       compare(node, node.getParent()));
    if (node == root) {
      root = child;
    }
    if (node.isBlack()) {
      repairAfterDeletion(child);
    }
  }
        
}
