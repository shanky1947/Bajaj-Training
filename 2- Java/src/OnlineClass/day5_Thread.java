package OnlineClass;

//demo to run individual thread
public class day5_Thread extends Thread
{
	public void run(){
		System.out.println("inside Run function");
	}

	public static void main(String[] args){
		Thread th1=new Thread();
		day5_Thread th=new day5_Thread();
		th.start();
		System.out.println("Thread started/ Putside the thread");
		th1.start();
		System.out.println(th1.getState());

	}
}
//-------------------------------------------------------------------------------

//2 classes extending thread class to run 2 threads

//Way 1- BY EXTENDING THREAD CLASS;

class Hi extends Thread{
	public void run(){
		for(int i=1;i<=5;i++){
			System.out.println("Hi");
			try {Thread.sleep(1000);} catch(Exception e) {}
		}
	}
}
class Hello extends Thread{
	public void run(){
		for(int i=1;i<=5;i++){
			System.out.println("Hello");
			try {Thread.sleep(1000);} catch(Exception e) {}
		}
	}
}

//Main class to run threads of defined two classes
public class day5_Thread
{
	public static void main(String [] args){
		Hi h=new Hi();
		Hello h1=new Hello();
		h.start();
		try {Thread.sleep(1000);} catch(Exception e) {}
		h1.start();
	}
}
//--------------------------------------------------------------------------------------

//Way 2- BY IMPLEMENTING RUNNABLE INTERFACE

class Hi1 implements Runnable{
	public void run() {
		for(int i=1;i<=5;i++){
			System.out.println("Hi");
			try {Thread.sleep(1000);} catch(Exception e) {}
		}
	}
}
public class day5_Thread
{
	public static void main(String [] args){
		Hi1 h1=new Hi1();
		
		Thread th = new Thread(h1);
		th.start();
	}
}
//--------------------------------------------------------------------------------------

//Way 3- BY IMPLEMENTING RUNNABLE INTERFACE AS ANONYMOUS CLASS AND LAMBDA EXPRESSION

public class day5_Thread
{
	public static void main(String [] args){
		//Way 1- By creating Object as Anonymous Class
		Runnable MyRunnable = new Runnable() {
			public void run() {
				for(int i=1;i<=5;i++){
					System.out.println("Hi");
					try {Thread.sleep(1000);} catch(Exception e) {}
				}
			}
		};
		Thread th = new Thread(MyRunnable);
		th.start();
		
		//Way 2- Using Lambda Expression
		Runnable MyRunnable =()->{
			for(int i=1;i<=5;i++){
				System.out.println("Hi");
				try {Thread.sleep(1000);} catch(Exception e) {}
			}
		};
		Thread th = new Thread(MyRunnable);
		th.start();
		
		//Way 3- Without creating object as Anonymous Class
		Thread th = new Thread(new Runnable() {
			public void run() {
				for(int i=1;i<=5;i++){
					System.out.println("Hi");
					try {Thread.sleep(1000);} catch(Exception e) {}
				}
			}
		});
		th.start();
	}
}