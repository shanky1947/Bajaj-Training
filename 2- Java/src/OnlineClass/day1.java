package OnlineClass;

public class day1 {
	public static void main(String[] args) {
		variable var=new variable();
		var.method();
		
		day1 d=new day1();
		d.operators();
	}
	
	public void operators() {
		// Unary operators -> ++, --, 
		int a=10;
		System.out.println(a++);
		System.out.println(++a);
		System.out.println(a--);
		System.out.println(--a);
	}
	
	public void typecast(){
		// WIDENING
		// int a=20;
		// float b=a; 
				
		// NARROWING
		float a=20.666f;
		// int b = a;           //error- wrong way
		int b = (int)a;         //correct way
				
		System.out.println(a);
		System.out.println(b);
	}

	public void string1(){
		int a=10;
		String s="Shashank";
		String ss=s+a;
		System.out.println(ss);
		
		String msg="I am in \"Java\" class!";
		String msg1="I am in Bajaj\"s session";
		System.out.println(msg1);
	}
	
	public void math1(){
		double max_val=Math.max(10, 20);
		System.out.println(max_val);
		System.out.println(Math.sqrt(64));
		System.out.println(40/23);
		System.out.println(Math.ceil(40.0/23.0));
		System.out.println(Math.floor(40.0/23.0));
		System.out.println(Math.abs(-20));
		System.out.println(Math.random());
	}
	
	public void greatest(){
		int a=10;
		int b=20;
		int c=30;
		if(a>b) {
			if(a>c)
				System.out.println("A is greatest");
			else
				System.out.println("C is greatest");
		}
		else {
			if(b>c)
				System.out.println("B is greatest");
			else
				System.out.println("C is greatest");
		}
	}
}

class variable{
	static int a = 10; //Static variable
	public void method() {
		int b=20;  //local variable
	}

	void method1() {
		int c=30;   //instance variable
		System.out.print(c);
		System.out.println(c);
	}
}
