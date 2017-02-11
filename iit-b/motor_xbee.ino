#include <AFMotor.h>
#include <SoftwareSerial.h>
#include<Servo.h>
SoftwareSerial XBee(2, 3);   // Xbee Connection
AF_DCMotor motor1(4);       // Wheel 1
AF_DCMotor motor2(3);      // Wheel 2
AF_DCMotor motor3(1);     // Lifting Motor
Servo servo;           // Griping Servo

void setup() 
{
  XBee.begin(9600);    // Xbee Comunication
  Serial.begin(9600);  // Serial Communication
  motor1.setSpeed(200);  // Wheel 1 Top Speed
  motor1.run(RELEASE);
  motor2.setSpeed(200);  // Wheel 2 Top Speed  
  motor2.run(RELEASE);
  motor3.setSpeed(150);  // Lifting Motor Top Speed
  motor3.run(RELEASE);
  
}

void loop() 
{
  int val; // Port variable
  if(Serial.available())  
  {
    val=Serial.read();
    if(val=='w')          //Forward
   {
     motor1.run(FORWARD);
     motor1.setSpeed(200);
     motor2.run(FORWARD);
     motor2.setSpeed(200);
   }
   else if(val=='r')      // Centre Right
    {
     motor1.run(BACKWARD);
     motor1.setSpeed(200);
     motor2.run(FORWARD);
     motor2.setSpeed(200);
   }
   else if(val=='l')      //Centre Left
    {
     motor1.run(FORWARD);
     motor1.setSpeed(200);
     motor2.run(BACKWARD);
     motor2.setSpeed(200);
   }
   else if(val=='b')      // Backward
    {
     motor1.run(BACKWARD);
     motor1.setSpeed(200);
     motor2.run(BACKWARD);
     motor2.setSpeed(200);
   }
   else if(val=='u')    // Block Lift
   {
     motor3.run(FORWARD);
     motor3.setSpeed(150);
     delay(900);  //Have to put some delay
     motor3.run(RELEASE);
   }
    else if(val=='d')    // Block Deposite
   {
     motor3.run(BACKWARD);
     motor3.setSpeed(150);
     delay(1500);//Have to put some delay
     motor3.run(RELEASE);
   }
   else if(val=='g')   // Gripping and Liftiing
   {
     servo.attach(9);
     servo.write(90);
     motor3.run(FORWARD);
     motor3.setSpeed(150);
     delay(100);
     motor3.run(RELEASE);
     
   }
   else if(val=='m')        // Leaving 
   {
     motor3.run(BACKWARD);
     motor3.setSpeed(150);
     delay(100);
     motor3.run(RELEASE);         
     servo.attach(9);
     servo.write(180);
   }
   else               // Stop
   {
     motor1.run(RELEASE);
     motor2.run(RELEASE);
   }
  }
}
