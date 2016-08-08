import processing.serial.*; //import the Serial library

Serial myPort;  // the Serial port object
Table csv = new Table();  // Will store the newRow data

String val;
int numReadings = 5; //keeps track of how many readings you'd like to take before writing the file. 
int readingCounter = 0; //counts each reading to compare to numReadings. 
String fileName; // The name of the CSV file


void setup() {
  //  initialize your serial port and set the baud rate to 9600
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n'); // don't generate a serialEvent() unless you get a newline character:
  
  csv.addColumn("id"); //This column stores a unique identifier for each record.
  csv.addColumn("year");
  csv.addColumn("month");
  csv.addColumn("day");
  csv.addColumn("hour");
  csv.addColumn("minute");
  csv.addColumn("second");
  csv.addColumn("sensor1"); // Our sensor values
  
  fileName = "thermistor.csv";
}


// Responds to the Serial events
void serialEvent(Serial myPort){
  val = myPort.readStringUntil('\n'); //The newline separator separates each Arduino loop. We will parse the data by each newline separator. 
  if (val!= null) { //We have a reading! Record it.
    val = trim(val); //gets rid of any whitespace or Unicode nonbreakable space
    println(val); //Optional, useful for debugging. If you see this, you know data is being sent. Delete if  you like. 
    float sensorVal = float(val); //parses the packet from Arduino and places the valeus into the sensorVal float. 
   
    TableRow newRow = csv.addRow(); //add a row for this new reading
    newRow.setInt("id", csv.lastRowIndex());//record a unique identifier (the row's index) 
    
    //record time stamp
    newRow.setInt("year", year());
    newRow.setInt("month", month());
    newRow.setInt("day", day());
    newRow.setInt("hour", hour());
    newRow.setInt("minute", minute());
    newRow.setInt("second", second());
    
    //record sensor information. Customize the names so they match your sensor column names. 
    newRow.setFloat("sensor1", sensorVal);
    
    readingCounter++; //optional, use if you'd like to write your file every numReadings reading cycles
    
    //saves the table as a csv in the same folder as the sketch every numReadings. 
    if (readingCounter % numReadings ==0)//The % is a modulus, a math operator that signifies remainder after division. The if statement checks if readingCounter is a multiple of numReadings (the remainder of readingCounter/numReadings is 0)
    {
      saveTable(csv, fileName); //Woo! save it to your computer. It is ready for all your spreadsheet dreams. 
    }
   }
}


void draw() {
  //we can leave the draw method empty, 
  //because all our programming happens in the serialEvent (see below)
}