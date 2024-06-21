//Tobias Merlin        comision 2
//https://www.youtube.com/watch?v=dF6KS1z9KU0

int mod;
int tam;
PImage cuadrados;
boolean animar = false; 

void setup() {
  size(800, 400);
  cuadrados = loadImage("cuadrados.jpg"); 
  mod = 50;
  tam = 1;
}

void draw() {
  background(0);

  
  for (int i = -height; i < height; i += mod) { 
    for (int j = -height; j < height; j += mod) {
     
      float x = width / 2 + j;
      float y = i;

     
      int col;
      if ((i / mod + j / mod) % 2 == 0) {
        col = color(255); 
      } else {
        col = color(0); 
      }

      if (animar) {
        
        float distan = dist(mouseX, mouseY, x, y);
        float tono = distan * 255 / dist(width, height, 0, 0);

        if ((i / mod + j / mod) % 2 == 0) {
          col = color(tono); 
        } else {
          col = color(255 - tono); 
        }
      }

      fill(col);
      noStroke();
      
      pushMatrix();
      translate(x + mod / 2, y + mod / 2);
      rotate(radians(45));
      rect(-mod / 2, -mod / 2, mod, mod);
      popMatrix();
    }
  }

  
  image(cuadrados, 0, 0, 400, 400);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    animar = !animar; 
  }
}
