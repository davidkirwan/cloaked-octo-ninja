import java.util.ArrayList;


/**
 * @author Coderdojo Waterford
 * 
 * @date 26/05/2012
 * 
 * @name Example 4: Populating the Pet Class
 * @description This example contains the code required to populate the Person and
 * Pet Classes. The ArrayList library is introduced.
 */
public class Menu {
	
	public static void main(String[] args){
		
		// Declare three objects of the Pet class, one two and three
		Pet one, two, three;
		
		// Initialise the Pet object called one.
		one = new Pet("Oscar", "Male", 4, false,
			1, 7, "Black", "Terrier",
			10.2, "Dog");
		
		// Initialise the Pet object called two.
		two = new Pet("Skippy", "Female", 4, false,
				1, 14, "Brown", "Terrier",
				10.2, "Dog");
		
		// Initialise the Pet object called three.
		three = new Pet("Noah", "Male", 4, false,
				1, 4, "Black", "Terrier",
				10.2, "Dog");
		
		// Create an ArrayList to hold our Pet objects called petList.
		ArrayList<Pet> petList = new ArrayList<Pet>();
		
		// Populate the petList array with our Pet objects one, two and three.
		petList.add(one);
		petList.add(two);
		petList.add(three);
		
		// Declare and initialise a Person object called thePerson. 
		Person thePerson = new Person("David", 30, 5.5, "Male", petList);
		
		// Call the toString() function of the thePerson object.
		System.out.println(thePerson);
		
	}
	
}