/**
 * Perceptron demonstration
 *
 * Input file must look like:
 *
 *    # comment line (ignored)
 *    n t d
 *    ... t lines of training examples, n+1 values per line
 *    ... d lines of test data examples, n+1 values per line
 *
 * where n is the number of variables input to the perceptron
 * (not including the bias input), t is the number of training 
 * examples, d is the number of test examples. 
 *
 * In this version of the program, the comment line must be
 * present even if it is empty; the "n t d" values go on line 2.
 *
 * The last entry on each of the t+d example lines should be 
 * an integer 1 or -1; the first n entries are double and
 * represent the input variable values for each example.
 */
import java.util.*;

public class Perceptron {

  public static void main(String[] args) {
    Scanner in = new Scanner(System.in); // input file
    Random rng = new Random(); // for initially generating weights

    // Read in the data file:
    in.nextLine(); // skip over comment line
    int n = in.nextInt(); // # of variables
    int t = in.nextInt(); // # of training examples
    int d = in.nextInt(); // # of test data values

    double c = .09; // learning constant

    double w[] = new double[n+1];        // perceptron weights
    double train[][] = new double[t][n]; // training inputs
    int desired[] = new int[t];          // one output for each input

    // Read in the training data and the desired outputs:
    for (int i = 0; i < t; i++) {
      for (int j = 0; j < n; j++) {
        train[i][j] = in.nextDouble();
      }
      desired[i] = in.nextInt();
    }

    // Randomly set the weights (final weight is for bias input "1")
    for (int i = 0; i <= n; i++)
      w[i] = rng.nextDouble()*11-5.0;

    // Train the perceptron!

    boolean trained = false; // true when all training examples are correct
    int count = 0; // count tries to prevent infinite looping

    while (count < 5000 && !trained) {
      trained = true;
      // for each training example:
      for (int i = 0; i < t; i++) {

        // compute perceptron result on this example:
        double sum = w[n]; // bias value
        for (int j = 0; j < n; j++) {
          sum += train[i][j]*w[j];     // weighted sum of inputs
        }
        double result = 0;
        if (sum >= 0) result = 1;     // threshold
        else result = -1;

        // If not correct, we need another round of training:
        if (result != desired[i])
          trained = false;

        // Apply the perceptron learning rule:
        for (int j = 0; j < n; j++) {
          w[j] += c*(desired[i] -result)*train[i][j];
        }
        w[n] += c*(desired[i]-result); // bias value
        count++;
      }
    }

    // Was training successful?
    if (count >= 5000)
      System.out.println("Gave up after 5000 training cycles");
    else
      System.out.println("Trained after " + count + " cycles");

    // Print out final weights:
    // SPECIAL CASE: if n = 2, print in a format suitable for R:
    if (n == 2) {
      System.out.println("y = (" + (-w[0])+"*x +" + (-w[2]) + ")/"+w[1]);
    }
    else {
      System.out.println("Weights (bias = last):");
      for (int i = 0; i <= n; i++)
        System.out.println(w[i]);
    }

    // Evaluate on test data:
    System.out.println("Trying " + d + " test inputs:");

    // For each test example:
    for (int i = 0; i < d; i++) {

      // Read in test data and compute perceptron result on 
      // this data:
      double sum = w[n];
      for (int j = 0; j < n; j++) {
        double x = in.nextDouble();
        sum += x*w[j];
      }
      int result = 0;
      if (sum >= 0) result = 1;
      else result = -1;

      // Read in correct result and see if perceptron agrees:
      int des = in.nextInt();
      if (des != result)
        System.out.println("Failed on test " + i);
    }
  }
}
