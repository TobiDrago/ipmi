//Tobias Merlin

PImage undertale, pacifistagenocida, TobyFox;
int duracionImagen = 600;
int imagenActual = 1;
int inicioImagen;
int textoPosicionInicial = 640; 
boolean estoySobreBoton = false; 
float r = 30; 

void setup() {
  size(640, 480);
  undertale = loadImage("undertale.jpg");
  pacifistagenocida = loadImage("pacifistagenocida.jpg");
  TobyFox = loadImage("TobyFox.jpg");
  inicioImagen = frameCount;
}

void draw() {
  background(255);
  
  if (imagenActual == 1) {
    dibujarImagen1();
  } else if (imagenActual == 2) {
    dibujarImagen2();
  } else if (imagenActual == 3) {
    dibujarImagen3();
  }
  
  if (frameCount - inicioImagen > duracionImagen && imagenActual < 3) {
    imagenActual++;
    inicioImagen = frameCount;
    textoPosicionInicial = 640; 
  } else if (imagenActual == 3 && frameCount - inicioImagen > duracionImagen) {
    dibujarBoton();
  }
}

void dibujarImagen1() {
  image(undertale, 0, 0, 640, 360);
  fill(0);
  textSize(14);
  textAlign(CENTER, CENTER); 
  int posicionX = textoPosicionInicial - (frameCount - inicioImagen) * 2; 
  if (posicionX < width / 2) posicionX = width / 2; 
  text("es un videojuego de rol indie creado por Toby Fox.\n La historia sigue a un niño humano que cae en un mundo subterráneo habitado por monstruos. \n El jugador puede elegir entre ser pacífico o combativo, lo que afecta la trama y las relaciones con los personajes.\nEl juego enfatiza la importancia de la amistad y la compasión,\n y presenta múltiples finales basados en las decisiones del jugador. \n tiene un enfoque único en la moralidad y las elecciones del jugador\n.", posicionX, height - 50);
}

void dibujarImagen2() {
  image(pacifistagenocida, 0, 0, 640, 360);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER); 
  int posicionX = textoPosicionInicial - (frameCount - inicioImagen) * 2; 
  if (posicionX < width / 2) posicionX = width / 2; 
  text("La ruta pacifista implica no matar a ningún enemigo, \nestableciendo la paz y amistad con todos los personajes. \nPor otro lado, la ruta genocida requiere eliminar a todos los enemigos \nen cada área, cambiando drásticamente la narrativa y \nel comportamiento de los personajes.", posicionX, height - 70);
}

void dibujarImagen3() {
  image(TobyFox, 0, 0, 640, 360);
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER); 
  int posicionX = textoPosicionInicial - (frameCount - inicioImagen) * 2; 
  if (posicionX < width / 2) posicionX = width / 2; 
  text("Toby Fox es el creador de Undertale. \nEs un desarrollador independiente que trabajó casi en solitario en el juego, \ncreando tanto el diseño como la banda sonora, \ndestacándose por su enfoque innovador y narrativa emocional.", posicionX, height - 80);
}

void dibujarBoton() {
  if (dist(mouseX, mouseY, width / 2, height / 2) < r) {
    fill(200, 0, 0); 
    estoySobreBoton = true;
  } else {
    fill(200); 
    estoySobreBoton = false;
  }
  noStroke();
  circle(width / 2, height / 2, r * 2);
}

void mousePressed() {
  if (estoySobreBoton) {
    println("Botón presionado");
    imagenActual = 1; 
    inicioImagen = frameCount; 
    textoPosicionInicial = 640; 
  }
}
