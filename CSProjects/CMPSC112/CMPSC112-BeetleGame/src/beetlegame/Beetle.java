package beetlegame;

/* Beetle with parts for the beetle game. */
public class Beetle {
	
	/* True if this beetle has a body. */
	private boolean body;

	/* Number of eyes this beetle has, from 0-2. */
	private int eyes;
	
	/* Number of feelers this beetle has, from 0-2 */
	private int feelers;
	
	/* True if this beetle has a head. */
	private boolean head;
	
	/* Number of legs this beetle has, from 0-6. */
	private int legs;
	
	/* True if this beetle has a tail. */
	private boolean tail;

	/* A new beetle has no parts */
	public Beetle(){
		body = false;
		eyes = 0;
		feelers = 0;
		head = false;
		legs = 0;
		tail = false;
	}
	
	/* Try to add a body and return whether this succeeded. */
	public boolean addBody(){
		if(body){
			return false;
		}
		else{
			body = true;
			return true;
		}
	}
	
	/* Try to add an eye and return whether this succeeded. */
	public boolean addEye(){
		if(head && (eyes < 2)){
			eyes++;
			return true;
		}
		else{
			return false;
		}
	}
	
	/* Try to add a head and return whether this succeeded. */
	public boolean addHead(){
		if(body && !head){
			head = true;
			return true;
		}
		else{
			return false;
		}
	}
	
	/* Try to add a feeler and return whether this succeeded. */
	public boolean addFeeler(){
		if(head && (feelers < 2)){
			feelers++;
			return true;
		}
		else{
			return false;
		}
	}
	
	/* Try to add a leg and return whether this succeeded. */
	public boolean addLeg(){
		if(body && (legs < 6)){
			legs++;
			return true;
		}
		else{
			return false;
		}
	}
	
	/* Try to add a tail and return whether this succeeded. */
	public boolean addTail(){
		if(body && !tail){
			tail = true;
			return true;
		}
		else{
			return false;
		}
	}
	
	/* Return true if this beetle has all of its parts. */
	public boolean isComplete(){
		return body && (eyes == 2) && (feelers == 2) && head && (legs == 6) && tail;
	}
	
	/* Make the beetle into a printable string. */
	public String toString(){
		if(body){
			String result = "";
			if(feelers > 0){
				result += "\\";
				if(feelers == 2){
					result += " /";
				}
				result += "\n";
			}
			if(head){
				if(eyes > 0){
					result += "o";
				} else {
					result += " ";
				}
				result += "0";
				if(eyes == 2) { result += "o";}
				result += "\n";
			}
			if(legs > 0){
				result += "-";
			} else {
				result += " ";
			}
			result += "#";
			if(legs > 1){
				result += "-";
			}
			result += "\n";
			if(legs > 2){
				result += "-";
			} else {
				result += " ";
			}
			result += "#";
			if(legs > 3){
				result += "-";
			}
			result += "\n";
			if(legs > 4){
				result += "-";
			} else {
				result += " ";
			}
			result += "#";
			if(legs > 5){
				result += "-";
			}
			if(tail){
				result += "\n v";
			}
			return result;
		} else {
			return "(no parts yet)";
		}
	}
}