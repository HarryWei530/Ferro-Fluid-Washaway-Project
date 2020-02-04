int firstrun;
int shutter = 13;
int pump_start = 12;
int focus = 11;
int main_start = 7;
int lights = 5;
double shutter_speed = 0.0025;
int pump_on_time = 5000;


void setup() {
   pinMode(shutter,OUTPUT);
   pinMode(pump_start,OUTPUT);
   pinMode(focus,OUTPUT);
   pinMode(lights,OUTPUT);
   pinMode(main_start,INPUT);

   digitalWrite(shutter,LOW);
   digitalWrite(focus,LOW);
   digitalWrite(pump_start,LOW);
   digitalWrite(lights,HIGH);
   delay(1000);
   digitalWrite(lights,LOW);
   firstrun = 0;
   Serial.begin(9600);
}


void release_shutter(int camera_focus, int camera_shutter,long burst_number){

  digitalWrite(camera_focus,HIGH);
  delay(50);
  for(int i = 0;i<burst_number;i++){
      digitalWrite(camera_shutter,HIGH);
      delay(1000);
      digitalWrite(camera_shutter,LOW);
      delay(10);
  }
  digitalWrite(camera_focus,LOW);
  delay(10);
}


void loop() {
  
  while(digitalRead(7) == HIGH){
    // Flush Pump for time one ms,then wait for time two ms
    digitalWrite(pump_start,HIGH);
    delay(pump_on_time);
    digitalWrite(pump_start,LOW);
    digitalWrite(lights,HIGH);
    delay(1000);
    release_shutter(focus,shutter,3);
    delay(100);
    digitalWrite(lights,LOW);
  }
}
