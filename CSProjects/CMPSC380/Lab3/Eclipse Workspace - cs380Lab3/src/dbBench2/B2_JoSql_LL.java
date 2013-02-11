package dbBench2;

/*
 * Braden Licastro
 * 
 * CMPSC 380 Lab 3
 * Professor Kapfhammer
 *
 * Purpose: This program will take a list of phone numbers or names and
 * 			return those whose area code or name matches the argument provided.
 * 			Also takes an integer to set the number of runs to get average
 * 			run time for.
 *
 * Use: java B1_JoSQL_AL file areaCodeOrName numRuns
 */

import java.io.*;
import java.util.*;
import org.josql.*;

public class B2_JoSql_LL {

	private List<String> dBank;
	private List matches;
	private Scanner file;

	public static void main(String[] args) {
		// Create the B1_Procedural object
		B2_JoSql_LL b2j = new B2_JoSql_LL();
		long compoundRuntime = 0;
		
		for(int i = 0; i < Integer.parseInt(args[2]); i++){

			// Record how long it takes to perform the search
			long startTime = System.nanoTime();
		
			// Move file contents to the LinkedList
			b2j.processFile(args[0]);
        
			// Select the correct matching algorithm
			if(args[0].contains("Phone_Numbers")){
				// Search for a matching string
				b2j.parseDBank("SELECT * FROM java.util.LinkedList WHERE:_currobj LIKE '" + args[1] + "%' OR:_currobj LIKE '" + args[1] + "'");
			} else if(args[0].contains("Full_Names")){
				// Search for a matching string
				b2j.parseDBank("SELECT * FROM java.util.LinkedList WHERE:_currobj LIKE '" + args[1] + "%'");
			} else {
				System.out.println("Unable to parse data: Unknown collection.");
			}
	        
				// Calculate the elapsed time and print results.
				long elapsedTime = System.nanoTime() - startTime;
	        
				compoundRuntime += elapsedTime/1000000;
				System.out.println("Lookup completed in " + elapsedTime/1000000 + "ms.");
			}
			
			// Print out the run average
			System.out.println("\nAverage run time: " + compoundRuntime/Integer.parseInt(args[2]) + "ms\n");
			
	        // Print the search result 
			System.out.println("Results returned:");
	        b2j.resultOut();
	}
	
	// Processes the file contents into a data structure
	public void processFile(String args){
		// Set up new file reader and LinkedList.
		try {
			file = new Scanner(new File(args));
		} catch (FileNotFoundException e) {
			System.out.println("The file path is incorrect.");
		}
		 	dBank = new LinkedList<String>();

		// Begin file parsing.
		try {
			while(file.hasNext()){
				dBank.add(file.nextLine());
			}
			
			// Stop parsing file
			file.close();
		} catch (NullPointerException e) {}		
	}

	// Takes a database query as input and parses the data.
	public void parseDBank(String query){
		try{
			// Create a new Query.
			Query q = new Query ();
			
			// Parse the SQL you are going to use.
			q.parse (query);

			// Execute the query.
			QueryResults qr = q.execute(dBank);
			
			matches = qr.getResults();
			
		} catch(org.josql.QueryParseException e) {
			System.out.println("Error" + e);
	    } catch(org.josql.QueryExecutionException e) {
	    	System.out.println("Error" + e);
	    }
	}
	
	// Prints the search results
	public void resultOut(){
		for(int i = 0; i < matches.size(); i++){
			Object obj = matches.get(i);
			System.out.println(obj);
		}
	}
}
