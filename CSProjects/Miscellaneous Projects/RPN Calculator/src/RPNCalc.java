import java.util.Scanner;

/**
 * 
 */

/**
 * @author Tim
 *
 */
public class RPNCalc {

	public RPNStack calc = new RPNStack();
	public static final Scanner INPUT = new Scanner(System.in);
	public String operator = "";
	public int x = 0;
	public int count = 0;

	/**
	 * Method to check if the input is an operator
	 */
	public boolean isOperator(){
		if ((operator.equals( "+")) || (operator.equals("-")) || (operator.equals("/")) || (operator.equals("*"))) {
			return true;
		}
		else {
			return false;
		}
	}
	
	/**
	 * Method for putting values into the calculator and calculating
	 */
	public int calcInput() {
		if(count == 0)
		{
			System.out.print("Please enter two numeric values: ");
		} else {
			System.out.print("Please enter one more numeric value: ");
		}
		while(count < 2)
		{
			x = INPUT.nextInt();
			calc.push(x);
			count++;
		}
		count = 1;
		
		System.out.print("Please enter the operator: ");
		operator = INPUT.next();
		if(isOperator() == true) {
			if (operator.equals("+")){
				x = (Integer)(calc.pop()) + (Integer)(calc.pop());
			}
			else if (operator.equals("-")) {
				x = (Integer)(calc.pop()) - (Integer)(calc.pop());
			}
			else if (operator.equals("*")){
				x = (Integer)(calc.pop()) * (Integer)(calc.pop());
			}
			else if (operator.equals("/")){
				x = (Integer)(calc.pop()) / (Integer)(calc.pop());
			}
		}
		calc.push(x);
		return x;
	}
	
	public static void main(String[] args) {
		RPNCalc rpnc = new RPNCalc();
		
		System.out.println("Welcome to the RPN Calculator");
		
		while(true)
		{
			System.out.println("Calculated result: " + rpnc.calcInput() + "\nWould you like to perform another operation with this number? [y/n]");
			String response = INPUT.next();
			if(response.equals("Y") || response.equals("y")){
				//Don't do anything, it'll bring you back through the loop.
			} else {
				System.out.print("\nOkay, goodbye!");
				break;
			}
			
			
		}
	}
}
