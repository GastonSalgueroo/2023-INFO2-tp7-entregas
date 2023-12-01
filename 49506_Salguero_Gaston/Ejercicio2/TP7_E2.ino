const int LED1 = 10;
const int LED2 = 11;
const int pulsador1 = 12;
const int pulsador2 = 13;

boolean estadoLED1 = false;
boolean estadoLED2 = false;

char infoSerial;

void setup() {
  pinMode(pulsador1, INPUT);
  pinMode(pulsador2, INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  //verificacion de los datos de puerto serial
  if (Serial.available() == true) {
    infoSerial = Serial.read();
  }
 	//infoSerial será 1 o 2 dependiendo si el led1 o led2 "fueron encendidos" por processing
  if (digitalRead(pulsador1) == HIGH || infoSerial == '1' ) {
    estadoLED1 = !estadoLED1;
  }
  if (estadoLED1 == true) {
    analogWrite(LED1, 255);
  }
  else {
    analogWrite(LED1, 0);
  }

  if (digitalRead(pulsador2) == HIGH || infoSerial == '2') {
    estadoLED2 = !estadoLED2;
  }
  if (estadoLED2 == true) {
    analogWrite(LED2, 255);
  }
  else {
    analogWrite(LED2, 0);
  }
  delay(100);
}