package OnlineClass;

public class exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		exercise1 e=new exercise1();
		e.switchs();
	}
	
	public void operators() {
		int a=10;
		int b=20;
		int c=30;
		int d;
		
		//Unary
		d=++a + a--;
		System.out.println(c);
		
		//Arithmetic
		d=b/a*c;
		System.out.println(d);
		
		//Logical
		boolean aa=true;
		boolean bb=false;
		System.out.println(aa || bb);
		System.out.println(aa && bb);
		
	}
	
	public void primeNumber() {
		int a=23;
		int i=2;
		for(;i<23;i++) {
			if(a%i==0)
				break;
		}
		if(i==23)
			System.out.println(a + " is Prime Number");
		else
			System.out.println(a + " is not a Prime Number");
	}
	
	public void leap() {
		int year=1998;
		if(year%4==0 || year%400==0) {
			System.out.println(year + " is a leap year");
		}
		else
			System.out.println(year + " is not a leap year");
	}
	
	public void sum10() {
		int s=0;
		int i=1;
		while(i<11) {
			s+=i;
			i++;
		}
		System.out.println("Some of first 10 numbers is "+s);
	}
	
	public void switchs() {
		String day="Saturday";
		switch(day) {
			case "Monday":
				System.out.println("Today there is sql class");
				break;
			case "Tuesday":
				System.out.println("Today there is JAVA class");
				break;
			case "Wednesday":
				System.out.println("Today there is Nodejs class");
				break;
			case "Thursday":
				System.out.println("Today there is MondoDB class");
				break;
			case "Friday":
				System.out.println("Today there is Pyspark class");
				break;
			case "Saturday":
				System.out.println("Today there is NO class");
				break;
			default:
				System.out.println("Wrong value entered");
				break;
		}
	}
}
