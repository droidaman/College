package testStudent;

import libpatron.Student;

public class TestStudent
{


	public static void main(String[] args)
	{
		Student s1, s2;
		
		s1=new Student();
		s1.setName("Braden");
		s1.setScore(1, 84);
		s1.setScore(2, 86);
		s1.setScore(3, 88);
		System.out.println("\nHere is student s1\n" + s1);

		s2 = s1;
		s2.setName("Devin");
		System.out.println ("\nName of s1 is now: " + s1);
	}
}