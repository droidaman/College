/**
 * CompleteWeightedGraph -- Creates a complete edge weighted
 * graph with random edges and random edge weights.
 *
 * Usage:   java CompleteWeightedGraph n
 *
 * Where n is the number of vertices.
 *
 * @author	Braden Licastro
 * @version	17 Nov. 2012
 */

public class CompleteWeightedGraph {
    public static void main(String[] args) {
        // Create the graph from the input
        int n = Integer.parseInt(args[0]);
        EdgeWeightedGraph ewg = new EdgeWeightedGraph(n);

        // Create a complete graph with edged between all verticies.
        for (int v = 0; v < ewg.V(); v++) {
            for (int w = v+1; w < ewg.V(); w++) {
                //  Choose a random weight of value 1 or 2:
                int weight = StdRandom.uniform(0,2) + 1;
                ewg.addEdge(new Edge(v,w,weight));
            }
        }
        // Print out the graph
        StdOut.println("The graph is:\n" + ewg);
    }
}
