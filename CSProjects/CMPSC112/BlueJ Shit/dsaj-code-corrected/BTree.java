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

/** BTree storing many ints on disk. */
public class BTree implements Serializable {

  /** Directory where files are stored. */
  public static final String DIR
    = BTree.class.getProtectionDomain().getCodeSource()
    .getLocation().getFile() + File.separator;

  /** Id number of the root node. */
  private int rootId;

  /** A new BTree is initially empty. */
  public BTree() {
    BTreeNode root = new BTreeNode(true);
    rootId = root.getId();
    root.writeToDisk();
    writeToDisk();
  }

  /** Add target to this BTree and write any modified nodes to disk. */
  public void add(int target) {
    BTreeNode root = BTreeNode.readFromDisk(rootId);
    if (root.isFull()) {
      BTreeNode parent = new BTreeNode(root);
      rootId = parent.getId();
      writeToDisk();
      parent.add(target);
    } else {
      root.add(target);
    }
  }

  /** Return true if this BTree contains target. */
  public boolean contains(int target) {
    BTreeNode node = BTreeNode.readFromDisk(rootId);
    while (node != null) {
      double d = node.indexOf(target);
      int i = (int)d;
      if (i == d) {
        return true;
      } else {
        node = node.getChild(i);
      }
    }
    return false;
  }

  /** Read a previously saved BTree from disk. */
  public static BTree readFromDisk() {
    try {
      ObjectInputStream in
        = new ObjectInputStream
        (new FileInputStream(DIR + "btree"));
      return (BTree)(in.readObject());
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
      return null;
    }
  }

  /** Remove target from this BTree. */
  public void remove(int target) {
    BTreeNode root = BTreeNode.readFromDisk(rootId);
    root.remove(target);
    if ((root.size() == 1) && (!(root.isLeaf()))) {
      BTreeNode child = root.getChild(0);
      root.deleteFromDisk();
      rootId = child.getId();
      writeToDisk();
    }
  }

  /** Write this BTree to disk. */
  public void writeToDisk() {
    try {
      ObjectOutputStream out
        = new ObjectOutputStream
        (new FileOutputStream(DIR + "btree"));
      out.writeObject(this);
      out.close();
    } catch (Exception e) {
      e.printStackTrace();
      System.exit(1);
    }
  }

}
