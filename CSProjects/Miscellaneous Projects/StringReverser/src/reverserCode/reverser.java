package reverserCode;

public class reverser {

	public String flipString(String s){
		String flippedString = "";
		for(int i = s.length() - 1; i >= 0; i--){
			flippedString += s.charAt(i);
		}
		
		//Just a little bit of debugging information!
		System.out.println("\nDebugging information:\n     Before the flip: " + s + "     After the flip:  " + flippedString + "\n");
		
		return flippedString;
	}
}