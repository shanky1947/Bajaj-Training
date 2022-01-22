package OnlineClass;

public class day5_Inner_Class {

	private int data=30;  
	class Inner{  
		void msg(){System.out.println("data is "+data);}  
	}  
	public static void main(String args[]){  
		day5_Inner_Class obj=new day5_Inner_Class();  
		day5_Inner_Class.Inner in=obj.new Inner();  
		in.msg();  
	}  
}  