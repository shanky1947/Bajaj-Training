package OnlineClass;

import java.util.Arrays;

public class day3 {

	public static void main(String[] args) {
		int arr[] = new int[8];
		arr[0]=10;
		arr[1]=20;
		arr[2]=30;
		arr[3]=40;
		arr[4]=50;
		arr[5]=60;
		arr[6]=70;
		//OR int arr[] = {10,20,30,40,50,60,70};
		for(int i=0;i<7;i++)
			System.out.println(arr[i]);
		for(int k:arr) { //Enhanced for loop
			System.out.println(k);
		}
		System.out.println(Arrays.toString(arr));
		//-----------------------------------
		
		//Array of Objects
		day3 d1=new day3();
		day3 d2=new day3();
		day3 d3=new day3();
		
		day3 arrObject[] = {d1, d2, d3};
		for(int i=0;i<3;i++)
			System.out.println(arrObject[i]);
		//-------------------------------------
		
		//2-D Array
		int arr1[]= {1,2,3};
		int arr2[]= {4,5,6};
		int arr3[]= {7,8,9};
		
		int arr4[][]= {
						{1,2,3},
						{4,5,6},
						{7,8,9}
					  };
		for(int i=0;i<3;i++) {
			for(int j=0;j<3;j++) {
				System.out.println(arr4[i][j]);
			}
		
		}
	}

}
