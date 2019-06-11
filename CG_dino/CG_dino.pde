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

float valor_sort_nuvem, valor_sort_cacto;

double alet;
int qtd;

Dino rex;
Nuvem nuvem;
Cacto cacto;

void setup() {
  size(1000, 800, P3D);
  fill(255);
  stroke(1);
  dirY = (mouseY / float(height) - 0.5) * 2;
  dirX = (mouseX / float(width) - 0.5) * 2;
  delta_x = 0;
  roty = 0;
  
  alet = Math.random();
  
  rex = new Dino();
  nuvem = new Nuvem();
  cacto = new Cacto();
  
  sortear_elementos();
}

void draw() {
  background(255);
  noStroke();
  
  //rotateX(rotx);
  //rotateY(roty);
  
  directionalLight(204, 204, 204, -dirX, -dirY, -1);
  pushMatrix();  
    translate(100, height - 60, 0);
    scale(0.25);
    rex.criar_dino();
  popMatrix();
  
  //translate(width/2.0, height/2.0, -100);
  ////angulo = (angulo + 0.35 ) % 360;
  
  //rex.agachado = false;
  //if ( keyPressed )
  //{
  //  if ( key == 'u' )
  //    translate(0,-150);
  //  else if ( key == 'l' )
  //  {
  //    rex.agachar();
  //    rex.birthday = false;
  //    //delta_x += 100/( PASSO_FRENTE + PASSO_TRAS );
  //  }else if ( key == 'r' )
  //   { // delta_x -= 100/( PASSO_FRENTE + PASSO_TRAS );
  //   } 
  //}
  //rotateY(radians(angulo));
  
  //scale(0.3);
  //pushMatrix();
  
  pushMatrix();
  translate(width, 100);
  scale(0.4);
  translate( -delta_x, 0);
  
  if ( valor_sort_nuvem > 0.5)
    nuvem.criar_nuvem();
  
  
    pushMatrix();
    translate(0, height + 800);
    if ( valor_sort_cacto < 0.6)
    {
      
      switch(qtd)
      {
        case 1:
            cacto.criar_cacto();
            break;
        case 2:
            cacto.criar_cacto();
            translate(150,0);
            cacto.criar_cacto();
            break;
        case 3:
            cacto.criar_cacto();
            translate(150,0);
            cacto.criar_cacto();
            translate(150,0);
            cacto.criar_cacto();
      }
    }
    popMatrix();
    
    if ( delta_x > 2*width + 200 ) 
      sortear_elementos();
    
  popMatrix();
  
  ////rex.criar_dino();
  //popMatrix();
  //rex.criar_dino();
  
  //translate( 400, 0, 50);
  //criar_dino();
  //translate( 450, 0, 0);
  //criar_dino();
  //criar_cacto();
  //translate( 0, -400, 50);
  //criar_nuvem();
  
  delta_x += 10;
  

  
}


void sortear_elementos()
{
    valor_sort_cacto = (float)Math.random();
    valor_sort_nuvem = (float)Math.random();
    qtd = (int)(Math.random()*3);
    delta_x = 0;
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
