package OnlineClass;

public class day2_Inheritance {
	void fun1() {
		System.out.println("fun 1");
	}
}

// Final class cannot be inherited
/*
 * public final class day2_Inheritance { int salary; }
 */

//---------------------------------------
//Single Inheritance
/*
 * class subClass extends day2_Inheritance{ int bonus=10000;
 * 
 * public static void main(String[] args) { subClass i= new subClass();
 * 
 * System.out.println("Salary is "+i.salary);
 * System.out.println("Bonus is "+i.bonus); } }
 */

//--------------------------------------------
// Multi level Inheritance
/*
 * class subClass1 extends day2_Inheritance{ void fun2() {
 * System.out.println("fun 2"); } }
 * 
 * class subClass extends subClass1{ void fun3() { System.out.println("fun 3");
 * } public static void main(String[] args) { subClass c1=new subClass();
 * c1.fun1(); c1.fun2(); c1.fun3(); } }
 */

//-------------------------------------------------
// Method Overriding
/*
 * class Animal{ public void sound() {
 * System.out.println("Animal makes different sounds"); } } class Dog extends
 * Animal{ public void sound() { super.sound(); System.out.println("Dog barks");
 * } } class Cat extends Animal{ public void sound() {
 * System.out.println("Cat makes sounnd MEoww"); } } class subClass{ public
 * static void main(String[] args) { Animal a1=new Animal(); Dog a2=new Dog();
 * Cat a3=new Cat();
 * 
 * a1.sound(); a2.sound(); a3.sound(); } }
 */

//Use of SUPER keryword
class Employee {
	int id;
	String ename;

	Employee(int id, String ename) {
		this.id = id;
		this.ename = ename;
	}
}

class Employee1 extends Employee {
	int salary;

	Employee1(int sal, int id, String ename) {
		super(id, ename);
		this.salary = sal;
	}

	void display() {
		System.out.println(id + " " + ename + " " + salary);
	}
}

class subClass {

	public static void main(String[] args) {
		Employee1 e1 = new Employee1(23000, 101, "Vibhor");
		e1.display();

	}

}
