/**
 * @author Braden Licastro
 *
 * PLEDGE: _____________________
 * CS380
 * Lab 6
 *
 * Description: TreeAlgorithms creates a random tree from a names file
 *              and stores the object through binary and XML serialization.
 *
 * Use:	java TreeAlgorithms wordCount binaryFile.bin XMLFile.xml --verbosity
 *
 * wordCount - the number of words to add to the tree
 * 
 * verbosity - --V or --v prints out the tree and serialization results
 *             --Q or --q prints out only the serialization results
 */

import java.util.Iterator;
import com.thoughtworks.xstream.XStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.PrintStream;
import java.io.FileWriter;
import java.io.*;

public class TreeAlgorithms {

    public static String preOrderPrint(Tree T, Position v) {
        String s = v.element().toString(); // elements must implement toString
        Iterator children = T.children(v);

        while (children.hasNext())
            s += " " + preOrderPrint(T, (Position) children.next());

        return s;
    }

    public static String parentheticRepresentation(Tree T, Position v) {
        String s = v.element().toString(); // elements must implement toString
    
        if (T.isInternal(v)) {
            Iterator children = T.children(v);
            // open parenthesis and recursively process the first subtree
            s += " ( " + parentheticRepresentation(T, (Position) children.next());

            while (children.hasNext())
                // recursively process the remaining subtrees
                s += ", " + parentheticRepresentation(T, (Position) children.next());

            s += " )"; // close parenthesis
        }
    
        return s;
    }


    // SERIALIZATION AND DESERIALIZATION METHODS

    /*
     * Retrieves contents from binary file and deserializes them
     *
     * @param name takes in the name of the binary file to deserialize
	 * @return Returns the deserialized object
	 * @exception throws any exception if it fails
     */
    public static Tree retrieveFromBinary(String name) {
        try {
            // Initialize the file input and the object input
            FileInputStream fis = new FileInputStream(name);
            ObjectInputStream ois = new ObjectInputStream(fis);
            
            // Initialize an empty Tree to store the deserialized data in
            Tree dsTree = null;
            
            // Deserialize the object
            dsTree = (Tree)ois.readObject();
            
            // Release resources held by the streams
            ois.close();
            fis.close();
            
            // Return the deserialized tree
            return dsTree;
            
        } catch(Exception e) {
            // Catch any errors that may occur and return the empty tree
            System.out.println("An error occured during binary deserialization " + e);
            return null;
        } 
    }

    /*
     * Serializes object to binary file
     *
     * @param tree takes in the tree to be serialized
     * @param name takes in the binary filename to serialize to
	 * @exception throws any exception if it fails
     */
    public static void storeToBinary(Tree tree, String name) {
        try {
            // Initialize the file output and the object input
            FileOutputStream fos = new FileOutputStream(name);
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            
            // Serialize the Tree object
            oos.writeObject(tree);
            
            // Flush the object stream to prevent possible deadlock
            oos.flush();
            // Release resources held by the streams
            oos.close();
            fos.close();
            
        } catch(Exception e) {
            // Catch any errors that may occur during serialization
            System.out.println("An error occured during binary serialization " + e);
        } 
    }

    /*
     * Retrieves contents from XML file and deserializes them
     *
     * @param name takes in the name of the XML file to deserialize
	 * @return Returns the deserialized object
	 * @exception throws any exception if it fails
     */
    public static Tree retrieveFromXML(String name) {
        // Initialize an xStream object
        XStream xstream = new XStream();
        
        // Initialize an empty Tree to store the deserialized data in
        Tree dsTree = null;

        try {
            // Initialize the file input stream
            FileInputStream fis = new FileInputStream(name);
            
            // Deserialize the object from XML
            dsTree = (Tree)xstream.fromXML(fis);

            // Release resources held by the stream
            fis.close();
            
            // Return the deserialized tree
            return dsTree;

        } catch(Exception e) {
            // Catch any errors that may occur and return the empty tree
            System.out.println("An error occured during XML deserialization " + e);
            return null;
        } 
    }

