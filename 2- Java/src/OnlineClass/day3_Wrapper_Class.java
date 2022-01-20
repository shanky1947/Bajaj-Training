package OnlineClass;

public class day3_Wrapper_Class {

	//Wrapper class- converts primitive data types into objects, as object has various advantages, can be passed by reference
	//Autoboxing
	public static void main(String[] args) {
		int i = 10; 					//integer primitive data type
		
		Integer i1 = new Integer(10);   //Boxing -> Wrapping -> binding into object
		
		Integer val = i;   				//Autboxing -> automatic conversion to object 
		
		int j = i1.intValue();  		//Unboxing -> convert from object to primitive data type
		
		int k = i1;						//Auto-unboxing -> automtic converion to pdt
	}

}
