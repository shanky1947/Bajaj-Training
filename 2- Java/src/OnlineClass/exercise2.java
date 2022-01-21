package OnlineClass;

public class exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[]= {1,2,1,3,4,3,3};
		exercise2 e=new exercise2();
		sort(arr);
		System.out.println();
		e.binarySearch(arr);
	}
	public void values(int arr[]) {
		for(int i=0;i<arr.length;i++)
			System.out.println(arr[i]);
	}
	public void reverse(int arr[]) {
		for(int i=arr.length-1;i>=0;i--)
			System.out.println(arr[i]);
	}
	public void duplicate(int arr[]) {
		 for(int i=0;i<arr.length;i++) {
			 if(arr[i]==-1)
				 continue;
			 int f=0;
			 for(int j=i+1;j<arr.length;j++) {
				 if(arr[i]==arr[j]) {
					 f=1;
					 arr[j]=-1;
				 }
			 }
			 if(f==1)
				 System.out.println(arr[i]);
		 }
	}
	public static void swap(int arr[], int i, int j) {
		int temp=arr[i];
		arr[i]=arr[j];
		arr[j]=temp;
	}
	public static void sort(int arr[]) {
		for(int i=0;i<arr.length;i++) {
			for(int j=i+1;j<arr.length;j++) {
				if(arr[j]<arr[i]) {
					swap(arr, i, j);
				}
			}
		}
		for(int i=0;i<arr.length;i++)
			System.out.print(arr[i]+ " ");
	}
	public void count() {
		String s="The best of both worlds";
		int blankSpace=0;
		for(int i=0;i<s.length();i++) {
			if(s.charAt(i)==' ')
				blankSpace++;
		}
		System.out.println(s.length()-blankSpace);
		
	}
	public void binarySearch(int arr[]) {
		int x=2;
		sort(arr);
		System.out.println();
		int si=0, ei=arr.length;
		int mid=0;
		while(si<ei) {
			mid=(si+ei)/2;
			if(x<arr[mid])
				ei=mid-1;
			else if(x>arr[mid])
				si=mid+1;
			else
				break;
		}
		System.out.println("Index at which "+x+" occurs is "+mid);
	}
	public void pattern() {
		for(int i=0;i<5;i++) {
			for(int j=0;j<=i;j++)
				System.out.print("*");
			System.out.println(" ");
		}
	}
	public void reverse() {
		for(int i=5;i>0;i--) {
			for(int j=i;j>0;j--)
				System.out.print("*");
			System.out.println();
		}
	}
}




















