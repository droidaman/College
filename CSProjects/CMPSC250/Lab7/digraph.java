/**
 *
 * Digraph maker that creates a digraph of v verticies. 
 *
 * Use: java digraph numV
 * Where numV is the number of verticies you want in the graph.
 *
 * @author	Braden Licastro
 * @version	13 November 2012
 * CMPSC 250
 * Lab 7
 *
 */

public class digraph {
	// Main method generates a digraph of size v verticies
	// Method doesn't return a value
	// Prints out the resulting digraph t the terminal window.
	// numV = the number of verticies
    public static void main(String[] args) {

	//Take input from the terminal
    int numV = Integer.parseInt(args[0]);
	// Create a digraph object.
	Digraph dg = new Digraph(numV);

	// Loops to create the verticies.
	for(int i = 0; i < numV; i++){
		for(int j = 0; j < numV; j++){
			// Check to see if an edge meets the conditions before adding it.
			if(i == j){
				continue;
			} else if((numV == (2*j) % numV) || ((Math.pow(j, 2) % numV) == ((3*numV) + 1) % numV)){
				dg.addEdge(i,j);
			}
		}
	}

	// Print out the resulting digraph.
	System.out.println(dg);
				
    }
}

