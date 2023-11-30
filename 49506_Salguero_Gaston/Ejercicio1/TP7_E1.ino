const int LED1 = 9;
const int LED2 = 10;
const int pulsador1 = 11;
const int pulsador2 = 12;
const int pulsador3 = 13;

int brillo = 0;
int LED = LED1;
bool estado = false;

void setup() {
  pinMode(pulsador1, INPUT);
  pinMode(pulsador2, INPUT);
  pinMode(pulsador3, INPUT);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  if (digitalRead(pulsador1) == HIGH && brillo <= 255) {
    analogWrite(LED, brillo);
    Serial.println(brillo);
    brillo += 1;
    delay(10);
  }
  if (digitalRead(pulsador2) == HIGH && brillo > 0) {
    brillo -= 1;
    analogWrite(LED, brillo);
    Serial.println(brillo);
    delay(10);
  }
  if (digitalRead(pulsador3) == true) {
    if (estado == false) {
      LED = LED2;
      estado = true;
      delay(200);
    }
    else{
      LED = LED1;
      estado = false;
      delay(200);
    }
  }
}