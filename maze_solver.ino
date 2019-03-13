 int trigpin1 =;
 int trigpin2 =;
 int trigpin3 =;
 int echopin1 =;
 int echopin2 =;
 int echopin3 =;
 int lp =;
 int ln =;
 int rp =;
 int rn =;
 int duration = 0;
 int distance = 0;

void setup() {
  // put your setup code here, to run once:
 pinMode( trigpin1, OUTPUT );
 pinMode( trigpin2, OUTPUT );
 pinMode( trigpin3, OUTPUT );
 pinMode( echopin1, INPUT );
 pinMode( echopin2, INPUT );
 pinMode( echopin3, INPUT );
 pinMode( lp, OUTPUT );            //lp=left side positive terminal 
 pinMode( ln, OUTPUT );            //ln=left side negative terminal
 pinMode( rp, OUTPUT );            //rp=right side positive terminal
 pinMode( rn OUTPUT);              //rn=right side negative terminal
 Serial.begin(9600);
}




void loop() {
  
  analogWrite(trigpin1,HIGH)
  delay();
  analogWrite(trigpin1,LOW);
  timea=pulseIn(echopin1,HIGH);
  dista=(timea/2)/28.5;
  Serial.println(dista);

  analogWrite(trigpin2,HIGH)
  delay();
  analogWrite(trigpin2,LOW);
  timeb=pulseIn(echopin2,HIGH);
  distb=(timeb/2)/28.5;
  Serial.println(distb);

  analogWrite(trigpin3,HIGH)
  delay();
  analogWrite(trigpin3,LOW);
  timec=pulseIn(echopin3,HIGH);
  distc=(timec/2)/28.5;
  Serial.println(distc);


  if (dista>distb && dista>distc )  //enter conditions for straight driving
    {digitalWrite(lp,HIGH);
      digitalWrite(ln,LOW);
     digitalWrite(rp,HIGH);
     digitalWrite(rn,LOW);
     delay();
     
    }
  else  
   { if(distb>dista && distb>distc)   //condition for extreme left
    {digitalWrite(lp,LOW);
      digitalWrite(ln,HIGH);
     digitalWrite(rp,HIGH);
     digitalWrite(rn,LOW);
     delay();
     digitalWrite(lp,HIGH);
      digitalWrite(ln,LOW);
     digitalWrite(rp,HIGH);
     digitalWrite(rn,LOW);
     delay();
     }

     else 
    { if(distc>dista && distc>distb)    //condition for extreme right
         {digitalWrite(lp,HIGH);
           digitalWrite(ln,LOW);
           digitalWrite(rp,LOW);
           digitalWrite(rn,HIGH);} 
           delay();
           digitalWrite(lp,HIGH);
           digitalWrite(ln,LOW);
           digitalWrite(rp,HIGH);
           digitalWrite(rn,LOW);
           delay();
           }
   }

       
  
   
  
  
  
  
  
   
