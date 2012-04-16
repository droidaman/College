import java.util.*;

public class GenRandEight {
  public static void main(String[] args) {
    if (args.length < 1) {
      System.out.println("Usage: java GenRandEight n\n"+
          "where n = number of puzzles");
      System.exit(1);
    }
    int n = Integer.parseInt(args[0]);
    Random rng = new Random();

    char[] puzzle = {'1','2','3','4','5','6','7','8'};
    for (int i = 0; i < n; i++) {
      boolean odd = false;
      for (int j = 7; j >= 1; j--) {
        int p = rng.nextInt(j+1);
        if (p!=j) {
          char temp = puzzle[j];
          puzzle[j] = puzzle[p];
          puzzle[p] = temp;
          odd = !odd;
        }
      }
      if (odd) {
        int p = rng.nextInt(7);
        char temp = puzzle[7];
        puzzle[7] = puzzle[p];
        puzzle[p] = temp;
      }
      int b = rng.nextInt(9);
      int k = 0;
      for (int j = 0; j < 9; j++) {
        if (j == b) {
          System.out.print("_");
        }
        else {
          System.out.print(puzzle[k]);
          k++;
        }
      }
      System.out.println();
    }
  }
}
      
