/**
 * CompleteMaker -- experiments in using the Graph class. 
 *      Write a method to construct and return a complete graph with n
 *      vertices.
 *
 * This is modelled on the program "GraphClient.java" which can be 
 * found on the textbook website and is partially shown in the textbook 
 * on page 523.
 *
 * @author	Bob Roos
 * @version	30 October 2012
 */
public class CBT {
    // main method simply tests the "makeComplete" method:
    public static void main(String[] args) {

        Graph c = makeComplete(1);
        StdOut.println("Complete on 1 vertex: "+c);

        c = makeComplete(2);
        StdOut.println("Complete on 2 vertices: "+c);

        c = makeComplete(5);
        StdOut.println("Complete on 5 vertices: "+c);

        c = makeComplete(8);
        StdOut.println("Complete on i vertices: "+c);
    }

    // This method creates a "complete graph" of n vertices
    // and returns it:
    public static Graph makeComplete(int n) {
        int vMax = (int)Math.pow(2, n+1) - 1;      
        Graph complete = new Graph(vMax);
        
        for (int i = 0; (2*i + 2) <= vMax; i++){        	
			complete.addEdge(i,(2*i + 1));
			complete.addEdge(i,(2*i + 2));
        }

        return complete;
    }
}

