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
/** Huffman encoder/decoder. */
public class Huffman {

  /** The root of the Huffman tree. */
  private HuffmanNode root;

  /** Direct addressing table mapping characters to Strings. */
  private String[] table;

  /** The frequency distribution is in the code for this method. */
  public Huffman() {
    char[] letters = "bekprs_&".toCharArray();
    int[] counts = {2, 7, 1, 1, 1, 2, 2, 1};
    root = generateTree(letters, counts);
    table = new String[128];
    generateCodes(root, "");
  }

  /** Return the original version of a String encoded by encode(). */
  public String decode(String encodedMessage) {
    StringBuilder result = new StringBuilder();
    BinaryNode<Character> node = root;
    for (char c : encodedMessage.toCharArray()) {
      if (c == '0') {
        node = node.getLeft();
      } else if (c == '1') {
        node = node.getRight();
      }
      if (node.isLeaf()) {
        result.append(node.getItem());
        node = root;
      }
    }
    return result.toString();
  }

  /**
   * Return the bits of the encoded version of message, as a
   * human-readable String.
   */
  public String encode(String message) {
    StringBuilder result = new StringBuilder();
    for (char c : message.toCharArray()) {
      result.append(table[c] + " ");
    }
    return result.toString();
  }

  /** Generate the table of codes. */
  protected void generateCodes(BinaryNode<Character> root, String code) {
    if (root.isLeaf()) {
      table[root.getItem()] = code;
    } else {
      generateCodes(root.getLeft(), code + "0");
      generateCodes(root.getRight(), code + "1");
    }
  }

  /** Generate the Huffman tree. */
  protected HuffmanNode generateTree(char[] letters, int[] counts) {
    Heap<HuffmanNode> q = new Heap<HuffmanNode>();
    for (int i = 0; i < letters.length; i++) {
      q.add(new HuffmanNode(letters[i], counts[i]));
    }
    while (true) {
      HuffmanNode a = q.remove();
      if (q.isEmpty()) {
        return a;
      }
      HuffmanNode b = q.remove();
      q.add(new HuffmanNode(a, b));
    }
  }

  /** For testing purposes only. */
  public static void main(String[] args) {
    Huffman tree = new Huffman();
    for (int i = 0; i < 128; i++) {
      if (tree.table[i] != null) {
        System.out.println((char)i + " " + tree.table[i]);
      }
    }
    System.out.println(tree.encode("beekeepers_&_bees"));
    System.out.println(tree.decode(tree.encode("beekeepers_&_bees")));
  }
  
}
