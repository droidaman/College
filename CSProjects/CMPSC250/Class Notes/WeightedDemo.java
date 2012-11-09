/**
 * Demonstration of the EdgeWeightedGraph class from the textbook.
 *
 * Usage:   java WeightedDemo graphfilename
 *
 * @author	Bob Roos
 * @version	5 Nov. 2012
 */
public class WeightedDemo {
    public static void main(String[] args) {
        // Read in a graph from a file and display it:
        EdgeWeightedGraph g1 = new EdgeWeightedGraph(new In(args[0]));
        StdOut.println("First graph:\n"+g1);

		double minwt = Double.MAX_VALUE;
		for(int v = 0; v < g1.V(); v++){
			for(Edge e : g1.adj(v)){
				
		
        // Create a graph with random edges and weights:
        EdgeWeightedGraph g2 = new EdgeWeightedGraph(5);
        for (int v = 0; v < 5; v++) {
            for (int w = v+1; w < 5; w++) {
                if (StdRandom.random() < .65) {
                    double wt = StdRandom.random()*10;
                    g2.addEdge(new Edge(v,w,wt));
                }
            }
        }
        StdOut.println("Random graph:\n"+g2);
    }
}
