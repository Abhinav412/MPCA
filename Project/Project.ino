#include <SoftwareSerial.h>
#define rxPIN 4
#define txPIN 5
SoftwareSerial mySerial = SoftwareSerial(rxPIN, txPIN);

int pirsensor = 10;
int buzzer = 12;
int redled = 13;

void setup() {
  randomSeed(analogRead(0));
  pinMode(rxPIN,INPUT);
  pinMode(txPIN,OUTPUT);
  //Serial.begin(9600);
  mySerial.begin(9600); // original 19200. while enter 9600 for sim900A
  Serial.println(" logging time completed!");
  pinMode(pirsensor, INPUT);
  pinMode(buzzer, OUTPUT);
  pinMode(redled, OUTPUT);
digitalWrite(buzzer, LOW);
digitalWrite(redled, LOW);
  

  delay(100);

}

void loop() {


  if ( digitalRead(pirsensor) == HIGH) 
  { digitalWrite(buzzer, HIGH);
    digitalWrite(redled, HIGH);
   Serial.println("making call");
   
    mySerial.println("AT"); //Once the handshake test is successful, i t will back to OK
  updateSerial();
  
  mySerial.println("ATD+919886012299;"); //  change ZZ with country code and xxxxxxxxxxx with phone number to dial
  updateSerial();
  delay(20000); // wait for 20 seconds...
  mySerial.println("ATH"); //hang up
  updateSerial();

   delay(2000);
  }
  if ( digitalRead(pirsensor) == LOW) 
  {
    digitalWrite(buzzer, LOW);
    digitalWrite(redled, LOW);
   ;
    delay(1000);
  }

}




void updateSerial()
{
  delay(500);
  while (Serial.available()) 
  {
    mySerial.write(Serial.read());//Forward what Serial received to Software Serial Port
  }
  while(mySerial.available()) 
  {
    Serial.write(mySerial.read());//Forward what Software Serial received to Serial Port
  }
}
