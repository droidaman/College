/**
 *
 * TriangleCounter -- experiments in using the Graph class. 
 *
 * This program counts the number of triangles in a given graph.
 *
 * Taks in a graph, returns the number of triangles.
 *
 * @author	Braden Licastro
 * @version	06 November 2012
 * CMPSC 250
 * Lab 6
 *
 */

public class triangleCounter {
    // Takes a graph as input and runs a check to see how many triangles it has.
    public static void main(String[] args) {
        Graph g = new Graph(new In(args[0]));
	int tri = countTri(g);
	System.out.println("Graph: " + g);
	System.out.println("Number of triangles: " + tri);
    }

    // This method counts the number of triangles in graph g and returns it.
    // Takes in a graph, returns an integer
    public static int countTri(Graph g) {
        int count = 0;
	int v = 0;
	int w = v + 1;
	int x = v + 2;
        
        for (v = 0; v < w; v++){        	
		for (w = v + 1; w < x; w++){      
			for (x = v + 2; x < g.V(); x++){
				if(hasEdge(g, v, w) && hasEdge(g, w, x) && hasEdge(g, x, v)) {
					count ++;
				}
			}
		}
        }

        return count;
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
