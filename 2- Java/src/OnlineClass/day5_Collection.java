package OnlineClass;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class day5_Collection {

	public static void main(String[] args) {
//		Collection values = new ArrayList();
		
//		Collection<integer> values = new ArrayList<Integer>();  //GENERIC FORM
		ArrayList<Integer> values = new ArrayList<>();
		
		values.add(50);
		values.add(20);
		values.add(30);
		values.add(2, 40);  //Add at 2nd index
		values.add(10);
		
		System.out.println("Using enhanced for loop");
		for(Object i:values) {
			System.out.print(i+" ");
		}
		
		System.out.println("Printing using Iterator");
		Iterator it = values.iterator();
		while(it.hasNext()) {
			System.out.print(it.next()+" ");
		}
		
		System.out.println("Directly printing");
		System.out.println(values);
		
		System.out.println("Using get");
		for(int i=0;i<values.size();i++) {
			System.out.print(values.get(i)+" ");
		}
		
		//SET
		Set<Integer> values1 = new HashSet<>();
		values1.add(50);
		values1.add(10);
		values1.add(30);
		values1.add(30);
		
		System.out.println("Priting hash set");
		Iterator it1 = values1.iterator();
		while(it1.hasNext()) {
			System.out.print(it1.next()+" ");
		}
	}

}
