//Tobias Merlin 
//comision 2

PImage castillo;

void setup(){
  size(800,400);
 castillo  = loadImage("castillo.jpg");
 }
 
 void draw(){
   background(0,155,255);
   
  fill(0,170,0);
   rect(0, 300, 400, 100,0); 
   
   fill(250,170,0);
  rect(100, 210, 200, 130,0);

   rect(150,100,110,150,0);
   
   
   
   
  
   
 image(castillo,400,0);
 }
 void mousePressed(){
  println(mouseX+","+mouseY);
}


   
   
