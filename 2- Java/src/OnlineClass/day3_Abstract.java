package OnlineClass;

abstract class Human{
	public abstract void eat();
	
	public void walk() {
		System.out.println("Human walks");
	}
}
class Man extends Human{
	public void eat() {
		System.out.println("Human eats");
	}
}

public class day3_Abstract {
	public static void main(String[] args) {
		//Human h=new Human();
		Human h = new Man(); //Reference to abstract class- also called Upcasting
		h.eat();
		h.walk();
	}
}
