/** * Generate data for use in classification algorithms.
 * Braden Licastro 03142012
 * Complex Example
 *
 * Parameters you can change:
 *    You can alter the number of attributes and their values, e.g.,
 *        ... attr[][] = {{"a","b","c","d","e"},{"one","two"}};
 *
 *    You can alter the classification categories, e.g.,
 *        ... category = {"pepsi","coke","rc"};
 *
 *    You can alter the number of examples, e.g.,
 *        ... numExamples = 5000;
 *
 *    You MUST alter the method "evaluate" if you make any changes
 *    to the attr or category arrays, since "evaluate" is a
 *    problem-specific function that classifies data according
 *    to some rule of your choosing. You may, of course, use something 
 *    like the following:
 *
 *        public static String evaluate(String[] dataItem) {
 *          return category[rng.nextInt(category.length)];
 *        }
 *    which will randomly and inconsistently assign categories
 *    to the training examples ("rng" is the random number generator I
 *    used for creating training data).
 */
import java.util.*;

public class ComplexData			 {

  // ATTRIBUTES: You can have as many as you want--the program will
  // automatically determine the number of attributes and the
  // number of values of each one. For now, attribute values
  // should be strings with no white space.
  public static String attr[][] = {
                                    {"Today","Later"},
                                    {"Tired","NotTired"},
                                    {"Bored","NotBored"},
                                    {"AfraidOfSun","LoveSun","Indifferent"}
                                  };

  // CLASSIFICATION CATEGORIES: You can have as many as you want;
  // you don't always need to use "yes","no".
  public static String category[] = {"DoYourWork","TakeANap","PlayGames","PlayOutside","SitAround"};

  // NUMBER OF ENTRIES IN THE "@data" SECTION OF THE ARFF FILE:
  public static int numExamples = 50;

  public static Random rng;

  // YOU SHOULDN'T NEED TO CHANGE ANYTHING IN "main":
  public static void main(String[] args) {
    rng = new Random();

    System.out.println("@relation mydata" );
    for (int i = 0; i < attr.length; i++) {
      System.out.print("@attribute a"+i+" {");
      for (int j = 0; j < attr[i].length; j++) {
        System.out.print(attr[i][j]);
        if (j < attr[i].length-1)
          System.out.print(",");
      }
      System.out.println("}");
    }
    System.out.print("@attribute category {");
    for (int j = 0; j < category.length; j++) {
      System.out.print(category[j]);
      if (j < category.length-1)
        System.out.print(",");
    }
    System.out.println("}");
    System.out.println("@data");
    for (int i = 0; i < numExamples; i++) {
      String[] dataItem = new String[attr.length];
      for (int j = 0; j < attr.length; j++) {
        int temp = attr[j].length;
        dataItem[j] = attr[j][rng.nextInt(temp)];
      }
      String cat = evaluate(dataItem);
      for (int j = 0; j < dataItem.length; j++)
        System.out.print(dataItem[j]+",");
      System.out.println(cat);
    }
  }

  // GIVEN AN ARRAY dataItem OF ATTRIBUTE VALUES, RETURN THE
  // CATEGORY FOR dataItem. YOU WILL NEED TO DETERMINE THE
  // CORRECT INDEX VALUES FROM THE ORDER IN WHICH YOU SPECIFIED
  // THE ATTRIBUTES ABOVE (E.G., IN THE EXAMPLE, THE FIRST
  // ATTRIBUTE HAD VALUES "sm","med","large", SO dataItem[0]
  // CONTAINS ONE OF THESE VALUES, dataItem[1] CONTAINS A
  // COLOR, etc.
  public static String evaluate(String[] dataItem) {
    if (dataItem[0].equals("Later") && dataItem[1].equals("Tired")) 
      return "TakeANap";
    else if (dataItem[0].equals("Later") && dataItem[1].equals("NotTired") && dataItem[2].equals("Bored") && dataItem[3].equals("AfraidOfSun")) 
      return "PlayGames";
    else if (dataItem[0].equals("Later") && dataItem[1].equals("NotTired") && dataItem[2].equals("Bored") && dataItem[3].equals("Indifferent")) 
      return "SitAround";
    else if (dataItem[0].equals("Later") && dataItem[1].equals("NotTired") && dataItem[2].equals("Bored") && dataItem[3].equals("LoveSun")) 
      return "PlayOutside";
    else
      return "DoYourWork";
  }
}
