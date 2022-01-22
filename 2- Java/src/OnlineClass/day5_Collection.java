package OnlineClass;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class day5_Collection {

	public static void main(String[] args) {
		//ARRAY LIST COLLECTION
		//Collection values = new ArrayList();
		
		//Collection<integer> values = new ArrayList<Integer>();  //GENERIC FORM
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
		
		System.out.println("Using get");
		for(int i=0;i<values.size();i++) {
			System.out.print(values.get(i)+" ");
		}
		
		System.out.println("Directly printing");
		System.out.println(values);
		
		Collections.sort(values);  //in ascending order
		Collections.reverse(values);  //in reverse order of value added 
		System.out.println(values);
//---------------------------------------------------------------------------------
		
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
		//Collections.sort(values1); //reverse and sort do not works with set
		//Use TREESET to store in sorted set
		Set<Integer> values2 = new TreeSet<>();
		values2.add(50);
		values2.add(10);
		values2.add(30);
		values2.add(30);
		
		System.out.println("Output of TreeSet which is sorted: "+values2);
//---------------------------------------------------------------------------------	
		
		//COMPARATOR FUNCTION
		List<Integer> values3 = new ArrayList<>();
		values3.add(209);
		values3.add(501);
		values3.add(707);
		values3.add(403);
		//209 501 707 403
		
		Comparator <Integer> c = new Comparator<Integer>() {
			public int compare(Integer x, Integer y) {
				if(x%10>y%10)
					return 1;
				else
					return -1;
			}
		};
		Collections.sort(values3, c);
		System.out.println("Sorted based on last digit using comparator function: "+values3);
	}
}




















