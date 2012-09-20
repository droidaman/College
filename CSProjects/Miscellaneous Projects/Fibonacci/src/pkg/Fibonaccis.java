package pkg;

public class Fibonaccis {

	public static void main(String[] args) {
		looper(1, 1);
	}

	public static void looper(long a, long b) {
		//Fibonacci sequence it up!
		long temp;
		temp = b;
		b = a + b;
		a = temp;
		System.out.println(b);
		
		//Keep int from overflowing
		if(b <= 2147483647)
		looper(a, b);
	}
}