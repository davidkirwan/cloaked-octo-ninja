import java.util.ArrayList;

/**
 * @author Coderdojo Waterford
 * @date 26/05/2012
 * 
 * @name Example 4: The Person Class
 * @description This class will be used to model a Person. 
 */
public class Person {
	
	private String name;
	private int age;
	private double height;
	private String gender;
	private ArrayList<Pet> collection;
	
	/**
	 * @param args
	 * 
	 * This is the main function which executes when you click the run button in eclipse.
	 * 
	 */
	
	public Person(String newName, int newAge, double newHeight, String newGender, ArrayList<Pet> newCollection){
		//constructors have the same name as the class and have no return type
		this.name = newName;
		this.age = newAge;
		this.height = newHeight;
		this.gender = newGender;
		this.setCollection(newCollection);
		  
	}
	
	public Person(){
		//constructors have the same name as the class and have no return type
		this.name = "";
		this.age = 0;
		this.height = 0;
		this.gender = "";
		this.setCollection(new ArrayList<Pet>());
		  
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
	
	public String toString(){
		return "Name: " + this.name +
				", Age: " + this.age +
				", Height: " + this.height + 
				", Gender: " + this.gender +
				"\n" + petList();
	}
	
	public String petList(){
		String str = "";
		
		for(int i = 0; i < this.getCollection().size(); i++){
			str +=  "\nPet Number: " + i + 
					" Pet Name: " + this.getCollection().get(i).getName() +
					" Pet Species: " + this.getCollection().get(i).getSpecies() +
					" Pet Breed: " + this.getCollection().get(i).getBreed() + 
					"\n";
		}
		
		return str;
	}

	public ArrayList<Pet> getCollection() {
		return collection;
	}

	public void setCollection(ArrayList<Pet> collection) {
		this.collection = collection;
	}
	
	

	
	

// End of the Person Class
}
