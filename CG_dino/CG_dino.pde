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


double alet;

Dino rex;
void setup() {
  size(800, 800, P3D);
  fill(255);
  stroke(1);
  dirY = (mouseY / float(height) - 0.5) * 2;
  dirX = (mouseX / float(width) - 0.5) * 2;
  delta_x = 0;
  roty = 0;
  
  alet = Math.random();
  
  rex = new Dino();
}

void draw() {
  background(255);
  noStroke();
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  translate(width/2.0, height/2.0, -100);
  angulo = (angulo + 0.35 ) % 360;
  
  rex.agachado = false;
  if ( keyPressed )
  {
    if ( key == 'u' )
      translate(0,-150);
    else if ( key == 'l' )
    {
      rex.agachar();
      rex.birthday = false;
      //delta_x += 100/( PASSO_FRENTE + PASSO_TRAS );
    }else if ( key == 'r' )
     { // delta_x -= 100/( PASSO_FRENTE + PASSO_TRAS );
     } 
  }
  rotateY(radians(angulo));
  rotateX(rotx);
  rotateY(roty);
  scale(0.5);
  pushMatrix();
  translate( delta_x, 0);
  rex.criar_dino();
  popMatrix();
  //translate( 400, 0, 50);
  //criar_dino();
  translate( 450, 0, 0);
  //criar_dino();
  //criar_cacto();
  translate( 0, -400, 50);
  //criar_nuvem();
}

void criar_nuvem()
{
  pushMatrix();
    box(20);
    
    translate(20,-10);
    box(20);
    translate(20,-10);
    box(20);
    
    translate(30,0);
    box(40,20,20);
    translate(25,-15);
    box(20);
    translate(10,-15);
    box(20);
    translate(10,-15);
    box(20);
    translate(20,-15);
    box(40,20,20);
    translate(25,5);
    box(20);
    translate(20,10);
    box(20);
    translate(20,15);
    box(40,20,20);
    translate(20,10);
    box(20);
    translate(10,10);
    box(20);
    translate(10,10);
    box(20);
    translate(0,10);
    box(20);
    translate(-30,15);
    box(120,20,20);
  popMatrix();
}

void criar_cacto()
{  
    //stroke(0);
  pushMatrix();
  
    translate(0,0);//cubo caule
    box(50,300,60);

      pushMatrix();
        translate(0,-155);//cubo do topo
        box(35,10,40);
      popMatrix();
    
      pushMatrix();
          
           if ( alet > 0.5 )
          translate(0,-50);//cubo 1 inferior
          //galho direito do cacto
          
          translate(42,40);//cubo 1 inferior
          box(35,30,60);
       
          pushMatrix();
            translate(22,0);//cubo 2 quina 1
            box(10,10,60);
          popMatrix();
          
          pushMatrix();
            translate(27,-10);//cubo 3 quina 2
            box(20,10,60);
          popMatrix();
          
          pushMatrix();
            translate(29,-20);//cubo 4 base do galho
            box(33,10,60);
          popMatrix();
          
          pushMatrix();
            translate(32,-75);//cubo 5 galho
            box(39,100,60);
            
            pushMatrix();
              translate(0,-55);//cubo 6 topo do galho
              box(25,5,40);
            popMatrix();
            
          popMatrix();
          
      popMatrix();
      
      
pushMatrix();
  
          /*galho esquerdo do cacto*/
          
          translate(-42,45);//cubo 1 inferior
          box(-35,-35,60);
       
          pushMatrix();
            translate(-24,0);//cubo 2 quina 1
            box(14,10,60);
          popMatrix();
          
          pushMatrix();
            translate(-27,-15);//cubo 3 quina 2
            box(-20,15,60);
          popMatrix();
          
          pushMatrix();
            translate(-29,-25);//cubo 4 base do galho
            box(-35,-10,60);
          popMatrix();
          
          pushMatrix();
            translate(-29,-70);//cubo 5 galho
            box(-35,-80,60);
            
            pushMatrix();
              translate(0,-44);//cubo 6 topo do galho
              box(-25,-5,40);
            popMatrix();
            
          popMatrix();
          
      popMatrix();
  popMatrix();
  
  
 /* pushMatrix();
  
          galho esquerdo do cacto
          
          translate(-42,-40);//cubo 1 inferior
          box(35,30,60);
       
          pushMatrix();
            translate(-22,0);//cubo 2 quina 1
            box(10,10,60);
          popMatrix();
          
          pushMatrix();
            translate(-27,10);//cubo 3 quina 2
            box(20,10,60);
          popMatrix();
          
          pushMatrix();
            translate(-29,20);//cubo 4 base do galho
            box(35,10,60);
          popMatrix();
          
          pushMatrix();
            translate(-29,75);//cubo 5 galho
            box(35,100,60);
            
            pushMatrix();
              translate(0,55);//cubo 6 topo do galho
              box(25,5,40);
            popMatrix();
            
          popMatrix();
          
      popMatrix();
  popMatrix();
  */
  
   
}   


void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
