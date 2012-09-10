/**
 * @author Coderdojo Waterford
 * 
 * @date 26/05/2012
 * 
 * @name Example 2: The Pet Class
 * @description This Class will be used to model a real world pet. 
 */
public class Pet {
	// The Pet Class fields
	private String name;
	private String gender;
	private int legs;
	private boolean dangerous;
	private static double size;
	private static int age;
	private String colour;
	private String breed;
	private static double weight;
	private int bmi;
	private String species;
	
	
	
	/**
	 * The Pet Constructor
	 */
	public Pet(String newName, String newGender, int newLegs, boolean newDangerous,
			double newSize, int newAge, String newColour, String newBreed,
			double newWeight, String newSpecies){
		this.name = newName;
		this.gender = newGender;
		this.legs = newLegs;
		this.dangerous = newDangerous;
		this.size = newSize;
		this.age = newAge;
		this.colour = newColour;
		this.breed = newBreed;
		this.weight = newWeight;
		this.species = newSpecies;
		
		this.bmi = calculateBmi();
	}
	
	/**
	 * The Pet Constructor
	 */
	public Pet(){
		this.name = "";
		this.gender = "";
		this.legs = 0;
		this.dangerous = false;
		this.size = 0.0;
		this.age = 0;
		this.colour = "";
		this.breed = "";
		this.weight = 0.0;
		this.bmi = 0;
		this.species = "";
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getLegs() {
		return legs;
	}


	public void setLegs(int legs) {
		this.legs = legs;
	}


	public boolean isDangerous() {
		return dangerous;
	}


	public void setDangerous(boolean dangerous) {
		this.dangerous = dangerous;
	}


	public double getSize() {
		return size;
	}


	public void setSize(double size) {
		this.size = size;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getColour() {
		return colour;
	}


	public void setColour(String colour) {
		this.colour = colour;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public double getWeight() {
		return weight;
	}


	public void setWeight(double weight) {
		this.weight = weight;
	}


	public int getBmi() {
		return bmi;
	}


	public void setBmi() {
		this.bmi = calculateBmi();
	}


	public String getSpecies() {
		return species;
	}


	public void setSpecies(String species) {
		this.species = species;
	}
	
	public static int calculateBmi() {
		int theBmi = 0;
		theBmi = (int) ((weight/size) * age);
		return theBmi;
	}
	
	
	
	
	
	

}
