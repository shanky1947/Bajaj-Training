package OnlineClass;

//Anonymous class
class A{
	public void display() {
		System.out.println("This is a display method");
	}
}
/*class B extends A{   //Instead of making separate class to override function we can use concept of anonymous class
	public void display() {
		System.out.println("This is not a display method");
	}
}*/
//-----------------------------------------------------------
//Anonymous class with Interface
interface interface1{
	void display();
	void display1();
}
/*class B implements interface1{  //Instead of making separate class to implement interface we can use concept of anonymous class
	public void display() {
		System.out.println("This is not a display method");
	}
}*/
//-------------------------------------------------------------
//Lambda Expression
interface interface2{
	void display();
}
interface interface3{
	void display(int a);
}

abstract class c{
	public void display() {
		System.out.println("add");
	}
}
public class day4_Anonymous {
	public static void main(String[] args) {
		A a1 = new A() {
			public void display() {
				System.out.println("This is not a display method");
			}
		};
		a1.display();
		//------------------------------------------------
		interface1 i1=new interface1() {
			public void display() {
				System.out.println("This is not a display method");
			}
			public void display1() {
				System.out.println("This is another method");
			}
		};
		i1.display();
		//-------------------------------------------------
		//Lambda Expression
		interface2 i2=()->System.out.println("This is another method");
		i2.display();
		
		interface3 i3=(a)->System.out.println(a);
		i3.display(20);
		
		//Error-> Lambda experession do not works with abstract class, works only with functional interfaces
		c cc=()->System.out.println("sdd");
		
		cc.display();
	}
}
