/**
 * Edge Sum -- Prints out the EWG and the total weight 
 * of all of the edges in the graph.
 *
 * Usage:   java EdgeSum ewg
 *
 * where ewg is the EdgeWeightedGraph being input
 *
 * @author	Braden Licastro
 * @version	17 Nov. 2012
 */
 
 public class EdgeSum {
 
  public static void main(String[] args) {
  
    // Create the EWG from the input and start a sum counter at 0.
    EdgeWeightedGraph ewg = new EdgeWeightedGraph(new In(args[0]));
    double sum = 0;

    // Print out the EWG
    System.out.println("The graph is:\n" + ewg);
	
	// Walk through the graph, adding the weights together while ignoring duplicates.
    for (int i = 0; i < ewg.V(); i++) {
       for (Edge e : ewg.adj(i)) {
          if(e.either() != e.other(i)) {
	          sum += e.weight();
	    }
       }
    }
    
    // Print out the total edge weight.
    System.out.println("\nTotal sum: " + sum);
  }
}
 
