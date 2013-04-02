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
import java.util.Scanner;

/** A run of lines used by the ExternalSort program. */
public class ExternalSortRun {

  /** Number of lines left in this run, possibly an overestimate. */
  private int count;

  /** The next available line, if any. */
  private String next;

  /** The Scanner from which the lines are drawn. */
  private Scanner scanner;

  /** Up to maxLength lines will be drawn from scanner. */
  public ExternalSortRun(Scanner scanner, int maxLength) {
    count = maxLength;
    this.scanner = scanner;
    if (scanner.hasNext()) {
      next = scanner.nextLine();
    } else {
      count = 0;
    }
  }

  /** Return true if there is another line in this run. */
  public boolean hasNext() {
    return count > 0;
  }

  /** Return the next available line and advance the run. */
  public String next() {
    String result = next;
    count--;
    if (count > 0) {
      if (scanner.hasNext()) {
        next = scanner.nextLine();
      } else {
        count = 0;
      }
    }
    return result;
  }

  /** Return the next available line but do not advance the run. */
  public String peek() {
    return next;
  }
  
}
