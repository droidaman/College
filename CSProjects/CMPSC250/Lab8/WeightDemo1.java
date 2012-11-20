/**
 * WeightDemo1 -- demonstrates how to input a weighted graph from a
 * file.
 *
 * Usage:   java WeightDemo1 filename
 *
 * where filename is the name of a file containing a description of an
 * edge-weighted graph.  File "wg" may be used.
 *
 * @author	Bob Roos
 * @version	13 Nov. 2012
 */

public class WeightDemo1 {
    public static void main(String[] args) {
        EdgeWeightedGraph g = new EdgeWeightedGraph(new In(args[0]));
        StdOut.println("The graph is:\n" + g);
    }
}
