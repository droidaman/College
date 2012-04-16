package domcode;

import java.util.*;

public class ArrayListDomino implements Domino {
	
	//Create an integer arraylist.
	private ArrayList<Integer> numbers;
	
	//The constructor... add values to the arraylist and set the arraylist size to 2.
	public ArrayListDomino( int left, int right){
		numbers = new ArrayList<Integer>(2);
		numbers.add(left);
		numbers.add(right);
	}
	
	//Moves the value of the second position to the first position.
	public void flip(){
		int flip = numbers.get(0);
		numbers.set(0,numbers.get(1));
		numbers.set(1, flip);
	}
	
	//Returns the value of the left side of the domino.
	public int getLeft(){
		return numbers.get(0);
	}
	
	//Returns the value of the right side of the domino.
	public int getRight(){
		return numbers.get(1);
	}
	
	//Returns the string representation of the domino.
	public String toString(){
		return numbers.get(0) + "-" + numbers.get(1);
	}
}