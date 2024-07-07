//Tobias Merlin

PImage cuadrados;
boolean animar = false;
boolean efectoOptico = false; 
float desplazamientoX = 0; 

void setup() {
  size(800, 400);
  cuadrados = loadImage("cuadrados.jpg");
}

void draw() {
  background(0);

  
  image(cuadrados, 0, 0, width / 2, height);

 
  if (animar) {
    desplazamientoX = map(mouseX, 0, width, -10, 10); 
  }

  
  pushStyle();

  
  image(cuadrados, width / 2 + desplazamientoX, 0, width / 2, height);

  
  if (efectoOptico) {
    for (int x = width / 2; x < width; x++) {
      for (int y = 0; y < height; y++) {
        color c = get(x, y);
        color inverted = color(255 - red(c), 255 - green(c), 255 - blue(c));
        set(x, y, inverted);
      }
    }
  }

  
  popStyle();
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    reiniciar();
  }
}

void mousePressed() {
  
  efectoOptico = !efectoOptico;
}

void mouseMoved() {
  
  animar = true;
}

void mouseExited() {
  
  animar = false;
}


void reiniciar() {
  animar = false;
  desplazamientoX = 0; 
  efectoOptico = false; 
}
