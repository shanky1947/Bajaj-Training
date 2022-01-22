package OnlineClass;

public class day5_Garbage_Collector {

	public void finalize(){System.out.println("object is garbage collected");}  
	public static void main(String args[]){  
		day5_Garbage_Collector s1=new day5_Garbage_Collector();  
		day5_Garbage_Collector s2=new day5_Garbage_Collector();  
		s1=null;  
		s2=null;  
		System.gc();  
	}  
} 
