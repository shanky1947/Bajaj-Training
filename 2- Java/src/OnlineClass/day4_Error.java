package OnlineClass;

public class day4_Error {

	public static void age(int a){
		if(a<18) {
			throw new ArithmeticException("Candidate age not eligible for VoterID");
		}
		else {
			System.out.println("Valid age");
		}
	}
	public static void main(String[] args) {
		
		age(10);
		try {
//			int a[]=new int[5];
//			a[6]=10;
			int j=5/0;  //critical statement
		}
		catch(ArrayIndexOutOfBoundsException e) {
			System.out.println(e);
			System.out.println("Dont assign value after index completed");
		}
		catch(ArithmeticException e) {
			System.out.println(e);
			System.out.println("Dont divide by zero");
		}
		finally {
			System.out.println("Important line");
		}
	}

}
