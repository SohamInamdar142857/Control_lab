int initial, f=0;
double  initial1;
void setup() {
  // put your setup code here, to run once:
  // pinMode(0,INPUT) ;  	//we have to set PWM pin as output
  pinMode(2,OUTPUT) ;
  pinMode(3,OUTPUT) ;

  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if (f==0){
  initial1 = (analogRead(0));
  //Serial.print(initial1);
    
  }
    /*digitalWrite(3,0);
    digitalWrite(2,1);
    delay(300);
    digitalWrite(2,0);
    digitalWrite(3,0);
    delay(300);*/
  
  
    
    /*while ((initial1>10) and (initial1<400) and (analogRead(0))<=initial1+512){
      digitalWrite(2,1);
      Serial.print(analogRead(0));
      Serial.println();
    }
    while((initial1 <=1000 and initial1 >=640) and  (analogRead(0)>=initial1-512)  ){
      digitalWrite(3,1);
    }
    */
    
    //digitalWrite(2,0);
    
    //digitalWrite(3,0);
  //delay(2000);
  

  Serial.print(analogRead(0));
  Serial.println();
  delay(100);
}
