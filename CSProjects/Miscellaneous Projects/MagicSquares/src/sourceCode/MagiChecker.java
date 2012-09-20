package sourceCode;

public class MagiChecker {
	
	public int[] toCheck = null;

	//public void checkVals(Node<int[]> nal) {
	//	toCheck = nal.getItem();
	public String checkVals(int[] nal){
		toCheck = nal;
		if(checkVert() && checkHoriz() && checkDiag())
		{
			return " This IS a magic square!!";
		} else {
			return " Sorry, this is not a magic square.";
		}
	}
	
	public boolean checkVert(){
		if (toCheck[0] + toCheck[1] + toCheck[2] == 15 && toCheck[3] + toCheck[4] + toCheck[5] == 15 && toCheck[6] + toCheck[7] + toCheck[8] == 15){
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkHoriz(){
		if (toCheck[0] + toCheck[3] + toCheck[6] == 15 && toCheck[1] + toCheck[4] + toCheck[7] == 15 && toCheck[2] + toCheck[5] + toCheck[8] == 15){
			return true;
		} else {
			return false;
		}
	}
	
	public boolean checkDiag(){
		if (toCheck[0] + toCheck[4] + toCheck[8] == 15 && toCheck[2] + toCheck[4] + toCheck[6] == 15){
			return true;
		} else {
			return false;
		}
	}

}