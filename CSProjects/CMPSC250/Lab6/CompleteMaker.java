/**
 * Braden Licastro
 * CMPSC250
 * Lab 6
 *
 * CompleteMaker -- experiments in using the Graph class. 
 *      Write a method to construct and return a complete graph with n
 *      vertices.
 *
 * This is modelled on the program "GraphClient.java" which can be 
 * found on the textbook website and is partially shown in the textbook 
 * on page 523.
 *
 * @author	Bob Roos
 * @version	30 October 2012
 */
public class CompleteMaker {
    // main method simply tests the "makeComplete" method:
    public static void main(String[] args) {

        Graph c = makeComplete(1);
        StdOut.println("complete on 1 vertex: "+c);

        c = makeComplete(2);
        StdOut.println("complete on 2 vertices: "+c);

        c = makeComplete(5);
        StdOut.println("complete on 5 vertices: "+c);

        c = makeComplete(8);
        StdOut.println("complete on i vertices: "+c);
    }

    // This method creates a "complete graph" of n vertices
    // and returns it:
    public static Graph makeComplete(int n) {
        Graph complete = new Graph(n);
        for (int i = 0; i < n; i++)
            for (int j = i+1; j < n; j++)
                complete.addEdge(i,j);
        return complete;
    }
}

