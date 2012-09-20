import java.util.*;

public class temp {
	
	public static int ia[] = {1,2,3,4,5,6,7,8,9};

	public static void main (String args[]){
		temp r = new temp();
		
		System.out.println("Before:");
		for (int i = 0; i < ia.length; i++){
			System.out.print(ia[i] + " ");
		}
		
		r.rotator();
		
		System.out.println("\nAfter:");
		for (int i = 0; i < ia.length; i++){
			System.out.print(ia[i] + " ");
		}
	}
	
	public int[] rotator(){
		int temp = ia[0];
		
		for (int i = 0; i < ia.length-1; i++){
			ia[i] = ia[i + 1];
		}
		ia[ia.length - 1] = temp;
		return ia;
	}
	
}
