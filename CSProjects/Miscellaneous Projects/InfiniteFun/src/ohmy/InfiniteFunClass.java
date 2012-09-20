package ohmy;

public class InfiniteFunClass {

	static double crazyPositiveNumber = 0;
	static double crazyNegativeNumber = 0;
	
	public static void main(String[] args) {
		crazyPositiveNumber = Double.POSITIVE_INFINITY;
		crazyNegativeNumber = Double.NEGATIVE_INFINITY;
		
		System.out.println("Positive Infinity:\n" + crazyPositiveNumber);
		System.out.println("\nNegative Infinity:\n" + crazyNegativeNumber);		
	}

}
