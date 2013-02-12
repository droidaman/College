/*
 *Braden Licastro
 * CMPSC380 Lab 3
 *
 * Finds all of the files within the given directory
 * that match the provided pattern.
 *
 * Use: java FileFinder filePath matchingPattern
 */

import org.josql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.File;

public class FileFinder
{
    
    public static void main(String[] args)
    {
    	try{
    		// Construct an list and populate it with some files
    		List<File> fileList = new ArrayList<File>();
    		fillPath(args[0], "", fileList);

    		// Create a new Query.
    		Query q = new Query ();
		
    		// Parse the SQL you are going to use.
    		q.parse ("SELECT * FROM java.io.File WHERE name LIKE '" + args[1] + "'");

    		// Execute the query.
    		QueryResults qr = q.execute(fileList);

	    	// Cycle over the query results
	    	List res = qr.getResults();
	    	System.out.println("Number of Results: " + res.size());
	    	System.out.println();

	    	// Print out all of the matching files
	    	for (int i = 0; i < res.size (); i++) {
	    		// Print out the matching file
	    		File f = (File) res.get (i);
		    	System.out.println(f.getName());
		    }

	    } catch(org.josql.QueryParseException e) {
    		System.out.println("Error");
	    } catch(org.josql.QueryExecutionException e) {
    		System.out.println("Error");
	    }
    }

    // Populates the list with files within the search directory.
    public static void fillPath(String path, String name, List<File> current) 
    {	
        File f = new File(path);
        
        // Add to list if it is just a file
        if (f.isFile()) {
		current.add(f);
	    } else if (f.isDirectory()) {
    		if (!path.endsWith(File.separator)) {
    			path += File.separator;
		    }

    		String[] list = f.list();

            // Process all files recursivly
            for (int i = 0; (list != null) && (i < list.length); i++) {
    		    fillPath(path + list[i], list[i], current);	
    		}    	    
	    }
    }
}
