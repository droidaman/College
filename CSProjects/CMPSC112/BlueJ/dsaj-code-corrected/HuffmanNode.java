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
/** Node in a Huffman tree. */
public class HuffmanNode extends BinaryNode<Character>
  implements Comparable<HuffmanNode> {

  /** Frequency of this letter or set of letters. */
  private int count;

  /** Create a node with no children. */
  public HuffmanNode(char letter, int count) {
    super(letter);
    this.count = count;
  }

  /**
   * Create a node with two children.  Its count is the sum of
   * its children's counts.
   */
  public HuffmanNode(HuffmanNode left, HuffmanNode right) {
    super('?', left, right);
    this.count = left.count + right.count;
  }

  /** The comparison is based on the counts of the nodes. */
  public int compareTo(HuffmanNode that) {
    return count - that.count;
  }

}
