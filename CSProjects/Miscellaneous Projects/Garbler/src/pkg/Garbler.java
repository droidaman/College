package pkg;

import java.util.*;

public class Garbler {
	
	public static void main(String[] args) {
		String dater;
		int eloc;
		
		Scanner reader = new Scanner(System.in);
		Garbler g = new Garbler();
		
		System.out.print("What is your string? ");
		dater = reader.nextLine().toLowerCase();
		
		eloc = g.checker(dater);
		System.out.println(g.scrambler(dater, eloc));
		
	}
	
	public int checker(String s){
		return s.indexOf('e');
	}
	
	public String scrambler(String s, int i){

		return "8";
	}

}
