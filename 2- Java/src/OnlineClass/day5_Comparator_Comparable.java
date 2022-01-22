package OnlineClass;
import java.util.*;  
import java.io.*;  

// COMPARABLE - sort based on single element
class Student implements Comparable<Student>{  
	int rollno;  
	String name;  
	int age;  
	Student(int rollno,String name,int age){  
		this.rollno=rollno;  
		this.name=name;  
		this.age=age;  
	}  
	public int compareTo(Student st){  
		if(age==st.age)  
			return 0;  
		else if(age>st.age)  
			return 1;  
		else  
			return -1;  
	}  
}  
//Creating a test class to sort the elements  
public class day5_Comparator_Comparable{  
	public static void main(String args[]){  
		ArrayList<Student> al=new ArrayList<Student>();  
		al.add(new Student(101,"Vijay",23));  
		al.add(new Student(106,"Ajay",27));  
		al.add(new Student(105,"Jai",21));  

		Collections.sort(al);  //not giving object of comparable function
		for(Student st:al){  
			System.out.println(st.rollno+" "+st.name+" "+st.age);  
		}  
	}  
}  
//------------------------------------------------------------------------------------------

// COMPARATOR
class Student1{  
	int rollno;  
	String name;  
	int age;  
	Student1(int rollno,String name,int age){  
		this.rollno=rollno;  
		this.name=name;  
		this.age=age;  
	}  
}   
//AGE COMPARATOR
class AgeComparator implements Comparator<Student1>{  
	public int compare(Student1 s1,Student1 s2){  
		if(s1.age==s2.age)  
			return 0;  
		else if(s1.age>s2.age)  
			return 1;  
		else  
			return -1;  
	}  
}  
//NAME COMPARATOR
class NameComparator implements Comparator<Student1>{  
	public int compare(Student1 s1,Student1 s2){  
		return s1.name.compareTo(s2.name);  
	}  
} 
class Test{  
	public static void main(String args[]){  
		//Creating a list of students  
		ArrayList<Student1> al=new ArrayList<Student1>();  
		al.add(new Student1(101,"Vijay",23));  
		al.add(new Student1(106,"Ajay",27));  
		al.add(new Student1(105,"Jai",21));  

		System.out.println("Sorting by Name");  
		//Using NameComparator to sort the elements  
		Collections.sort(al,new NameComparator());  
		//Traversing the elements of list  
		for(Student1 st: al){  
			System.out.println(st.rollno+" "+st.name+" "+st.age);  
		}  

		System.out.println("sorting by Age");  
		//Using AgeComparator to sort the elements  
		Collections.sort(al,new AgeComparator());  
		//Travering the list again  
		for(Student1 st: al){  
			System.out.println(st.rollno+" "+st.name+" "+st.age);  
		}  

	}  
}