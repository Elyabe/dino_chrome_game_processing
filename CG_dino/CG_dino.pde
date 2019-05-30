/* 
CENTRO UNIVERSTÁRIO NORTE DO ESPÍRITO SANTO - CEUNES/ UFES
TAREFA DE COMPUTAÇÂO GRÁFICA 2019/1
AUTOR: ELYABE ALVES SANTOS
CURSO: CIÊNCIA DA COMPUTAÇÃO
MATRÍCULA: 2014203834

OBJETIVO: Modelo do dino trabalho final
CRIADO EM: 28/05/2019
PROFESSOR: Jacques Facon
*/

PImage tex;
float rotx = 0;
float roty = PI/4, delta_x, PASSO_FRENTE = 8 , PASSO_TRAS = 16;
float angulo = 0, angulo_lua = 0;
float dirY, dirX, i = 0; 
void setup() {
  size(800, 800, P3D);
  fill(255);
  stroke(1);
  dirY = (mouseY / float(height) - 0.5) * 2;
  dirX = (mouseX / float(width) - 0.5) * 2;
  delta_x = 0;
  //roty = 0;
}

void draw() {
  background(255);
  noStroke();
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2.0, height/2.0, -100);
  //angulo = (angulo + 0.35 ) % 360;
  if ( keyPressed )
  {
    if ( key == 'u' )
      translate(0,-150);
    else if ( key == 'l' )
    {
      delta_x += 100/( PASSO_FRENTE + PASSO_TRAS );
    }else if ( key == 'r' )
     delta_x -= 100/( PASSO_FRENTE + PASSO_TRAS );
  }
  rotateY(radians(angulo));
  rotateX(rotx);
  rotateY(roty);
  scale(0.3);
  translate( delta_x, 0);
  criar_dino();
}

void criar_dino() 
{
    box(150);
    pushMatrix();
      translate(38,-112);
      box(75,75,150);
      
      pushMatrix();
      translate(-55,15);
      box(40,50,130);
      popMatrix();
      
      pushMatrix();
        translate(10,-50);
        box(50,25,150);
      popMatrix();
      
      pushMatrix();
      
      if ( keyPressed && key == 'c' )
        rotateZ(radians(20));
      //cabeca
      pushMatrix();
        translate(50,-105);
        box(90,90,150);
        //boca
        translate(85,35);
        box(80,20,150);
        // boca cima
        
        translate(0,-70);
        box(140,90,150);
        
        pushMatrix();
        translate(-115,-25);
        box(30,40,150);
        popMatrix();
        
        translate(-30,-50);
        box(170,20,150);
      popMatrix();
      
      popMatrix();
      
      // Peitoral
      translate(62,28);
      box(60,180,150);
      
      
      
      // Pata
      pushMatrix();
          translate(40,-20,45);
          box(25,25,20);
          translate(20,10,0);
          box(25,45,20);
      popMatrix();
      
      pushMatrix();
          translate(40,-20,-45);
          box(25,25,20);
          translate(20,10,0);
          box(25,45,20);
      popMatrix();
    popMatrix();
    
    pushMatrix();
       translate(95,20);
       box(40,32,150);
       translate(-10,25);
       box(20,20,150);
    popMatrix();
    
    // Rabo
    pushMatrix();
      translate(-110,-36);
      box(75,75,120);
      pushMatrix();
        translate(-15,-48);
        box(45,20,90);
        translate(-8,-15);
        box(30,30,70);
      popMatrix();
      
      pushMatrix();
        translate(-50,-40);
        box(25,160,70);
      popMatrix();
      
      
      translate(10,55);
      box(55,35,110);
      translate(15,26);
       box(20,20,110);
    popMatrix();
    
    // Pé
    if ( keyPressed && i < PASSO_FRENTE)
      rotateZ(radians(25));
    
    pushMatrix();
      translate(-15,80,-35);
      box(70,20,40);
      translate(0,30);
      box(30,80,40);
      
      translate(15,40);
      box(60,20,40);
    popMatrix();
    
    if ( keyPressed && i < PASSO_FRENTE)
      rotateZ(radians(-50)); 
     
    pushMatrix();
      translate(25,80,40);
      box(70,20,40);
      translate(0,30);
      box(30,80,40);
      
      translate(15,40);
      box(60,20,40);
    popMatrix();
    
    if ( i < PASSO_FRENTE )
      i += 1;
    else if ( i < PASSO_TRAS )
      i += 1;
    else 
      i = 0;
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
