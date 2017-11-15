#include <dht.h>

dht DHT;

#define DHT11_PIN 3

float dht[2];

void dht11(){
  int chk = DHT.read11(DHT11_PIN);
  switch (chk)
  {
    case DHTLIB_OK:   
      break;
    case DHTLIB_ERROR_CHECKSUM: 
      digitalWrite(LED_BUILTIN, HIGH);
      break;
    case DHTLIB_ERROR_TIMEOUT:
      digitalWrite(LED_BUILTIN, HIGH); 
      break;
    default:
      digitalWrite(LED_BUILTIN, HIGH); 
      break;
  }
  
  dht[0] = DHT.humidity;
  dht[1] = DHT.temperature;
}

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  Serial.begin(115200);
}

void loop()
{

  if (Serial.available() > 0){
    String instruction = Serial.readString();

    if (instruction.charAt(0) == 'R'){
      analogWrite(5,255);
    }else if (instruction.charAt(0) == 'G'){
      analogWrite(6,255);
    }else if (instruction.charAt(0) == 'B'){
      analogWrite(7,255);
    }else if (instruction.charAt(0) == 'A'){
      analogWrite(4,255);
    }
    
  }

  int flameSensor = analogRead(A0);
  int gasSensor = analogRead(A1);

  dht11();

  Serial.print("F");
  Serial.print(flameSensor);
  Serial.print("G"); 
  Serial.print(gasSensor);
  Serial.print("H");
  Serial.print(dht[0]);
  Serial.print("T");
  Serial.println(dht[1]);

  
  delay(1000);
}
