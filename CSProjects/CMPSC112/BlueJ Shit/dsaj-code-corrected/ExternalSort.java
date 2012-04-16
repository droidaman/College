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

/** Externally sort the lines of a text file. */
public class ExternalSort {

  /** Maximum number of lines stored in memory at any one time. */
  public static final int CAPACITY = 3;

  /**
   * Merge runs, of maximum length runLength, in the files in[0] and
   * in[1], into runs twice this length in out[0] and out[1].
   * Return true if both output files are needed.
   */
  protected static boolean merge(File[] in, File[] out, int runLength)
    throws IOException {
    boolean bothOutputsUsed = false;
    Scanner[] input = {new Scanner(new FileInputStream(in[0])),
                       new Scanner(new FileInputStream(in[1]))};
    PrintWriter[] output = {new PrintWriter(out[0]),
                            new PrintWriter(out[1])};
    int i = 0;
    while (input[0].hasNext() || input[1].hasNext()) {
      ExternalSortRun[] runs
        = {new ExternalSortRun(input[0], runLength),
           new ExternalSortRun(input[1], runLength)};
      if (i == 1) {
        bothOutputsUsed = true;
      }
      while ((runs[0].hasNext()) || (runs[1].hasNext())) {
        if ((!runs[1].hasNext())
            || ((runs[0].hasNext())
                && (runs[0].peek().compareTo(runs[1].peek()) < 0))) {
          output[i].println(runs[0].next());
        } else {
          output[i].println(runs[1].next());
        }
      }
      i = 1 - i;
    }
    output[0].close();
    output[1].close();
    return bothOutputsUsed;
  }

  /** Sort the file in and write the output to out. */
  public static void sort(File in, File out) throws IOException {
    File[][] files = {{new File(in.getPath() + ".a0"),
                       new File(in.getPath() + ".a1")},
                      {new File(in.getPath() + ".b0"),
                       new File(in.getPath() + ".b1")}};
    split(in, files[0]);
    int runLength = CAPACITY;
    int i = 0;
    while (merge(files[i], files[1 - i], runLength)) {
      i = 1 - i;
      runLength *= 2;
    }
    files[1 - i][0].renameTo(out);
    for (i = 0; i < 2; i++) {
      for (int j = 0; j < 2; j++) {
        files[i][j].delete();
      }
    }
  }

  /**
   * Split in into runs of maximum length CAPACITY and write them
   * to out[0] and out[1].
   */
  protected static void split(File in, File[] out) throws IOException {
    Scanner input = new Scanner(new FileInputStream(in));
    PrintWriter[] output = {new PrintWriter(out[0]),
                            new PrintWriter(out[1])};
    int i = 0;
    while (input.hasNext()) {
      SortableArrayList<String> run = new SortableArrayList<String>();
      for (int j = 0; (input.hasNext()) && (j < CAPACITY); j++) {
        run.add(input.nextLine());
      }
      run.insertionSort();
      for (String s : run) {
        output[i].println(s);
      }
      i = 1 - i;
    }
    output[0].close();
    output[1].close();
  }

  /**
   * Sort the file args[0] and write the output to args[1].
   */
  public static void main(String[] args) throws IOException {
    sort(new File(args[0]), new File(args[1]));
  }
  
}
