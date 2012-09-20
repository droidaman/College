package sourceCode;

public class MagiRunner {

	public static void main(String[] args) {
		MagiChecker mc = new MagiChecker();
		
		int[] a = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		System.out.println(mc.checkVals(a) + "\n\n");
		
		int[] q = {2, 4, 6, 8, 1, 3, 5, 7, 9};
		System.out.println(mc.checkVals(q) + "\n\n");
		
		int[] w = {1, 6, 3, 7, 2, 8, 9, 4, 5};
		System.out.println(mc.checkVals(w) + "\n\n");
		
		int[] e = {6, 1, 8, 7, 5, 3, 2, 9, 4};
		System.out.println(mc.checkVals(e) + "\n\n");
		;
		int[] r = {8, 2, 5, 3, 1, 6, 4, 9, 7};
		System.out.println(mc.checkVals(r) + "\n\n");
		
		int[] t = {2, 7, 3, 6, 9, 5, 4, 8, 1};
		System.out.println(mc.checkVals(t) + "\n\n");
		
		int[] y = {9, 2, 3, 8, 1, 4, 7, 6, 5};
		System.out.println(mc.checkVals(y) + "\n\n");
		
		int[] u = {2, 7, 6, 9, 5, 1, 4, 3, 8};
		System.out.println(mc.checkVals(u) + "\n\n");
		
		int[] i = {4, 9, 2, 3, 5, 7, 8, 1, 6};
		System.out.println(mc.checkVals(i) + "\n\n");
		
		int[] o = {4, 3, 8, 9, 5, 1, 2, 7, 6};
		System.out.println(mc.checkVals(o) + "\n\n");
	}
}
