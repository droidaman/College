import java.util.*;
import java.io.*;

/**
 * A class that implements a simple genetic algorithm operating on
 * bit strings. Interpretation of the strings and evaluation of
 * fitness is completely taken care of in the "BitString" class.
 *
 * Optimization is always "maximizing"; to minimize, negate the
 * value of the fitness function in the "calcFitness" method o
 * the "BitString" class.
 *
 * The class implements one-point crossover and tournament selection.
 * The user controls most of the parameters (crossover probability,
 * population size, etc.)
 *
 * This version includes the ability to optionally append data
 * to a file for later statistical processing.
 *
 * Usage: java Proj filename
 *    where "filename" is the optional name of an output file.
 *    If no file is given, the program behaves the same as program
 *    SimpleGA. If a filename is given, information about all the
 *    parameters, together with the best fitness found, is appended
 *    to the end of the file (or the file is created if it does not
 *    exist). Only one line of output is appended to the file per run;
 *    this is not affected by the VERBOSE paramater.
 *
 *    Terminal output is the same as for SimpleGA, depending
 *    on the value of VERBOSE.
 *
 * @author	Bob Roos
 * @version	11 April 2012
 */
public class Proj {
  // GA parameters:
  public static int POPSIZE;           // #bit strings in population
  public static double CROSSOVER_PROB; // prob. that 2 parents are mated
  public static double MUTATION_PROB;  // prob. of changing each bit
  public static int ELITISM_PRESERVE;  // #bit strings to carry over unchanged
  public static int GENERATIONS;       // #generations to run
  public static int LENGTH;            // length of the bit strings
  public static int VERBOSE;           // controls amount of output
  public static int TOURNAMENT_SIZE;   // #bit strings competing in selection

  public static Random rng; // used in selection, crossover, and mutation

  public static BitString[] pop; // The population of bit strings

  public static FileOutputStream datafile;
  public static PrintStream out;
  public static boolean savetofile;

  /**
   * This sets up and runs the genetic algorithm.
   *
   * @param	args	contains optional filename
   */
  public static void main(String[] args) throws IOException {
    savetofile = false;
    if (args.length == 1) { // We want to save results to a file
      String fname = args[0];
      datafile = new FileOutputStream(fname,true);
      out = new PrintStream(datafile);
      savetofile = true;
    }
    rng = new Random();
    
    // Ask user to supply values for parameters:
    setup();

    // Variables to save "best in each generation"
    int maxFitLocation = 0; // location of most fit element in current gen.
    double maxFitness = -Double.MAX_VALUE; // max. fitness in current gen.

    // Variables to save "best over all generations so far":
    BitString bestSoFar = null;  // best element found so far
    double maxSoFar = -Double.MAX_VALUE; // fitness of best 

    // Create initial population:
    pop = new BitString[POPSIZE];

    for (int i = 0; i < POPSIZE; i++) {
      pop[i] = new BitString(LENGTH);
      pop[i].randomFill();
      double f = pop[i].fitness();
      if (f > maxFitness) {
         maxFitLocation = i;
         maxFitness = f;
      }
      if (f > maxSoFar) {
        bestSoFar = new BitString(new String(pop[i].item()));
        maxSoFar = f;
      }
    }

    // Print out the first generation (unless VERBOSE is off):
    int gen = 0;
    if (VERBOSE==1) displayPop(gen,maxFitLocation,bestSoFar);


    /*************************************
     * Main evolution loop:
     ************************************/

    for (gen = 1; gen <= GENERATIONS; gen++) {
      Arrays.sort(pop); // not essential; makes elitism easier

      // Variables to save best in generation:
      maxFitness = -Double.MAX_VALUE;
      maxFitLocation = 0;

      // Initialize new population:
      BitString[] newPop = new BitString[POPSIZE];

      // Preserve the best ELITISM_PRESERVE values (possibly none)
      // from previous gen:
      for (int i = 0; i < ELITISM_PRESERVE; i++) {
        newPop[i] = new BitString(new String(pop[POPSIZE-i-1].item()));
        double f = newPop[i].fitness();
        if (f > maxFitness) {
          maxFitness = f;
          maxFitLocation = i;
        }
        if (f > maxSoFar) {
          bestSoFar = new BitString(new String(newPop[i].item()));
          maxSoFar = f;
        }
      }

      // Fill in rest with selection, crossover, mutation:
      for (int i = ELITISM_PRESERVE; i < POPSIZE; i = i+2) {
        // Select two potential parents:
        BitString p1 = select();
        BitString p2 = select();

        // Decide whether or not to cross them over:
        if (rng.nextDouble() < CROSSOVER_PROB) {
          BitString[] children = crossover(p1,p2);
          p1 = children[0];
          p2 = children[1];
        }

        // Perform mutation on the two selected or crossed-over items:
        newPop[i] = mutate(p1);
        double f = newPop[i].fitness();
        if (f > maxFitness) {
          maxFitness = f;
          maxFitLocation = i;
        }
        if (f > maxSoFar) {
          bestSoFar = new BitString(new String(newPop[i].item()));
          maxSoFar = f;
        }

        // If # empty slots was odd, last item not used:
        if (i < POPSIZE-1) {
          newPop[i+1] = mutate(p2);
          f = newPop[i+1].fitness();
          if (f > maxFitness) {
            maxFitness = f;
            maxFitLocation = i+1;
          }
          if (f > maxSoFar) {
            bestSoFar = new BitString(new String(newPop[i+1].item()));
            maxSoFar = f;
          }
        }
      }

      // We've finished filling in the new population:
      pop = newPop;
      if (VERBOSE==1) displayPop(gen,maxFitLocation,bestSoFar);
    }

    // Even if VERBOSE is off, be sure to print out final results:
    displayPop(gen,maxFitLocation,bestSoFar);

    // Optionally save parameters and final result to a file:
    if (savetofile) {
      out.println(POPSIZE + "\t" + CROSSOVER_PROB + "\t" + MUTATION_PROB
                   + "\t" + TOURNAMENT_SIZE + "\t" + ELITISM_PRESERVE 
                   + "\t" + GENERATIONS + "\t" + bestSoFar.fitness());
      out.close();
    }
  }


