/**
 * PIR Activated Relay Control Circuit Sketch
 * 
 * Circuit: https://imgur.com/a/ci3Mq
 * Github: https://github.com/davidkirwan/
 * Version: 0.1.0
 */

#define PIN_IN  3
#define PIN_OUT 0

void long_delay(int wait){
  int w = 0;
  while(w < wait){
    delay(1000); 
    w++;
  }
}

void activate() {
  //Serial.println("activate");
  digitalWrite(PIN_OUT, LOW);
  long_delay(600); // 10 mins
  digitalWrite(PIN_OUT, HIGH);  
}

void setup(){
  //Serial.begin(9600);
  pinMode(PIN_IN,  INPUT );
  pinMode(PIN_OUT, OUTPUT);
  digitalWrite(PIN_OUT, HIGH);  
  delay(2000);
}

void loop(){
  int val = digitalRead(PIN_IN);
  //Serial.println(val);
  
  if(val == 0){
    delay(5000);
    val = digitalRead(PIN_IN);
    //Serial.println("first");
    
    if(val == 0){
      //Serial.println("second");
      activate();
    }
  }
  else {
  }
  delay(100);
}
