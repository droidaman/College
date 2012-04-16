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


// Introduced in Chapter 17
import java.io.*;

/** Node in a BTree. */
public class BTreeNode implements Serializable {

  /** Minimum number of children.  Max is twice this. */
  public static final int HALF_MAX = 2;

  /** Items stored in this node. */
  private java.util.ArrayList<Integer> data;

  /** Ids of children of this node. */
  private java.util.ArrayList<Integer> children;

  /** Number identifying this node. */
  private int id;

  /**
   * The new node has no data or children yet.  The argument
   * leaf specifies whether it is a leaf.
   */
  public BTreeNode(boolean leaf) {
    this.id = IdGenerator.nextId();
    data = new java.util.ArrayList<Integer>((HALF_MAX * 2) - 1);
    if (!leaf) {
      children = new java.util.ArrayList<Integer>(HALF_MAX * 2);
    }
  }

  /**
   * Create a new node that has two children, each containing
   * half of the items from child.  Write the children to disk.
   */
  public BTreeNode(BTreeNode child) {
    this(false);
    children.add(child.getId());
    splitChild(0, child);
  }

  /**
   * Add target to the subtree rooted at this node.  Write nodes
   * to disk as necessary.
   */
  public void add(int target) {
    BTreeNode node = this;
    while (!(node.isLeaf())) {
      double d = node.indexOf(target);
      int i = (int)d;
      if (i == d) {
        return;
      } else {
        BTreeNode child = node.getChild(i);
        if (child.isFull()) {
          node.splitChild(i, child);
        } else {
          node.writeToDisk();
          node = child;
        }
      }
    }
    node.addLocally(target);
    node.writeToDisk();
  }
  
  /**
   * Add target to this node, which is assumed to not be full.
   * Make room for an extra child to the right of target.
   */
  protected void addLocally(int target) {
    double d = indexOf(target);
    int i = (int)d;
    if (i != d) {
      data.add(i, target);
      if (!isLeaf()) {
        children.add(i + 1, 0);
      }
    }
  }

  /**
   * Create and return a new node which will be a right sibling
   * of this one.  Half of the items and children in this node are
   * copied to the new one.
   */
  protected BTreeNode createRightSibling() {
    BTreeNode sibling = new BTreeNode(isLeaf());
    for (int i = HALF_MAX; i < (HALF_MAX * 2) - 1; i++) {
      sibling.data.add(data.remove(HALF_MAX));
    }
    if (!isLeaf()) {
      for (int i = HALF_MAX; i < HALF_MAX * 2; i++) {
        sibling.children.add(children.remove(HALF_MAX));
      }
    }
    sibling.writeToDisk();
    return sibling;
  }

