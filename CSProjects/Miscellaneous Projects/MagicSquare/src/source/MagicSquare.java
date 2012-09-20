package source;

import java.util.*;

public class MagicSquare {
	
	public  ArrayList<int[]> makeChildren (int[] board, int theNum){

		ArrayList<int[]> container = new ArrayList<int[]>();
		
		for (int i = 0; i < board.length; i++){
			int[] newBoard = copy(board);
			
			if(newBoard[i] == 0){
				newBoard[i] = theNum;
				container.add(newBoard);
			}
		}
		return container;
	}
	
	public int[] copy(int[] board){
		int[] theCopy = new int[board.length];
		for(int i = 0; i < board.length; i++){
			theCopy[i] = board[i];
		}
		return theCopy;
	}
}