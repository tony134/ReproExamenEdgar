import controlP5.*;
import ddf.minim.*;
Minim cadena;
ControlP5 play, stop, pause,volu;
AudioPlayer cancion;
float valor=0;
PImage bg;
int y;
//int slide = 100;
void setup() {

  size(750, 200);
 noStroke();
  play = new ControlP5(this);
  play.addButton("play")
    .setValue(0)
    .setPosition(50, 50)
    .setSize(50, 50);
  stop = new ControlP5(this);
  stop.addButton("stop")
    .setValue(0)
    .setPosition(150, 50)
    .setSize(50, 50);
    
  stop.addButton("choose")
    .setValue(0)
    .setPosition(350, 50)
    .setSize(50, 50);
    
    pause = new ControlP5(this);
  pause.addButton("pause")
    .setValue(0)
    .setPosition(250, 50)
    .setSize(50, 50);
    volu = new ControlP5(this);
    volu.addSlider("vol")
     .setPosition(80,120)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(128)
     ;
     
  cadena = new Minim(this);
  cancion = cadena.loadFile("austin mahome - what about love.mp3",1024);
  bg = loadImage("scratched_black_wall.jpg");
}
public void choose(){
selectInput("Selecciona cancion: ", "fileSelected");

}

void draw() {
  background(bg);
stroke(226, 204, 0);
  line(0, y, width, y);
  
  y++;
  if (y > height) {
    y = 0; 
  }

}


public void play() {
  cancion.play();
  println("play");
}

public void stop() {
  cancion.pause();
  cancion.rewind();
    println("stop");
  
}

public void pause() {
  cancion.pause();
    println("pause");
  
}
public void setVolume(float valor){
  
  valor = valor/100;
  
     
}
void fileSelected(File selection){
 if (selection == null){
 println("no se escogio cancion");
 } else{
  String filename = selection.getAbsolutePath();
  cancion = cadena.loadFile(filename);
 }
}
/*
void slider() {
  //vol = float(volu.getValue()); 
 vol = volu.getController("volumen").getValue();
 println(vol);
}

*/
void controlEvent (ControlEvent evento) // se activa el evento
{
String nombre = evento.getController().getName(); // recoje el nombre del slider y lo convierte en String
valor = int(evento.getController().getValue()); // recoje el valor del slider y lo convierte en entero
//serial.write(nombre + ":" + valor + "johan"); // envia por el puerto serial el nombre y el valor
valor = valor/100;
println(nombre + ":" + valor); // imprime por pantalla el nombre y el valor

cancion.setVolume(valor);

}