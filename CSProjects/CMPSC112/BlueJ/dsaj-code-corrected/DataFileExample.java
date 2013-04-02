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

/** Example of storing data in binary format. */
public class DataFileExample {

  /**
   * If an int is provided on the command line, store it in
   * number.data.  Otherwise, read an int from number.data
   * and print it.
   */
  public static void main(String[] args) throws IOException {
    File file = new File("number.data");
    if (args.length > 0) {
      ObjectOutputStream out
        = new ObjectOutputStream(new FileOutputStream(file));
      out.writeInt(Integer.parseInt(args[0]));
      out.close();
    } else {
      ObjectInputStream in
        = new ObjectInputStream(new FileInputStream(file));
      System.out.println(in.readInt());
    }
  }
  
}
