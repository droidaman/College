/**
 *
 * Checks to see if a given graph is a euler graph.
 *
 * Use: java eulerChecker graph
 * Where graph is the filename if the graph input
 *
 * @author	Braden Licastro
 * @version	13 November 2012
 * CMPSC 250
 * Lab 7
 *
 */

public class eulerChecker {
	// Main method calls a check to see if a graph is a euler graph
	// Method doesn't return a value
	// Prints out the result to the terminal window.
	// numV = the number of verticies
    public static void main(String[] args) {

		// Create a digraph object from the graph input.
		Digraph dg = new Digraph(new In(args[0]));

		// Prints out whether a graph is eulerian or not.
		if(euler(dg)){
			System.out.println("eulerian");
		} else {
			System.out.println("not eulerian");
		}
	}

	// Checks to see if a given graph is eulerian or not.
	// Returns a boolean result
	// Takes a graph as input
	public static boolean euler(Digraph dg){
		int[] indegree = new int[dg.V()];
		int[] outdegree = new int[dg.V()];

		// Calculate the indegree of the graph
		for(int i = 0; i < dg.V(); i++){
			for(int j : dg.adj(i)) {
				indegree[j]++;
			}
		}

		// Calculate the outdegree of the graph
		for(int i = 0; i < dg.V(); i++){
			for(int j : dg.adj(i)) {
				outdegree[i]++;
			}
		}

		// Check to see if it is eulerian or not.
		for(int s = 0; s < indegree.length; s++){
			if(indegree[s] != outdegree[s]){
				return false;
			}
		}

		return true;
	}

}

