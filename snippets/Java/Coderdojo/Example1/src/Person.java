import java.util.Scanner;

/**
 * @author Coderdojo Waterford
 * @date 11/05/2012
 * 
 * @name Example 1: The Java Class
 * @description This example will introduce the Java Class 
 */
public class Person {
	
	// We call these class fields, or class variables
	public String name;
	public int age;
	private double height;
	public String gender;
	
	/**
	 * @param args
	 * 
	 * This is the main function which executes when you click the run button in eclipse.
	 * 
	 */
	public static void main(String[] args) {
		// Create an instance of our class Person called theInstance
		Person thePerson = new Person();
		
		// Create an instance of the class Scanner called scan
		Scanner scan = new Scanner(System.in);
		
		// Read in the persons Name
		System.out.println("What is your name?");
		thePerson.setName(scan.next());
		
		System.out.println("What age are you?");
		thePerson.setAge(scan.nextInt());
		
		// Read in the persons Gender
		System.out.println("Are you M or F?");
		thePerson.setGender(scan.next());
		
		// Read in the persons Height
		System.out.println("How tall are you?");
		thePerson.setHeight(scan.nextDouble());
		
		// Print out the persons data
		System.out.println("Hello " + thePerson.getName() + 
				" you are " + thePerson.getGender() +
				" you are " + thePerson.getAge() +
				" and are " + thePerson.getHeight() + " tall.");
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double newHeight) {
		this.height = newHeight;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		if(gender.toLowerCase().startsWith("m") || gender.toLowerCase().startsWith("f")) {
			this.gender = gender;
			
		}
		else{		
			System.out.println("That's not any gender type I've ever seen before...");
			this.gender = "gender-unknown";
		}
	}

// End of the MyFirstClass Class
}
