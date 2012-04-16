/**
 * Hopfield network simulation
 * Braden Licastro
 * 04 April 2012
 *
 * Given a set of patterns in the form of 10-by-10 black and white images,
 * store these in a 100-node Hopfield network. Generate an input by
 * making random changes to one of the patterns, then feed this into
 * the network to see what pattern emerges.
 */
import java.util.*;

public class Hopfield {
  public static Scanner in;
  public static int pattern[][];
  public static int weight[][];
  public static int input[];
  public static int output[];
  public static Random rng;
  public static int numPatterns;

  public static void main(String[] args) {
    if (args.length < 3) {
      System.out.println("Usage: java Hopfield iter n err\nwhere:\n   iter = "
          +"number of iterations, n = number of tests, err = % error");
      System.exit(1);
    }
    final int ITER = Integer.parseInt(args[0]);
    final int N = Integer.parseInt(args[1]);
    final double ERR = Integer.parseInt(args[2])/100.0;

    in = new Scanner(System.in);
    rng = new Random();

 // MAKE SURE EACH PATTERN CONSISTS OF TEN STRINGS, EACH OF
 // WHICH CONTAINS ONLY '#'s OR SPACES.

    String p[][] = {

   {"##########",
    "##########",
    "##########",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   "},

   {"##      ##",
    " ##    ## ",
    "  ##  ##  ",
    "   ####   ",
    "    ##    ",
    "    ##    ",
    "   ####   ",
    "  ##  ##  ",
    " ##    ## ",
    "##      ##"},

   {"    ##    ",
    "   ####   ",
    "  ##  ##  ",
    " ##    ## ",
    "##      ##",
    "##      ##",
    " ##    ## ",
    "  ##  ##  ",
    "   ####   ",
    "    ##    "},

   {"###   ### ",
    "###   ### ",
    "###   ### ",
    "   ###   #",
    "   ###   #",
    "   ###   #",
    "###   ### ",
    "###   ### ",
    "###   ### ",
    "   ###   #"},

   {"XXX       ",
    " XXX      ",
    "  XXX     ",
    " XXX      ",
    "XXX    XXX",
    "      XXX ",
    "     XXX  ",
    "      XXX ",
    "       XXX",
    "          "},

   {"   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "   ####   ",
    "##########",
    "##########",
    "##########"},

   {"##########",
    "#  ####  #",
    "# ##  ## #",
    "###    ###",
    "##  ##  ##",
    "##  ##  ##",
    "###    ###",
    "# ##  ## #",
    "#  ####  #",
    "##########"},

   {"# # # # # ",
    " # # # # #",
    "# # # # # ",
    " # # # # #",
    "# # # # # ",
    " # # # # #",
    "# # # # # ",
    " # # # # #",
    "# # # # # ",
    " # # # # #"},

   {"###     ##",
    " ###   ## ",
    "  ### ##  ",
    " ###   ## ",
    "###    ###",
    " ##   ### ",
    "  ## ###  ",
    " ##   ### ",
    "##     ###",
    "##########"}};


    numPatterns = p.length;

    // Convert the patterns into vectors of +1, -1:
    pattern = new int[numPatterns][100];

    for (int i = 0; i < numPatterns; i++) {
      pattern[i] = convertToOnes(p[i]);
      System.out.println("\nPattern " + i+":"); 
      display(pattern[i]);
    }

    // Initialize weight matrix:
    weight = new int[100][100];
    for (int i = 0; i < 100; i++) {
      Arrays.fill(weight[i],0);
    }

    // Calculate the weight matrix as follows:
    // for each pattern, find the "outer product" of that
    // pattern and add it, element by element, to the weight matrix.

    for (int k = 0; k < numPatterns; k++) {
	int outer[][] = new int[100][100];
	for (int r = 0; r < 100; r++) {
		for (int c = r; c < 100; c++) {
			if (r == c)
			  outer[r][c] = 0;
			else {
			  outer[r][c] = pattern[k][r]*pattern[k][c];
			  outer[c][r] = outer[r][c];
			}
		}
	}
	for (int r2 = 0; r2 < 100; r2++) {
		for (int c2 = 0; c2 < 100; c2++) {
			weight[r2][c2] = weight[r2][c2] + outer[r2][c2];
		}
	}
    }

    // Generate N inputs by randomly choosing N patterns and
    // modifying each one. Approximately ERR % of all pixels 
    // are different from the original pattern.
    for (int count = 0; count < N; count++) {
      input = new int[100];
      int m = rng.nextInt(numPatterns);
      for (int i = 0; i < 100; i++) {
          if (rng.nextDouble() < ERR)
            input[i] = -pattern[m][i]; // flip the pixel
          else
            input[i] = pattern[m][i];
      }
  
      System.out.println("\nInput: (generated from pattern "+m+"):"); 
      display(input);
  
      // EVALUATE THE HOPFIELD NETWORK ON THE NOISY INPUT VECTOR:

      // Iterate through the network, feeding outputs back as inputs:
      for (int z = 0; z < ITER; z++) {
        output = new int[100];
        for (int i = 0; i < 100; i++) {
          output[i] = 0;
          for (int j = 0; j < 100; j++) {
            output[i] += weight[i][j]*input[j];
          }
        }

        // Convert output into -1, +1 for use as input in next
        // iteration of the algorithm
        for (int i = 0; i < 100; i++)
          if (output[i] > 0)
            input[i] = 1;
          else if (output[i] < 0)
            input[i] = -1;
          // If output is zero, leave input alone
      }
  
      // Display result (can't use "display" here, since
      // "output" array may not contain -1, +1):
      System.out.println("\nOutput:"); 
      for (int j = 0; j < 10; j++) {
        for (int k = 0; k < 10; k++) {
          if (output[10*j+k] < 0)
           System.out.print(".");
          else if (output[10*j+k] > 0)
           System.out.print("#");
          else
           System.out.print("?");
        }
        System.out.println();
      }
    }
  } // end main



  /**
   * Convert a black-and-white image, represented as an array of 
   * Strings, into a vector of -1, +1.
   *
   * @param	pat	an array of Strings representing an image
   * @return	a linear array of pixels, where +1=black, -1=white
   */
  public static int[] convertToOnes(String[] pat) {
    int[] pattern = new int[100];
    for (int j = 0; j < 100; j++) {
      if  (pat[j/10].charAt(j%10) == ' ')
        pattern[j] = -1;
      else
        pattern[j] = 1;
    }
    return pattern;
  }


  /**
   * Display a 100-element pattern vector as a 10 by 10 image.
   *
   * @param	pat	a vector of -1, +1 values
   */
  public static void display(int[] pat) {
    for (int j = 0; j < 10; j++) {
      for (int k = 0; k < 10; k++) {
        if (pat[10*j+k] == -1)
         System.out.print("."); // '.' shows up better than space
        else
         System.out.print("#");
      }
      System.out.println();
    }
  }
}
