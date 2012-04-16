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

/** Generates unique id numbers, even across multiple sessions. */
public class IdGenerator {

  /** File in which the next available id is stored. */
  public static final File FILE = new File(BTree.DIR + "id");

  /** Return the next available id number. */
  public static int nextId() {
    try {
      int result;
      if (FILE.exists()) {
        ObjectInputStream in
          = new ObjectInputStream(new FileInputStream(FILE));
        result = in.readInt();
      } else {
        result = 0;
      }
      ObjectOutputStream out
        = new ObjectOutputStream(new FileOutputStream(FILE));
      out.writeInt(result + 1);
      out.close();
      return result;
    } catch (IOException e) {
      e.printStackTrace();
      System.exit(1);
      return 0;
    }
  }

  public static void main(String[] args) {
    System.out.println(nextId());
  }
}
