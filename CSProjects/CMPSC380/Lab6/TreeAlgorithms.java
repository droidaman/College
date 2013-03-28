import java.util.Iterator;

import com.thoughtworks.xstream.XStream;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import java.io.InputStreamReader;
import java.io.BufferedReader;

import java.io.PrintStream;

import java.io.FileWriter;

import java.io.*;

public class TreeAlgorithms
{

    public static String preOrderPrint(Tree T, Position v) 
    {
	String s = v.element().toString(); // elements must implement toString
	Iterator children = T.children(v);
	while (children.hasNext())
	    s += " " + preOrderPrint(T, (Position) children.next());
	return s;
    }
    
    public static String parentheticRepresentation(Tree T, Position v) 
    {
	String s = v.element().toString(); // elements must implement toString
	
	if (T.isInternal(v)) 
	    {

		Iterator children = T.children(v);
		// open parenthesis and recursively process the first subtree
		s += " ( " + 
		    parentheticRepresentation(T, (Position) children.next());
    
		while (children.hasNext())
		    // recursively process the remaining subtrees
		    s += ", " + 
			parentheticRepresentation(T, 
						  (Position) children.next());
		s += " )"; // close parenthesis
	    }
	
	return s;

    }

    public static void main(String[] args)
    {

	Tree randomTree = RandomTreeBuilder.randomTree(10);

	System.out.println("The random tree: \n\n" + 
			   preOrderPrint(randomTree,
					 randomTree.getRoot()));

	System.out.println();

	System.out.println("Parenthetic representation: \n\n" + 
			   parentheticRepresentation(randomTree,
						     randomTree.getRoot()));

	// store the tree and time how long this takes
	

	// retrieve the tree and time how long this takes

	
    }

}
