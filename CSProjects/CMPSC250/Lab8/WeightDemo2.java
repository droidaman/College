/**
 * WeightDemo2 -- demonstrates how to create a weighted graph with
 * random edges and random edge weights.
 *
 * Usage:   java WeightDemo2 n
 *
 * where n is the number of vertices.
 *
 * @author	Bob Roos
 * @version	13 Nov. 2012
 */

public class WeightDemo2 {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        EdgeWeightedGraph g = new EdgeWeightedGraph(n);

        for (int v = 0; v < g.V(); v++) {
            for (int w = v+1; w < g.V(); w++) {
                // decide whether to add an edge between v and w:
                if (StdRandom.random() < .5) {
                    // choose a random weight between 1 and 10:
                    double weight = StdRandom.uniform(1.0,10.0);
                    g.addEdge(new Edge(v,w,weight));
                }
            }
        }
        StdOut.println("The graph is:\n" + g);
    }
}
