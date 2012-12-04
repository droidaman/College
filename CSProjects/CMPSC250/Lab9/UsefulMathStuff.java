/*
 * Braden Licastro
 * 
 * CMPSC 250
 * Lab 9
 * Professor Roos
 *
 * Purpose: This program will take several sets of points and calculate:
 *      ~ area of the triangle
 *      ~ whether a point lays to the left or the right of a given line
 *      ~ determine whether two lines intersect
 *
 * Use: java TriArea, enter action at prompt or 'q' to exit.
 * 
 */

import java.util.*;
import java.lang.Math;

public class UsefulMathStuff
{

    // Use a global variables to cut down on code.
    private static int[] arr;
    private static int[] arr2;
    private static Scanner reader = new Scanner(System.in);

    // Method takes user input and allows user to choose what program function to use.
    public static void main (String[] args)
    {
        arr = new int[8];
        
        // Use a menu to run the correct function.
        try{
        while (true) {
            System.out.print("\nWhat would you like to do?\n" +
                             "\t1. Calculate area of a triangle\n" +
                             "\t2. Determine if a point lays to the left or right of a line\n" +
                             "\t3. Determine whether two lines intersect\n" +
                             "\tQ. Quit\n");

            switch(reader.nextInt()) {
                case 1:
                    // Ask for the correct number of inputs.
                    fillArray(3);
                    // Output the result
                    System.out.println("\nThe area of the given triangle is: " + Math.abs(findArea(arr)) + "\n");
                    break;
                    
                case 2:
                    // Ask for the correct number of inputs.
                    fillArray(3);
                    // Output the result
                    System.out.println("\nThe point lies " + lORr(arr) + "\n");
                    break;
                    
                case 3:
                    // Ask for the correct number of inputs.
                    fillArray(4);
                    // Output the result
                    if(intersect(arr))
                        System.out.println("\nThe given lines intersect.\n");
                    else
                        System.out.println("\nThe given lines do not intersect.\n");
                    break;
                    
                default:
                    System.out.println("\nNot a valid option.\n");
                    break;
            }
        }
        } catch (Exception ex) {
            // Exit the program if the user types anything other than a numeric menu choice.
            System.exit(0);
        }
    }

    // Finds the area given three points of the form x,y
    private static double findArea(int[] tri)
    {
        return (.5*(tri[0]*tri[3] - tri[2]*tri[1] + tri[2]*tri[5] - tri[4]*tri[3] + tri[4]*tri[1] - tri[0]*tri[5]));
    }
    
    // Determines whether a point is to the left, the right
    // or is on the given line and returns the result
    // given the form x, y of three points.
    private static String lORr(int[] pts)
    {
        // Use existing method to determine if the point is to the left or the right.
        double lORr = findArea(pts);
        
        if(lORr < 0)
            return "to the right of the line specified.";
        else if (lORr > 0)
            return "to the left of the line specified.";
        else
            return "on the line specified.";
    }
    
    // Determines whether two lines intersect
    // Given four points of the form x,y.
    private static boolean intersect(int[] pts)
    {
        // 
        arr2 = new int[] {pts[0], pts[1], pts[2], pts[3], pts[6], pts[7]};
        
        if(lORr(arr) != lORr(arr2))
            return true;
        else
            return false;
    }
    
    // Method is used to fill the array with the necessary
    // number of points required for the given function.
    // Cuts down on repetitive code.
    private static void fillArray(int pts)
    {
        int arrpos = 0;
        for(int i = 0; i < pts; i++) {
            System.out.print("\nWhat is the value of x" + i + "?" );
            arr[arrpos] = reader.nextInt();
            arrpos++;

            System.out.print("What is the value of y" + i + "?" );
            arr[arrpos] = reader.nextInt();
            arrpos++;
        }
    }
}
