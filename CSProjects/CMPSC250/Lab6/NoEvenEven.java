/**
 * NoEvenEven -- experiments in using the Graph class.
 *      Write a method to create a new graph equal to a given graph, but
 *      without any edges that join an even vertex to an even vertex;
 *      return the new graph.
 *
 * This is modelled on the program "GraphClient.java" which can be
 * found on the textbook website and is partially shown in the textbook
 * on page 523.
 *
 * @author      Bob Roos
 * @version     30 October 2012
 */

public class NoEvenEven {
    // main method simply tests the deleteEvenEven method:
    public static void main(String[] args) {
        Graph original = new Graph(10);

        // Randomly add edges:
        for (int i = 0; i < 10; i++)
            for (int j = i+1; j < 10; j++)
                if (StdRandom.random() < .5)
                    original.addEdge(i,j);
        StdOut.println("Original graph:"+original);

        Graph noeven = deleteEvenEven(original);
        StdOut.println("No even-to-even edges: " + noeven);
    }

    // This method takes a Graph g and creates a new graph
    // in which all edges joining a pair of even vertices
    // are deleted; the new graph is returned.
    public static Graph deleteEvenEven(Graph g) {
        Graph result = new Graph(g.V());
        for (int i = 0; i < g.V(); i++) {
            for (int j : g.adj(i)) {
                if (i < j && (i%2 == 1 || j%2 == 1))
                    result.addEdge(i,j);
            }
        }
        return result;
    }
}

