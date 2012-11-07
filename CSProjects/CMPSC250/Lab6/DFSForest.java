/**
 * Simple DFS -- simple depth-first search demonstration
 *
 * Usage:  java SimpleDFS filename
 *
 *       where filename is the name of a file containing a graph
 *       description.
 *
 * If we uncomment the two lines that draw "-----" we can see a
 * textual description of the connected components.
 *
 * @author	Bob Roos
 * @version	29 October 2012
 */
import java.util.Arrays; // for the fill method to initialize marked

public class DFSForest {

    private static Graph forest;

    public static void main(String[] args) {
        Graph g = new Graph(new In(args[0]));  // read in the graph
        boolean marked[] = new boolean[g.V()]; // keeps track of visits
        Arrays.fill(marked,false); // initially, nothing visited
	forest = new Graph(g.V());

        for (int vertex = 0; vertex < g.V(); vertex++) {
            if (!marked[vertex]) {
                dfs(g,vertex,marked);
            }
        }
	System.out.println("\n" + forest);
    }

    /**
     * Recursively performs a depth-first search of a graph starting
     * from vertex v; the marked array indicates vertices that have
     * already been visited.
     *
     * @param	g	the graph to be searched
     * @param	v	the vertex to be visited next
     * @param	marked	marked[v] = true if and only if v has been visited
     */
    public static void dfs(Graph g, int v, boolean marked[]) {
        StdOut.println("Visiting " + v);
	marked[v] = true;

	if(v + 1 < g.V())
	    forest.addEdge(v, v + 1);

        for (int w : g.adj(v)) {
            if (!marked[w]){
                dfs(g,w,marked);
	    }
        }
    }
}
