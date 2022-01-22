package OnlineClass;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class day5_File {

	public static void main(String[] args) throws IOException{
		bufferReader();
		System.out.println();
		scanner();
		System.out.println();
		input();
	}
	public static void bufferReader() throws IOException {
		//Reading using BUFFER READER
		// File path is passed as parameter
		File file = new File("D:\\Documents\\Important Docs\\About Yourself\\Links.txt");
		
		// Creating an object of BufferedReader class
		BufferedReader br = new BufferedReader(new FileReader(file));
		
		// Declaring a string variable
		String st;
		
		// Condition holds true till there is character in a string
		while ((st = br.readLine()) != null)
			// Print the string
			System.out.println(st);
	}
	
	public static void scanner() throws FileNotFoundException {
		File file = new File("D:\\Documents\\Important Docs\\About Yourself\\Links.txt");
		
		Scanner sc = new Scanner(file);
		
		while(sc.hasNextLine()) {
			System.out.println(sc.nextLine());
		}
	}
	public static void input() {
		int num;
		System.out.println("Enter a number: ");
		
		Scanner sc = new Scanner(System.in);
		
		num = sc.nextInt();
		System.out.println("Entered number is :"+num);
	}
}
