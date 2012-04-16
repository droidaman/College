/**
 * File Systems Lab Using Trees
 * 
 * @author Braden Licastro and Trent Dale
 * @version 4/15/2011
 */

package fileSource;

import java.io.*;
import java.util.*;

public class FileSystems {

	private File dir = new File("C:\\FileSystemsTest\\");
	private static final Scanner READER = new Scanner(System.in);
	TreeNode tn = new TreeNode();

	public static void main(String[] args) {

		FileSystems fs = new FileSystems();
		// Tests the whole program...
		System.out.println("The directory we will be working out of is " + fs.dir.toString() + "\n");
		
		System.out.println("Return the largest file in the given directory: ");
		System.out.println(fs.getLargestFile() + "\n");

		System.out.println("Return the smallest file in the given directory: ");
		System.out.println(fs.getSmallestFile() + "\n");

		System.out.println("NOTE: EDT and EST are the same timezone, one is used to denote daylight savings time from non daylight savings time.\n");
		System.out
				.println("Return the most recently modified file in the given directory: ");
		System.out.println(fs.latestModifiedFile() + "\n");

		System.out
				.println("Return the least recently modified file in the given directory: ");
		System.out.println(fs.earliestModifiedFile() + "\n");

		System.out
				.println("Return whether the given file exists or not in the given directory: ");
		System.out
				.println("What is the name of the file you are looking for? ");
		System.out.println(fs.fileExists(READER.nextLine()) + "\n");

		System.out
				.println("Return the number of files in the given directory and subdirectories: ");
		System.out.println("There are " + fs.filesInDirectory() + " files in the directory.\n");

		System.out
				.println("Return the size of all of the files in the given directory and subdirectories: ");
		System.out.println(fs.directorySize() + " MB\n");

	}

	public String getLargestFile() {
		double largest = 0;
		String largestName = null;
		if (dir.isDirectory()) { // check to make sure it is a directory
			File files[] = dir.listFiles(); // make array of filenames.
			for (int i = 0; i < files.length; i++) {
				if (files[i].length() > largest) {
					largest = files[i].length();
					largestName = files[i].getName();
				}
			}
		}
		return largestName + " at\n" + (largest / (Math.pow(1024, 2))) + " MB";
	}

	public String getSmallestFile() {
		double smallest = Double.POSITIVE_INFINITY;
		String smallestName = null;
		if (dir.isDirectory()) { // check to make sure it is a directory
			File files[] = dir.listFiles(); // make array of filenames.
			for (int i = 0; i < files.length; i++) {
				if (files[i].length() < smallest) {
					smallest = files[i].length();
					smallestName = files[i].getName();
				}
			}
		}
		return smallestName + " at\n" + (smallest / (Math.pow(1024, 2)))
				+ " MB";
	}

	public String latestModifiedFile() {
		double latestModified = 0;
		String latestModifiedName = null;
		if (dir.isDirectory()) { // check to make sure it is a directory
			File files[] = dir.listFiles(); // make array of filenames.
			for (int i = 0; i < files.length; i++) {
				if (files[i].lastModified() > latestModified) {
					latestModified = files[i].lastModified();
					latestModifiedName = files[i].getName();
				}
			}
		}
		return latestModifiedName + " at\n"
				+ convertDateFromEpoch(latestModified);
	}

	public String earliestModifiedFile() {
		double earliestModified = Double.POSITIVE_INFINITY;
		String earliestModifiedName = null;
		if (dir.isDirectory()) { // check to make sure it is a directory
			File files[] = dir.listFiles(); // make array of filenames.
			for (int i = 0; i < files.length; i++) {
				if (files[i].lastModified() < earliestModified) {
					earliestModified = files[i].lastModified();
					earliestModifiedName = files[i].getName();
				}
			}
		}
		return earliestModifiedName + " at\n"
				+ convertDateFromEpoch(earliestModified);
	}

	public boolean fileExists(String fileName) {
		if (dir.isDirectory()) { // check to make sure it is a directory
			String fileNames[] = dir.list(); // make array of filenames.
			for (int i = 0; i < fileNames.length; i++) {
				if (fileNames[i].equals(fileName)) {
					return true;
				}
			}
		}
		return false;
	}

	public int filesInDirectory() {
		if (dir.isDirectory()) { // check to make sure it is a directory
			String fileNames[] = dir.list(); // make array of filenames.
			return fileNames.length;
		}
		return 0;
	}

	// Returns the directory size in MB.
	public double directorySize() {
		double directorySize = 0;
		if (dir.isDirectory()) { // check to make sure it is a directory
			File files[] = dir.listFiles(); // make array of filenames.
			for (int i = 0; i < files.length; i++) {
				directorySize += files[i].length();
			}
		}
		return directorySize / (Math.pow(1024, 2));
	}

	// For readability we will convert the unix tie to long hand so it is
	// readable.
	public String convertDateFromEpoch(double unixTime) {
		// Cast our time returned as a double into an long.
		long timeStamp = (long) unixTime;
		// Use hava's date API to convert from epoch to long hand.
		Date d = new Date(timeStamp);
		// Self explanatory.
		return d.toString();
	}
}