    /*
     * Serializes object to XML file
     *
     * @param tree takes in the tree to be serialized
     * @param name takes in the XML filename to serialize to
	 * @exception throws any exception if it fails
     */
    public static void storeToXML(Tree tree, String name) {
        // Initialize an xStream object
        XStream xstream = new XStream();
        
        try {
            // Initialize a file output stream
            FileOutputStream fos = new FileOutputStream(name);
            
            // Serialize the object to XML
            xstream.toXML(tree, fos);
            
            // Release resources held by the stream
            fos.close();
            
        } catch (Exception e) {
            // Catch any errors that may occur during serialization
            System.out.println("An error occured during XML serialization " + e);
        }
    }


    /*
     * Creates a random tree and serializes / deserializes it.
     *
     * @param args[0] Number - Size of the tree to generate
     * @param args[1] String - Filename of binary file
     * @param args[2] String - Filename of XML file
     * @param args[3] String - Verbose or nonverbose output
     */
    public static void main(String[] args) {
        // Generate a randomized tree
        Tree randomTree = RandomTreeBuilder.randomTree(Integer.parseInt(args[0]));
        // Containers for timer and check data
        long startTime = 0;
        Tree dsTree = null;
        
        // Print out the trees
        if(args[3].toLowerCase().contains("--v")) {
            System.out.println("The random tree: \n" + preOrderPrint(randomTree, randomTree.getRoot()));
            System.out.println();
            System.out.println("Parenthetic representation: \n" + parentheticRepresentation(randomTree, randomTree.getRoot()));
            System.out.println();
        }
        
        /*
         * Store the tree and time how long this takes using binary serialization
         */
        System.out.print("Storing to binary...");
        // Initialize the timer
        startTime = System.currentTimeMillis();
        
        // Store data to file
        storeToBinary(randomTree, args[1]);
        
        // Return time taken to store file
        System.out.println("\tprocess completeed in " + (System.currentTimeMillis() - startTime) + "ms");


        /*
         * Store the tree and time how long this takes using XML serialization
         */
        System.out.print("Storing to XML...");
        // Initialize the timer
        startTime = System.currentTimeMillis();
        
        // Store data to file
        storeToXML(randomTree, args[2]);
        
        // Return time taken to store file
        System.out.println("\tprocess completeed in " + (System.currentTimeMillis() - startTime) + "ms");


        System.out.println();

        /*
         * Retrieve the tree and time how long this takes using binary deserialization
         */
        System.out.print("Retrieving from binary...");
        // Initialize the timer
        startTime = System.currentTimeMillis();
        
        // Store data to file
        dsTree = retrieveFromBinary(args[1]);
        
        // Return time taken to store file
        System.out.println("\tprocess completeed in " + (System.currentTimeMillis() - startTime) + "ms");
        
        // Check to make sure Objects were stored and retrieved properly by comparing contents
        if(!args[3].toLowerCase().contains("--v")) {
            // Do nothing
        } else if(preOrderPrint(randomTree, randomTree.getRoot()).equals(preOrderPrint(dsTree, dsTree.getRoot()))) {
            System.out.println("\tDeserialization check for binary...\tpassed.");
        } else {
            System.out.println("\tDeserialization check for binary...\tfailed.");
        }
        
        // Reset variable for next test
        dsTree = null;

        /*
         * Retrieve the tree and time how long this takes using XML deserialization
         */
        System.out.print("Retrieving from XML...");
        // Initialize the timer
        startTime = System.currentTimeMillis();
        
        // Store data to file
        dsTree = retrieveFromXML(args[2]);
        
        // Return time taken to store file
        System.out.println("\t\tprocess completeed in " + (System.currentTimeMillis() - startTime) + "ms");
        
        // Check to make sure Objects were stored and retrieved properly by comparing contents
        if(!args[3].toLowerCase().contains("--v")) {
            // Do nothing
        } else if(preOrderPrint(randomTree, randomTree.getRoot()).equals(preOrderPrint(dsTree, dsTree.getRoot()))) {
            System.out.println("\tDeserialization check for XML...\tpassed.");
        } else {
            System.out.println("\tDeserialization check for XML...\tfailed.");
        }
            
        // Reset variable for next test
        dsTree = null;
    }
}
