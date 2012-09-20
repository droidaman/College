package sourceCode;

import java.util.*;

public class IntArray {

	private int[] ia;
	
	public IntArray(int[] arrayToUse){
		ia = arrayToUse;
	}
	
	public String toString(){
		String stringToReturn = "";
		
		for(int i = 0; i < ia.length; i++){
			stringToReturn += ia[i] + ", ";
		}
		
		return stringToReturn;
	}
	
	public int getElement(int index){
		return ia[index];
	}
	
	public void setElement(int index, int setTo){
		ia[index] = setTo;
	}
	
	public boolean inAscendingOrder(){		
		for(int i = 1; i < ia.length; i++){
			if(i-1 < i){
				//do nothing, the numbers are in irder so far.
			} else {
				return false;
			}
		}
		return true;
	}
	
	public int findSmallest(){
		int isSmallest = ia[0];
		
		for(int i = 0; i < ia.length; i++){
			if(ia[i] < isSmallest){
				isSmallest = ia[i];
			}
		}		
		return isSmallest;
	}
	
	public int sum(){
		int runningSum = 0;
		
		for(int i = 0; i < ia.length; i++){
			runningSum += ia[i];
		}
		return runningSum;
	}
	
	public int product(){
		int runningProduct = 0;
		
		for(int i = 0; i < ia.length; i++){
			runningProduct *= ia[i];
		}
		return runningProduct;
	}
	
	public double mean(){
		int mean = 0;
		
		for(int i = 0; i < ia.length; i++){
			mean += ia[i];
		}
		return mean/ia.length;
	}
	
	public int size(){
		return ia.length;
	}
}
