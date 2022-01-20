package OnlineClass;

public class day3_Wrapper_Class {

	//Wrapper class- converts primitive data types into objects, as object has various advantages, can be passed by reference
	
	public static void main(String[] args) {
		int i = 10; 					//integer primitive data type
		
		Integer i1 = new Integer(10);   //Boxing -> Wrapping -> binding into object
		
		Integer val = i;   				//Autboxing -> automatic conversion to object 
		
		int j = i1.intValue();  		//Unboxing -> convert from object to primitive data type
		
		int k = i1;						//Auto-unboxing -> automtic converion to pdt
		
		System.out.println(((Object)k).getClass().getSimpleName()); //to check class of data type
		
		
		//CUSTOM WC
		wrapperClass w = new wrapperClass(10);
		System.out.println(w);
	}

}

// CUSTOM WRAPPER CLASS - my class only responsible for converting primitive dt to objects
class wrapperClass{
	private int a;
	
	wrapperClass(int a){
		this.a=a;
	}
	
	public int show() {
		return a;
	}
	public void define(int a) {
		this.a=a;
	}
	public String toSting() {  //wrapping up my integer data into string
		return Integer.toString(a);
	}
}


