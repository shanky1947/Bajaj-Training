package OnlineClass;

/*interface Animal1{
	public void animalSound();  //interface method does not have a body
	public void sleep();	
}
interface Animal2{
	public void eat();
}
class Dog{
	
}
//pig "implements" the Animal interface
class Pig extends Dog implements Animal1, Animal2{
	public void animalSound() {
		System.out.println("The pig sound....");
	}
	public void sleep() {
		System.out.println("zzzzzzz");
	}
	public void eat() {
		System.out.println("Eat method...");
	}
}*/

//Exercise
interface Polygon{
	public int area(int a, int b);
}
class Rectangle implements Polygon{
	public int area(int a, int b) {
		return a*b;
	}
}
class Triangle implements Polygon{
	public int area(int a, int b) {
		double ar=0.5*a*b;
		return ((int)ar);
	}
}

public class day4_Interface {

	public static void main(String[] args) {
//		Pig m=new Pig();
//		m.animalSound();
//		m.sleep();
//		m.eat();
		Rectangle r=new Rectangle();
		System.out.println(r.area(10, 20));
		Triangle t=new Triangle();
		System.out.println(t.area(10, 20));
	}

}
