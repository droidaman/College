/**
 * Generate random data for testing "Perceptron.java"
 *
 * User must supply values for n (number of inputs), t
 * (number of training examples), and d (number of test
 * examples) on the command line, e.g.,
 *
 *     java PerceptronGen 5 50 25
 *
 * creates data for a perceptron with 5 inputs (plus bias input),
 * 50 training examples, and 25 test examples.
 */

import java.util.*;

public class PerceptronGen {
  public static void main(String[] args) {
    Random rng = new Random();
    int n = Integer.parseInt(args[0]); // # of variables
    int t = Integer.parseInt(args[1]); // # of training examples
    int d = Integer.parseInt(args[2]); // # of test data values

    // Create random coefficient array for the "unknown"
    // linear function that is to be learned (last value is the constant).
    // Print these as a comment at beginning:
    double w[] = new double[n+1];
    System.out.print("#");
    for (int i = 0; i <= n; i++) {
      w[i] = rng.nextDouble()*51-25.0;
      System.out.print(" "+w[i]);
    }
    System.out.println();

    // Print out values of n, t, and d:
    System.out.println(n + " " + t + " " + d);

    // Generate and print random training inputs and correct 
    // classifications:
    for (int i = 0; i < t; i++) {
      double sum = w[n]; // bias weight
      for (int j = 0; j < n; j++) {
        double x = rng.nextDouble()*21-10.0;
        System.out.print(x + " ");
        sum += x*w[j];
      }
      if (sum >= 0.0)
        System.out.println("1");
      else
        System.out.println("-1");
    }

    // Generate and print random testing inputs and correct 
    // classifications:
    for (int i = 0; i < d; i++) {
      double sum = w[n]; // bias weight
      for (int j = 0; j < n; j++) {
        double x = rng.nextDouble()*21-10.0;
        System.out.print(x + " ");
        sum += x*w[j];
      }
      if (sum >= 0.0)
        System.out.println("1");
      else
        System.out.println("-1");
    }
  }
}
