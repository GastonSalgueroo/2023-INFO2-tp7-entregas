import processing.serial.*;
Serial Puerto;

//para entradas y salidas
int grosorLinea = 2;
int ancho = 185;
int altura = 60;
int texto = 35; //para una altura comun

//para E1, E2, L1, L2
int anchoBoton = 100;
int anchoLed = 90;
boolean E1, E2, L1, L2;

void setup(){
  Puerto = new Serial(this, "COM3", 9600);
  size(850, 450);
  background(#FFFFFF);
  strokeWeight(grosorLinea);
  
  E1 = false;
  E2 = false;
  L1 = false;
  L2 = false;

  fill(#537A93); //Entradas
  rect(width/8.5, height/5, ancho, altura);
  fill(#000000);
  textSize(texto);
  text("Entradas", width/8.5+25, height/5+40);
  
  fill(#DED3AF); //Salidas
  rect(width/8.5, height/1.8, ancho, altura);
  fill(#000000);
  textSize(texto);
  text("Salidas", width/8.5+35, height/1.8+40);
  
  
  fill(#4ECE19); //E1
  rect(width/2, height/5, anchoBoton, altura); 
  
  fill(#19279B); //E2
  rect(width/1.4, height/5, anchoBoton, altura);
  
  fill(#000000);
  textSize(texto);
  text("E1", width/2+32, height/5+40);
  text("E2", width/1.4+30, height/5+40);
  
}
void draw(){
  //para E1
  if (mousePressed && mouseX<(width/2+anchoBoton) && mouseX>width/2 && mouseY<(height/5+altura) && mouseY>height/5){
   E1=!E1;
   L1=!L1;
   Puerto.write('1');
   if(E1 == false){
     fill(#4ECE19); //E1
     rect(width/2, height/5, anchoBoton, altura);  
   }  
  }
  //para E2
  if (mousePressed && mouseX<(width/1.4+anchoBoton) && mouseX>width/1.4 && mouseY<(height/5+anchoBoton) && mouseY>height/5){
    E2=!E2;
    L2=!L2;
    Puerto.write('2');
    if (E2 == false){
      fill(#19279B); //E2
      rect(width/1.4, height/5, anchoBoton, altura);
    }
  }
  fill(#000000);
  textSize(texto);
  text("E1", width/2+32, height/5+40);
  text("E2", width/1.4+30, height/5+40);
  
  if (L1 == true) {
    fill(#4ECE19);
  }
  else {
    fill(#FFFFFF);
  }
  circle(width/2+anchoLed/2, height/1.8+anchoLed/2, anchoLed);
  fill(#000000);
  textSize(texto);
  text("L1", width/2+25, height/1.8+55);
  
  if(L2 == true){
    fill(#19279B);
  }
  else{
    fill(#FFFFFF);
  }
  circle(width/1.4+anchoLed/2, height/1.8+anchoLed/2, anchoLed);
  fill(#000000);
  textSize(texto);
  text("L2", width/1.4+25, height/1.8+55);
  
  delay(50);
}
