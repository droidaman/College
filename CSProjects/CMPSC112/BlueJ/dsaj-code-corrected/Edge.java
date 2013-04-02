// Disclaimer: The program code is made available under the
// following copyright notice: Copyright 2006, by Pearson
// Education, Inc. by Drake; all rights reserved. Permission
// is granted for use in non-commercial applications provided
// this copyright notice remains intact and unchanged. The
// author and publisher make no warranty of any kind, expressed
// or implied, with regard to these programs. The author and
// publisher shall not be liable in any event for incidental or
// consequential damages in connection with, or arising out of
// the furnishing, performance of use of this program code.


// Introduced in Chapter 15
/** An edge connecting two vertices in a graph. */
public class Edge implements Comparable<Edge> {

  /** Index of the destination vertex. */
  private int dest;

  /** Index of the source vertex. */
  private int source;

  /** Weight associated with this Edge. */
  private double weight;

  /** Store the given values. */
  public Edge(int source, int dest, double weight) {
    this.source = source;
    this.dest = dest;
    this.weight = weight;
  }

  public int compareTo(Edge that) {
    if (weight > that.weight) {
      return 1;
    }
    if (weight == that.weight) {
      return 0;
    }
    return -1;
  }

  /** Return the destination vertex of this Edge. */
  public int getDest() {
    return dest;
  }

  /** Return the source vertex of this Edge. */
  public int getSource() {
    return source;
  }

  /** Return the weight of this Edge. */
  public double getWeight() {
    return weight;
  }
  
}
