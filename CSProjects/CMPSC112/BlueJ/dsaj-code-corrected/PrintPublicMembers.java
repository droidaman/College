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

/** Print all lines containing the substring "public". */
public class PrintPublicMembers {

  /** Run on the file specified as args[0]. */
  public static void main(String[] args) throws IOException {
    File file = new File(args[0]);
    Scanner in = new Scanner(file);
    while (in.hasNextLine()) {
      String line = in.nextLine();
      if (line.contains("public")) {
        System.out.println(line);
      }
    }
  }
  
}
