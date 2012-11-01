/**
 * StarMaker -- experiments in using the Graph class.
 *      Write a method to construct and print a star graph with n
 *      vertices.
 *
 * This is modelled on the program "GraphClient.java" which can be
 * found on the textbook website and is partially shown in the textbook
 * on page 523.
 *
 * @author      Bob Roos
 * @version     30 October 2012
 */

public class StarMaker {
    // Main program simply tests the makeStar method:
    public static void main(String[] args) {
        makeStar(1);
        makeStar(2);
        makeStar(3);
        makeStar(10);
    }


    // This method creates a "star graph" with n vertices
    public static void makeStar(int n) {
        Graph star = new Graph(n);
        for (int i = 1; i < n; i++)
            star.addEdge(0,i);
        StdOut.println("Star graph:" + star);
    }
}
