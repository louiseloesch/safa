#include <dht.h>

dht DHT;

#define DHT11_PIN 3
#define BUZZER_PIN 4
#define RED_PIN 6
#define GREEN_PIN 5
#define BLUE_PIN 7

#define ALARM_RATE 500
#define ALARM_DURATION 1000

float dht[2];
boolean alarm;
long next_alarm;
int next_alarm_frequency;

long next_read;

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
  alarm = false;
  next_alarm_frequency = 1000;

  next_read = millis();
  
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(BUZZER_PIN, OUTPUT);

  digitalWrite(LED_BUILTIN, LOW);
  Serial.begin(115200);
}

void loop()
{

  // plays alarm withou blocking
  if(alarm == true && next_alarm < millis()){
    tone(BUZZER_PIN, next_alarm_frequency, ALARM_DURATION);
    next_alarm = millis() + ALARM_RATE;
    if (next_alarm_frequency > 1500){
      next_alarm_frequency = 1000;
    }else{
      next_alarm_frequency = 2000;
    }
  }

  if (Serial.available() > 0){
    String instruction = Serial.readStringUntil('\r\n');

    Serial.println(instruction);

    int value = (instruction.charAt(1) - '0')*100 +
                (instruction.charAt(2) - '0')*10 + 
                (instruction.charAt(3) - '0');
                
    if (instruction.charAt(0) == 'R'){
      analogWrite(RED_PIN,value);
    }else if (instruction.charAt(0) == 'G'){
      analogWrite(GREEN_PIN,value);
    }else if (instruction.charAt(0) == 'B'){
      analogWrite(BLUE_PIN,value);
    }else if (instruction.charAt(0) == 'A'){
      if (value == 0){
        alarm = false;
      }else{
        alarm = true;
      }
    }
    
  }

  if(next_read < millis()){
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

    next_read = millis() + 1000;
  }
}

