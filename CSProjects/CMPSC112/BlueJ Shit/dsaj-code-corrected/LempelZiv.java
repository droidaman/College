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
import java.util.Scanner;

/** Lempel-Ziv compression of text. */
public class LempelZiv {

  /** Root of the digital search tree. */
  private DigitalNode<Integer> root;

  /** Direct-addressing table mapping codes to Strings. */
  private ArrayList<String> strings;

  /** Initialize the codes with ASCII values. */
  public LempelZiv() {
    root = new DigitalNode<Integer>(null);
    strings = new ArrayList<String>();
    for (char i = 0; i < 128; i++) {
      root.setChild(i, new DigitalNode<Integer>((int)i));
      strings.add("" + i);
    }
  }

  /**
   * Add a new code.  It represents the concatenation of the String
   * for the code at parent and the first character of the String for
   * code.
   */
  protected void addNewCode(DigitalNode<Integer> parent, int code) {
    if (parent != null) {
      char firstChar = strings.get(code).charAt(0);
      parent.setChild(firstChar,
                      new DigitalNode<Integer>(strings.size()));
      strings.add(strings.get(parent.getItem()) + firstChar);
    }
  }

  /** Read ints from in, write text to out. */
  public void decode(ObjectInputStream in, PrintWriter out)
    throws IOException {
    DigitalNode<Integer> parent = null;
    while (in.available() > 0) {
      int code = in.readInt();
      DigitalNode<Integer> node = root;
      String s = strings.get(code);
      for (char c : s.toCharArray()) {
        out.print(c);
        node = node.getChild(c);
      }
      addNewCode(parent, code);
      parent = node;
    }
    out.close();
  }

  /** Read text from in, write ints to out. */
  public void encode(Scanner in, ObjectOutputStream out)
    throws IOException {
    DigitalNode<Integer> parent = null;
    DigitalNode<Integer> node = root;
    while (in.hasNextLine()) {
      String line = in.nextLine() + "\n";
      for (int i = 0; i < line.length(); ) {
        DigitalNode<Integer> child = node.getChild(line.charAt(i));
        if (child == null) {
          int code = node.getItem();
          out.writeInt(code);
          addNewCode(parent, code);
          parent = node;
          node = root;
        } else {
          node = child;
          i++;
        }
      }
    }
    out.writeInt(node.getItem());
    out.close();
  }

  /** Test method. */
  public static void main(String[] args) throws IOException {
    {
      Scanner in = new Scanner(new File(args[0]));
      ObjectOutputStream out
        = new ObjectOutputStream
        (new FileOutputStream("compressed"));
      new LempelZiv().encode(in, out);
    }
    ObjectInputStream in
      = new ObjectInputStream
      (new FileInputStream("compressed"));
    PrintWriter out = new PrintWriter("uncompressed");
    new LempelZiv().decode(in, out);
  }
  
}
