package buggyCodeTest;

public class Swapper {

	/**
	 * @param args
	 */
	int stuff[] = {15, 4, 9, 3, 0};
	
	public static void main(String[] args)
	{
		new Swapper ();
	}

	public Swapper()
	{
		swap(0, 1);
		
		for (int i = 0; i < stuff.length; i++)
		{
			System.out.print(stuff[i]);
			System.out.print(" ");
		}
	}
	public void swap(int i, int j)
	{
		int temp = stuff [i];
		stuff[i] = stuff[j];
		stuff[j] = temp;
	}
}
