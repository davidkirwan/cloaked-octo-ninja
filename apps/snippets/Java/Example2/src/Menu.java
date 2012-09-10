import java.util.Scanner;


public class Menu {
	
	public static void main(String[] args){
		
		Scanner theScanner = new Scanner(System.in);
		Person thePerson = new Person();
		
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
			
			System.out.println("Please enter the BMI value for your pet.");
			thePet.setBmi(theScanner.nextShort());
			
			System.out.println("Please enter your pets species");
			thePet.setSpecies(theScanner.next());
			
			Pet[] petCollection = thePerson.getCollection();
			petCollection[i] = thePet;
				
			System.out.println("Would you like to add another pet? yes/no?");
			petChoice = theScanner.next();
			
			i++;
		}
		
		System.out.println(thePerson);
		
	}
	
}