  /**
   * Performs one-point crossover of bit strings by choosing a
   * random position and swapping the "tails" of the two bit strings
   *
   * @param	p1	first parent
   * @param	p2	second parent
   *
   * @return	an array containing the two children bit strings
   */
  public static BitString[] crossover(BitString p1, BitString p2) {
    String s1 = ""; // first child
    String s2 = ""; // second child

    /*********************************
     * CODE BELOW NEEDS TO BE MODIFIED FOR
     * FINAL PROJECT
     *********************************/

    int xpoint = rng.nextInt(LENGTH-1)+1; // random crossover point

    // Copy first portions of parents into children:
    for (int i = 0; i < xpoint; i++) {
      s1 += p1.item().charAt(i);
      s2 += p2.item().charAt(i);
    }

    // Switch parents, finish copying:
    for (int i = xpoint; i < LENGTH; i++) {
      s1 += p2.item().charAt(i);
      s2 += p1.item().charAt(i);
    }


    // Create the return array:
    BitString[] children = {new BitString(s1),new BitString(s2)};
    return children;
  }


  /**
   * Mutate a bit string by changing bits with probability MUTATION_PROB
   *
   * @param	b	the bit string to be mutated
   *
   * @return	a new BitString containing mutated version of b
   */
  public static BitString mutate(BitString b) {
    String s = b.item(); // original bit string
    String result = "";  // mutated bit string

    /*********************************
     * CODE BELOW NEEDS TO BE MODIFIED FOR
     * FINAL PROJECT
     *********************************/

    // Examine every bit:
    for (int i = 0; i < LENGTH; i++) {
      if (rng.nextDouble() < MUTATION_PROB) { // flip this bit
        result = result + (1-s.charAt(i)+'0');
      }
      else {
        result = result + s.charAt(i); // don't change this bit
      }
    }
    return new BitString(result);
  }


  /**
   * Select a bit string from the current population using a
   * tournament: randomly pick TOURNAMENT_SIZE elements, return 
   * the most fit of those.
   *
   * @return	the selected bit string
   */
  public static BitString select() {

    /*********************************
     * CODE BELOW NEEDS TO BE MODIFIED FOR
     * FINAL PROJECT
     *********************************/

    // Need to find the most fit among those taking part in the
    // tournament:
    double mostFit = -Double.MAX_VALUE;
    int mostFitLoc = -1;

    // Choose elements at random, keeping track of most fit:
    for (int i = 0; i < TOURNAMENT_SIZE; i++) {
      int loc = rng.nextInt(POPSIZE);
      double f = pop[loc].fitness();
      if (f > mostFit) {
        mostFit = f;
        mostFitLoc = loc;
      }
    }

    return new BitString(pop[mostFitLoc].item());
  }


  /**
   * Ask user to set the GA parameters.
   */
  public static void setup() {
    Scanner in = new Scanner(System.in);
    POPSIZE = getInt(in,"Population size?");
    CROSSOVER_PROB = getDouble(in,"Crossover probability?");
    MUTATION_PROB = getDouble(in,"Mutation probability?");
    TOURNAMENT_SIZE = getInt(in,"Tournament size (must be > 0 and less than " 
          + POPSIZE + ")?");
    ELITISM_PRESERVE = getInt(in,"Elitism size (must be >= 0 and less than " 
          + POPSIZE + ")?");
    GENERATIONS = getInt(in,"Number of generations?");
    LENGTH = getInt(in,"Length of bit strings?");
    VERBOSE = getInt(in,"1 = verbose, anything else = quiet:");
  }


  /**
   * Utility method for prompting user and reading in an int.
   *
   * @param	in	the input source (usually System.in)
   * @param	prompt	String to be printed to prompt the user
   *
   * @return	the integer entered by the user
   */
  public static int getInt(Scanner in, String prompt) {
    System.out.print(prompt+" ");
    return in.nextInt();
  }


  /**
   * Utility method for prompting user and reading in a double.
   *
   * @param	in	the input source (usually System.in)
   * @param	prompt	String to be printed to prompt the user
   *
   * @return	the double entered by the user
   */
  public static double getDouble(Scanner in, String prompt) {
    System.out.print(prompt+" ");
    return in.nextDouble();
  }


  /**
   * Displays information about each individual in the current
   * generation, as well as current global optimum.
   *
   * @param	gen	generation number
   * @param	maxFitLocation	index of most fit member in population
   * @param	bestSoFar	the best BitString found so far
   */
  public static void displayPop(int gen, int maxFitLocation, 
                               BitString bestSoFar) {
    System.out.println("---------------------------");
    System.out.println("Generation "+gen);
    System.out.println("\nString\tFitness");
    for (int i = 0; i < pop.length; i++) {
      System.out.println(pop[i].item()+"\t"+pop[i].fitness());
    }
    System.out.println("Best string in generation " + gen + ": ");
    System.out.println(pop[maxFitLocation].item());
    System.out.print("Best fitness in generation " + gen + ": ");
    System.out.println(pop[maxFitLocation].fitness());
    System.out.println("Best string so far: ");
    System.out.println(bestSoFar.item());
    System.out.print("Best fitness so far: ");
    System.out.println(bestSoFar.fitness());
    System.out.println("---------------------------");
  }
}
