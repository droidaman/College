/**
 * EdgeTest -- experiments in using the Graph class.
 *      Write a method to take a graph and two vertices and determine
 *      whether or not the graph has an edge between those vertices.
 *
 * This is modelled on the program "GraphClient.java" which can be
 * found on the textbook website and is partially shown in the textbook
 * on page 523.
 *
 * @author      Bob Roos
 * @version     30 October 2012
 */

public class EdgeTest {
    // main method just tests the "hasEdge" method:
    public static void main(String[] args) {
        Graph g = new Graph(new In(args[0]));
        StdOut.println("Graph: "+g);
        for (int i = 0; i < 10; i++) {
           int v = StdRandom.uniform(g.V());
           int w = StdRandom.uniform(g.V());
           if (hasEdge(g,v,w))
              StdOut.println("Edge from " + v + " to " + w);
           else
              StdOut.println("No edge from " + v + " to " + w);
        }
    }

    // Return true if g has an edge from v to w, false otherwise:
    public static boolean hasEdge(Graph g, int v, int w) {
       for (int i : g.adj(v)) {
          if (i == w)
              return true;
       }
       return false;
    }
}
