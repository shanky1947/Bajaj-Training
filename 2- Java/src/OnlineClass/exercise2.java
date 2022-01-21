package OnlineClass;

public class exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int arr[]= {1,2,1,3,4,3,3};
		exercise2 e=new exercise2();
		e.sort(arr);
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
	public void swap(int arr[], int i, int j) {
		int temp=arr[i];
		arr[i]=arr[j];
		arr[j]=temp;
	}
	public void sort(int arr[]) {
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
}
