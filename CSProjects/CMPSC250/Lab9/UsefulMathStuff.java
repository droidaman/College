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
        // Use a menu to run the correct function.
        try{
        while (true) {
            System.out.print("\nWhat would you like to do?\n" +
                             "\t1. Calculate area of a triangle\n" +
                             "\t2. Determine if a point lays to the left or right of a line\n" +
                             "\t3. Determine whether two lines intersect\n" +
                             "\t4. Calculate the area of a polygon\n" +
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

                case 4:
                    // Ask for the correct number of inputs.
					System.out.print("\nHow many sides does the shape have? ");
                    fillArray(reader.nextInt());
					// Make sure the shape is a polygon.
					if(arr.length <= 4) {
                    	System.out.println("\nThat is not a polygon.\n");
                    	break;
					} else {
	                    // Output the result
	                    System.out.println("\nThe area of the given shape is: " + Math.abs(ngonArea(arr, (arr.length/2))) + "\n");
    	                break;
					}

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
        // Split master array into another array to allow a second triangle
        arr2 = new int[] {pts[0], pts[1], pts[2], pts[3], pts[6], pts[7]};

		// If both points are on the same side of the line, it doesn't intersect
        if(lORr(arr) != lORr(arr2))
            return true;
        else
            return false;
    }

    // Calculates the area of an ngon
    // Given sideNumber points of the form x,y.
    private static double ngonArea(int[] pts, int sides)
    {
		int rA = 0;
		int n = 0;

		for(int i = 0; i < sides-1; i++) {
			rA += arr[n]*arr[n+3] - arr[n+2]*arr[n+1];
			n += 2;
		}

		rA += arr[2*sides-2]*arr[1] - arr[0]*arr[2*sides-1];

		return .5*rA;
    }

    // Method is used to fill the array with the necessary
    // number of points required for the given function.
    // Cuts down on repetitive code.
    private static void fillArray(int pts)
    {
		// Set the array to the size we need
		arr = new int[2*pts];
        int arrpos = 0;
        
		for(int i = 0; i < pts; i++) {
			if(pts > 2) {
				// Get n x-values
    	        System.out.print("\nWhat is the value of X" + i + "? " );
    	        arr[arrpos] = reader.nextInt();
    	        arrpos++;

				// Get n y-values
    	        System.out.print("What is the value of Y" + i + "? " );
    	        arr[arrpos] = reader.nextInt();
    	        arrpos++;
			} else {
				break;
			}
        }
    }
}
