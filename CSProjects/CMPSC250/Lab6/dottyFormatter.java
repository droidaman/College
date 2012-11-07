/**
 * DottyFormatter - Formats graphs so they cn work directly with dotty.
 *
 * Usage:  java dottyFormatter filename > filename.dot
 *
 *       where filename is the name of a file containing a graph
 *       description.
 *
 * Takes in a graph, outputs the graph formatted properly for dotty.
 *
 * @author	Braden Licastro
 * @version	06 November 2012
 */

// Yep, we will certainly need this
import java.io.*;

public class dottyFormatter {

	public static void main(String[] args) {

		// Catch file read error when compiling even though it is an argument and should be there.
		try{                
			BufferedReader br = new BufferedReader(new FileReader(args[0]));

			// First line of dotty file
			System.out.println("graph x {");
			
			// Throw out the first line of the graph.
			String strLine;
			br.readLine();

			// Read the rest of the file in and replace where needed.
			while ((strLine = br.readLine()) != null)   {
				System.out.println(strLine.replace(" ", "--"));
			}

			// Close off the "graph x {"
			System.out.print("}");
			
			// Close the reader
			br.close();
		} catch (Exception e) {}
	}
}
