package cnSource;

public class Die {
	
	/* Face of die that is showing. */
	private int topFace;
	
	/* Create a Die, print it, roll it, and print it again.	*/
	public static void main(String[] args) {
		Die d = new Die();
		System.out.println("Before rolling: " + d.getTopFace());
		d.roll();
		System.out.println("After rolling: " + d.getTopFace());
	}

	/* Initialize top face to face one. */
	public Die(){
		this.topFace = 1;
	}

	/* Return the top face of this die. */
	public int getTopFace(){
		return this.topFace;
	}
	
	/* Set the top face to the specified value */
	public void setTopFace(int topFace){
		this.topFace = topFace;
	}
	
	/* Set the top face to a random int between 1 and 6, inclusive. */
	public void roll(){
		this.topFace = ((int)(Math.random()*6)) + 1;
	}
	
	/* Return the current top face as a string. */
	public String toString(){
		return "" + topFace;
	}
}