  /** Delete the file containing this node from the disk. */
  public void deleteFromDisk() {
    try {
      File file = new File(BTree.DIR + "b" + id + ".node");
      file.delete();
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

  /**
   * Read the ith child of this node from the disk and return it.
   * If this node is a leaf, return null.
   */
  public BTreeNode getChild(int index) {
    if (isLeaf()) {
      return null;
    } else {
      return readFromDisk(children.get(index));
    }
  }

  /** Return the id of this node. */
  public int getId() {
    return id;
  }

  /**
   * Return the index of target in this node if present.  Otherwise,
   * return the index of the child that would contain target,
   * plus 0.5.
   */
  public double indexOf(int target) {
    for (int i = 0; i < data.size(); i++) {
      if (data.get(i) == target) {
        return i;
      }
      if (data.get(i) > target) {
        return i + 0.5;
      }
    }
    return size() - 0.5;
  }

  /** Return true if this node is full. */
  public boolean isFull() {
    return size() == HALF_MAX * 2;
  }

  /** Return true if this node is a leaf. */
  public boolean isLeaf() {
    return children == null;
  }

  /** Return true if this node is minimal. */
  public boolean isMinimal() {
    return size() == HALF_MAX;
  }

  /**
   * Merge this node's ith and (i+1)th children (child and sibling,
   * both minimal), moving the ith item down from this node.
   * Delete sibling from disk.
   */
  protected void mergeChildren(int i, BTreeNode child, BTreeNode sibling) {
    child.data.add(data.remove(i));
    children.remove(i + 1);
    if (!(child.isLeaf())) {
      child.children.add(sibling.children.remove(0));
    }
    for (int j = 0; j < HALF_MAX - 1; j++) {
      child.data.add(sibling.data.remove(0));
      if (!(child.isLeaf())) {
        child.children.add(sibling.children.remove(0));
      }
    }
    sibling.deleteFromDisk();
  }

  /** Read from disk and return the node with the specified id. */
  public static BTreeNode readFromDisk(int id) {
    try {
      ObjectInputStream in
        = new ObjectInputStream
        (new FileInputStream(BTree.DIR + "b" + id + ".node"));
      return (BTreeNode)(in.readObject());
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
      return null;
    }
  }

  /**
   * Remove target from the subtree rooted at this node.
   * Write any modified nodes to disk.
   */
  public void remove(int target) {
    double d = indexOf(target);
    int i = (int)d;
    if (isLeaf()) {
      if (i == d) {
        data.remove(i);
        writeToDisk();
      }
    } else if (i == d) {
      removeFromInternalNode(i, target);
    } else {
      removeFromChild(i, target);
    }
  }

  /**
   * Remove target from the subtree rooted at child i of this node.
   * Write any modified nodes to disk.
   */
  protected void removeFromChild(int i, int target) {
    BTreeNode child = getChild(i);
    if (child.isMinimal()) {
      if (i == 0) {             // Target in first child
        BTreeNode sibling = getChild(1);
        if (sibling.isMinimal()) {
          mergeChildren(i, child, sibling);
        } else {
          rotateLeft(i, child, sibling);
        }
      } else if (i == size() - 1) { // Target in last child
        BTreeNode sibling = getChild(i - 1);
        if (sibling.isMinimal()) {
          mergeChildren(i - 1, sibling, child);
          child = sibling;
        } else {
          rotateRight(i - 1, sibling, child);
        }
      } else {                  // Target in middle child
        BTreeNode rightSibling = getChild(i + 1);
        BTreeNode leftSibling = getChild(i - 1);
        if (!(rightSibling.isMinimal())) {
          rotateLeft(i, child, rightSibling);
        } else if (!(leftSibling.isMinimal())) {
          rotateRight(i - 1, leftSibling, child);
        } else {
          mergeChildren(i, child, rightSibling);
        }
      }
    }
    writeToDisk();
    child.remove(target);
  }

  /**
   * Remove the ith item (target) from this node.
   * Write any modified nodes to disk.
   */
  protected void removeFromInternalNode(int i, int target) {
    BTreeNode child = getChild(i);
    BTreeNode sibling = getChild(i + 1);
    if (!(child.isMinimal())) {
      data.set(i, child.removeRightmost());
      writeToDisk();
    } else if (!(sibling.isMinimal())) {
      data.set(i, sibling.removeLeftmost());
      writeToDisk();
    } else {
      mergeChildren(i, child, sibling);
      writeToDisk();
      child.remove(target);
    }
  }
  
  /**
   * Remove and return the leftmost element in the leftmost descendant
   * of this node.  Write any modified nodes to disk.
   */
  protected int removeLeftmost() {
    BTreeNode node = this;
    while (!(node.isLeaf())) {
      BTreeNode child = node.getChild(0);
      if (child.isMinimal()) {
        BTreeNode sibling = node.getChild(1);
        if (sibling.isMinimal()) {
          node.mergeChildren(0, child, sibling);
        } else {
          node.rotateLeft(0, child, sibling);
        }
      }
      node.writeToDisk();
      return child.removeLeftmost();
    }
    int result = node.data.remove(0);
    node.writeToDisk();
    return result;
  }
  
  /**
   * Remove and return the rightmost element in the rightmost
   * descendant of this node.  Write any modified nodes to disk.
   */
  protected int removeRightmost() {
    BTreeNode node = this;
    while (!(node.isLeaf())) {
      BTreeNode child = node.getChild(size() - 1);
      if (child.isMinimal()) {
        BTreeNode sibling = node.getChild(size() - 2);
        if (sibling.isMinimal()) {
          node.mergeChildren(size() - 2, sibling, child);
          child = sibling;
        } else {
          node.rotateRight(size() - 2, sibling, child);
        }
      }
      node.writeToDisk();
      return child.removeRightmost();
    }
    int result = node.data.remove(size() - 2);
    node.writeToDisk();
    return result;
  }

  /**
   * Child is the ith child of this node, sibling the (i+1)th.
   * Move one item from sibling up into this node, one from this
   * node down into child.  Pass one child from sibling to node.
   * Write sibling to disk.
   */
  protected void rotateLeft(int i, BTreeNode child,
		                   BTreeNode sibling) {
    child.data.add(data.get(i));
    if (!(child.isLeaf())) {
      child.children.add(sibling.children.remove(0));
    }
    data.set(i, sibling.data.remove(0));
    sibling.writeToDisk();
  }

  /**
   * Sibling is the ith child of this node, child the (i+1)th.
   * Move one item from sibling up into this node, one from this
   * node down into child.  Pass one child from sibling to node.
   * Write sibling to disk.
   */
  protected void rotateRight(int i, BTreeNode sibling,
		                    BTreeNode child) {
    child.data.add(0, data.get(i));
    if (!(child.isLeaf())) {
      child.children.add(0,
			            sibling.children.remove(sibling.size() - 1));
    }
    data.set(i, sibling.data.remove(sibling.size() - 2));
    sibling.writeToDisk();
  }

  /** Make this node a leaf if value is true, not a leaf otherwise. */
  public void setLeaf(boolean value) {
    if (value) {
      children = null;
    } else {
      children = new java.util.ArrayList<Integer>(HALF_MAX * 2);
    }
  }

  /** Return one plus the number of items in this node. */
  public int size() {
    return data.size() + 1;
  }

  /**
   * Split child, which is the full ith child of this node, into
   * two minimal nodes, moving the middle item up into this node.
   */
  protected void splitChild(int i, BTreeNode child) {
    BTreeNode sibling = child.createRightSibling();
    addLocally(child.data.remove(HALF_MAX - 1));
    child.writeToDisk();
    children.set(i + 1, sibling.getId());
  }
  
  /** Write this node to disk. */
  public void writeToDisk() {
    try {
      ObjectOutputStream out
        = new ObjectOutputStream
        (new FileOutputStream(BTree.DIR + "b" + id + ".node"));
      out.writeObject(this);
      out.close();
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
  }
  
}
