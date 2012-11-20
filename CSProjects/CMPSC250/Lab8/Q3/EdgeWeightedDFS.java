/**
 * EdgeWeightedDFS -- Prints out the EWG and performs a dfs
 * over the entire graph, printing verticies and weights as it visits.
 *
 * Usage:   java EdgeWeightedDFS ewg
 *
 * where ewg is the EdgeWeightedGraph being input
 *
 * @author	Braden Licastro
 * @version	18 Nov. 2012
 */

import java.util.*;
 
 public class EdgeWeightedDFS {
 
  public static void main(String[] args) {
    // Create the EWG from the input
    EdgeWeightedGraph ewg = new EdgeWeightedGraph(new In(args[0]));
    // Keeps track of visits
    boolean marked[] = new boolean[ewg.V()];
    // Initially, nothing visited
    Arrays.fill(marked,false);

    // Print out the EWG
    System.out.println("The graph is:\n" + ewg);
	
	// Perform a DFS on the graph
    for (int vertex = 0; vertex < ewg.V(); vertex++) {
        if (!marked[vertex]) {
                dfs(ewg,vertex,marked);
        }
    }
  }
 
  /**
  * Recursively performs a depth-first search of the weighted graph starting
  * from vertex v; the marked array indicates vertices that have
  * already been visited.
  *
  * @param	ewg	the edgeweightedgraph to be searched
  * @param	v	the vertex to be visited next
  * @param	marked	marked[v] = true if and only if v has been visited
  */
 public static void dfs(EdgeWeightedGraph ewg, int v, boolean marked[]) {
     // Print out the vertice we are visiting
     System.out.println("Visiting " + v);

     // Mark that we have seen this one now
     marked[v] = true;
     for (Edge e : ewg.adj(v)) {
         // Get the weight
         int w = e.other(v);
         if (!marked[w]){
            // Print out the weight and continue the dfs
            System.out.println("Using edge of weight " + e.weight());
            dfs(ewg,w,marked);
         }
     }
 }
}
