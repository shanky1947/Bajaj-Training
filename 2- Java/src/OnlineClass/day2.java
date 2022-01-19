package OnlineClass;

public class day2 {
	
	// Constructors
	int eid;
	String ename;
	static String temp="abc";
	
	day2(int id, String name){
		eid=id;
		ename=name;
	}
	
	day2(){
		System.out.println("Default constructor is running");
	}
	
	void display() {
		temp="bbc";
		System.out.println(eid + " " + ename+ " "+temp);
	}
	
	//Static Block- Runs before void main
	static {
		int a=10;
		System.out.println("Static block is running "+a);
	}
	public static void main(String[] args) {
		
		day2 d=new day2();
		
		day2 d1=new day2(1, "Shashank");
		day2 d2=new day2(2, "Mihir");
		d1.display();
		d2.display();
		
		fun1(4);
		day2.fun1(4);
	}
	
	public static void fun1(int a) {
		System.out.println(a);
	}
	
	public static void loop() {
		int i=0;
		for(;i<5;i++) {
			System.out.println(i);
		}
		i=0;
		while(i<5) {
			System.out.println(i);
			i++;
		}
		i=0;
		do {
			System.out.println(i);
			i++;
		}while(i<5);
	}
}
