//Tobias Merlin Comision 2

PImage undertale, pacifista, genocida, saladeljuicio, TobyFox;
int currentSlide = 1;
int slideDuration = 600; 
int slideStartFrame;
float textPosition;
boolean textCentered = false;
CircleButton resetButton;
boolean showResetButton = false;

void setup() {
  size(640, 480);
  // Carga las imágenes
  undertale = loadImage("undertale.jpg");
  pacifista = loadImage("pacifista.jpg");
  genocida = loadImage("genocida.jpg");
  saladeljuicio = loadImage("saladeljuicio.jpg");
  TobyFox = loadImage("TobyFox.jpg");
  slideStartFrame = frameCount;
  textPosition = width; 
  
 
  resetButton = new CircleButton(width / 2, height / 2, 50, "Reiniciar");
}

void draw() {
  background(255);
  
  if (currentSlide == 1) {
    drawSlide1();
  } else if (currentSlide == 2) {
    drawSlide2();
  } else if (currentSlide == 3) {
    drawSlide3();
  } else if (currentSlide == 4) {
    drawSlide4();
  } else if (currentSlide == 5) {
    drawSlide5();
  }

  
  if (frameCount - slideStartFrame > slideDuration && currentSlide < 5) {
    currentSlide++;
    slideStartFrame = frameCount;
    textPosition = width; 
    textCentered = false;
  }

  
  if (!textCentered) {
    textPosition -= 2; 
    if (textPosition <= (width - textWidth(getCurrentText())) / 2) {
      textCentered = true;
      textPosition = (width - textWidth(getCurrentText())) / 2; 
    }
  }

  
 if (currentSlide == 5) {
    showResetButton = true;
    resetButton.display();;
  }
}

void mousePressed() {
  
  if (showResetButton && resetButton.isClicked()) {
    currentSlide = 1;
    slideStartFrame = frameCount;
    textPosition = width; 
    textCentered = false;
    showResetButton = false; 
  }
}

void drawSlide1() {
  image(undertale, 0, 0, 640, 360); 
  textSize(16);
  fill(0);
  textAlign(LEFT, TOP);
  text("\"Undertale\" es un videojuego de rol indie creado por Toby Fox. \nLa historia sigue a un niño humano que cae en un mundo subterráneo \nhabitado por monstruos.", textPosition, 370);
}

void drawSlide2() {
  image(pacifista, 0, 0, 640, 360); 
  textSize(14);
  fill(0);
  textAlign(LEFT, TOP);
  text("En la ruta pacifista de \"Undertale\", el jugador opta por resolver conflictos de manera no violenta y \nevitar causar daño a los monstruos. \nEsto implica usar opciones de diálogo y actuar de manera amistosa para resolver encuentros \nen lugar de recurrir al combate. \nEl jugador puede hacer amigos, \ndescubrir historias personales y desbloquear finales alternativos basados en sus elecciones.", textPosition, 370);
}

void drawSlide3() {
  image(genocida, 0, 0, 640, 360); 
  textSize(16);
  fill(0);
  textAlign(LEFT, TOP);
  text("En la ruta genocida de \"Undertale\", el jugador adopta un enfoque agresivo y combate a \ntodos los enemigos en su camino, \nen lugar de buscar una solución pacífica. \nEsto implica derrotar a todos los monstruos en cada área hasta que no quede ninguno.", textPosition, 370);
}

void drawSlide4() {
  image(saladeljuicio, 0, 0, 640, 360); 
  textSize(16);
  fill(0);
  textAlign(LEFT, TOP);
  text("En la sala del juicio dependiendo de las acciones del jugador a lo largo del juego, \nse desencadenarán diferentes finales en la Sala del Juicio. \nEstos finales pueden variar desde un final feliz en la ruta pacifista \nhasta finales más sombríos en la ruta genocida, \ndonde se exploran las consecuencias de la violencia y la falta de empatía", textPosition, 370);
}

void drawSlide5() {
  image(TobyFox, 0, 0, 640, 360); 
  textSize(16);
  fill(0);
  textAlign(LEFT, TOP);
  text("Toby Fox es un desarrollador de videojuegos, compositor y diseñador de sonido estadounidense. \nNació el 11 de octubre de 1991 en Massachusetts. \nEs conocido principalmente por ser el creador del juego indie Undertale, lanzado en 2015. \nFox trabajó en Undertale \ncomo diseñador, programador, escritor, artista y compositor de la banda sonora, \nlogrando un gran éxito y reconocimiento por su trabajo en este título.", textPosition, 370);
}

String getCurrentText() {
  if (currentSlide == 1) {
    return "\"Undertale\" es un videojuego de rol indie creado por Toby Fox. \nLa historia sigue a un niño humano que cae en un mundo subterráneo \nhabitado por monstruos.";
  } else if (currentSlide == 2) {
   return "En la ruta pacifista de Undertale, el jugador opta por resolver conflictos de manera no violenta y \nevitar causar daño a los monstruos. \nEsto implica usar opciones de diálogo y actuar de manera amistosa para resolver encuentros \nen lugar de recurrir al combate. \nEl jugador puede hacer amigos, \ndescubrir historias personales y desbloquear finales alternativos basados en sus elecciones.";
} else if (currentSlide == 3) {
return "En la ruta genocida de Undertale, el jugador adopta un enfoque agresivo y combate a \ntodos los enemigos en su camino, \nen lugar de buscar una solución pacífica. \nEsto implica derrotar a todos los monstruos en cada área hasta que no quede ninguno.";
} else if (currentSlide == 4) {
return "En la sala del juicio dependiendo de las acciones del jugador a lo largo del juego, \nse desencadenarán diferentes finales en la Sala del Juicio. \nEstos finales pueden variar desde un final feliz en la ruta pacifista \nhasta finales más sombríos en la ruta genocida, \ndonde se exploran las consecuencias de la violencia y la falta de empatía.";
} else if (currentSlide == 5) {
return "Toby Fox es un desarrollador de videojuegos, compositor y diseñador de sonido estadounidense. \nNació el 11 de octubre de 1991 en Massachusetts. \nEs conocido principalmente por ser el creador del juego indie Undertale, lanzado en 2015. \nFox trabajó en Undertale \ncomo diseñador, programador, escritor, artista y compositor de la banda sonora, \nlogrando un gran éxito y reconocimiento por su trabajo en este título.";
} else {
return "";
}
}


class CircleButton {
  float x, y, r;
  String label;

CircleButton(float x, float y, float r, String label) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.label = label;
  }

void display() {
    fill(200);
    ellipse(x, y, r * 2, r * 2); // Dibuja el círculo
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }

boolean isClicked() {
    float d = dist(mouseX, mouseY, x, y);
    return d < r;
  }
}
