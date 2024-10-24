int initial, input, f=0;
int pwm1=2;
int pwm2=3;
//Declare PID constants
double kp=1;  //Proportional
double ki=2;  //Integral
double kd=3;  //Derivative

//currtime is t+dt, prevtime is t
unsigned long currtime, prevtime; 
//Total time elapsed
double deltime;

//e(t)=x(t)-y(t)
double error;
double preverror;

double inp,outp,target;

double interror; //Integral of e(t)
double differror; //Derivative of e(t)
void setup() {
  // put your setup code here, to run once:
  // pinMode(0,INPUT) ;  	//we have to set PWM pin as output
 
  // Serial.begin(9600);

  initial=analogRead(0); //Initial angle
  target=initial+511; //180 degrees
  
}

void loop() {
  inp=analogRead(0);
  outp=PID(inp);
  delay(100);
  
  
  // put your main code here, to run repeatedly:
  
 
  
  // Serial.print(p);
  // Serial.println();
}

double PID(double inp){
  currtime=millis();
  deltime=(double)(currtime-prevtime);

  error=target-inp;

  interror+=error*deltime;

  differror=(error-preverror)/(deltime);

  double out=kp*error+ki*interror+kd*differror;

  preverror=error;
  prevtime=currtime;
  return out;
}
