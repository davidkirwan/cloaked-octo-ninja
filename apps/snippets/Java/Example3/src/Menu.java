/**
 * @author Coderdojo Waterford
 * 
 * @date 26/05/2012
 * 
 * @name Example 2: Populating the Pet Class
 * @description This example contains the code required to populate the Person and
 * Pet Classes. 
 */
public class Menu {
	
	public static void main(String[] args){
		
		// Create three instances of the Pet class, one two and three
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
		
		// Create a primitive array to hold our Pet objects called petList.
		Pet[] petList = new Pet[3];
		
		// Populate the petList array with our Pet objects one, two and three.
		petList[0] = one;
		petList[1] = two;
		petList[2] = three;
		
		// Declare and initialise a Person object called thePerson. 
		Person thePerson = new Person("David", 30, 5.5, "Male", petList);
		
		// Call the toString() function of the thePerson object.
		System.out.println(thePerson);
		
		/*
		 * I've commented out all this code, as it is no longer required in our
		 * example but Ive left it here for posterity.
		 * 
		
		System.out.println("Please enter the persons name");
		thePerson.setName(theScanner.next());
		
		System.out.println("Please enter the persons age");
		thePerson.setAge(theScanner.nextInt());
		
		System.out.println("Please enter the persons height");
		thePerson.setHeight(theScanner.nextDouble());
		
		System.out.println("Please enter the persons gender");
		thePerson.setGender(theScanner.next());

		System.out.println("The number of pets currently owned by " + thePerson.getName() +
				" is: " + thePerson.getPetCount());
		
		System.out.println("Would you like to add a new pet? (yes/no)");
		String petChoice = theScanner.next();
		
		int i = 0;
		
		while(petChoice.equalsIgnoreCase("yes")){
			
			Pet thePet = new Pet();
			
			System.out.println("Please enter your pets name");
			thePet.setName(theScanner.next());
			
			System.out.println("Please enter your pets gender");
			thePet.setGender(theScanner.next());
			
			System.out.println("Please enter the number of legs your pet has");
			thePet.setLegs(theScanner.nextShort());
			
			System.out.println("Is your pet dangerous? yes/no");
			String petDangerousChoice = theScanner.next();
			
			if(petDangerousChoice.equalsIgnoreCase("yes")){
				thePet.setDangerous(true);
			}
			else{
					thePet.setDangerous(false);
			}
				
			System.out.println("Please enter the height of your pet");
			thePet.setSize(theScanner.nextDouble());
			
			System.out.println("Please enter your pets age.");
			thePet.setAge(theScanner.nextInt());
			
			System.out.println("Please enter your pets colour.");
			thePet.setColour(theScanner.next());
			
			System.out.println("Please enter your pets breed.");
			thePet.setBreed(theScanner.next());
			
			System.out.println("Please enter the weight of your pet.");
			thePet.setWeight(theScanner.nextDouble());
			
			//System.out.println("Please enter the BMI value for your pet.");
			//thePet.setBmi(theScanner.nextShort());
			thePet.setBmi();
			
			System.out.println("Please enter your pets species");
			thePet.setSpecies(theScanner.next());
			
			Pet[] petCollection = thePerson.getCollection();
			petCollection[i] = thePet;
				
			System.out.println("Would you like to add another pet? yes/no?");
			petChoice = theScanner.next();
			
			i++;
		}
		
		System.out.println(thePerson);*/
		
	}
	
}