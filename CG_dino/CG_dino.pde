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

  
import processing.sound.*;

SoundFile file;

PImage tex;
float rotx = 0;
float roty = PI/4, delta_x, PASSO_FRENTE = 8 , PASSO_TRAS = 16, SALTO = 800;
float angulo = 0, angulo_lua = 0;
float dirY, dirX, i = 0; 

float valor_sort_nuvem, valor_sort_cacto;

double alet;
int qtd;

double tam_cacto[] = {Math.random()%300 + 100, Math.random()%300 + 100 , Math.random()%300 + 100};
Dino rex;
Nuvem nuvem;
Cacto cacto;

boolean modo3d = false;


void setup() {
  size(1000, 800, P3D);
  fill(255);
  stroke(1);
  
  file = new SoundFile(this, "sound.mp3");
  
  dirY = (mouseY / float(height) - 0.5) * 2;
  dirX = (mouseX / float(width) - 0.5) * 2;
  delta_x = 0;
  roty = 0;
  
  alet = Math.random();
  
  rex = new Dino(modo3d);
  nuvem = new Nuvem();
  cacto = new Cacto(300);
  
  sortear_elementos();
}

void draw() {
  background(255);
  noStroke();
 
  rotateY(roty);
  rotateY(rotx);
  //PASSO_FRENTE = 8;
  //PASSO_TRAS = 16;
        
  directionalLight(204, 204, 204, -dirX, -dirY, -200);
  pushMatrix();  
    translate(100, height - 50, 0);
    scale(0.25);
    rex.agachado = false;
    if ( keyPressed )
    {
      if ( key == 'u' )
      {
        rex.andando = false; 
        translate(0,-SALTO);
        rex.pos.y = SALTO;
        rex.andando = true;
      }else if ( key == 'l' )
      {
        rex.agachar();
        rex.birthday = false;
        PASSO_FRENTE = 2;
        PASSO_TRAS = 4;
        delta_x += 100/( PASSO_FRENTE + PASSO_TRAS );
      }else if ( key == 'r' )
       {
         delta_x -= 100/( PASSO_FRENTE + PASSO_TRAS );
       } 
    }else
    {
      PASSO_FRENTE = 4;
        PASSO_TRAS = 8;
    }
    rex.criar_dino();
  popMatrix();
  
  
  pushMatrix();
  translate(width, 100);
  scale(0.4);
  translate( -delta_x, 0);
  
   cacto.pos.x = width - delta_x;
  
    pushMatrix();
    translate( 0, height + 800);
    if ( valor_sort_cacto < 0.6)
    {
      
      switch(qtd)
      {
        case 1:
            cacto.altura = (float)tam_cacto[0];
            cacto.criarCacto();
            break;
        case 2:
            cacto.altura = (float)tam_cacto[0];
            cacto.criarCacto();
            translate(150,0);
            cacto.altura = (float)tam_cacto[1];
            cacto.criarCacto();
            break;
        case 3:
            cacto.altura = (float)tam_cacto[0];
            cacto.criarCacto();
            translate(180,0);
            cacto.altura = (float)tam_cacto[1];
            cacto.criarCacto();
            translate(180,0);
            cacto.altura = (float)tam_cacto[2];
            cacto.criarCacto();
      }
    }
    popMatrix();
    
    if ( delta_x > 2*width + 300 ) 
      sortear_elementos();
    
  popMatrix();
  
  
  delta_x += 10;
  pushMatrix();
  textSize(50); 
  fill(36);
  text( frameCount/frameRate , width*0.8, 100);
  fill(255);
  popMatrix();
  
 
  
  rex.pos.y = 0;
 
  if ( dist(rex.pos.x,rex.pos.y,cacto.pos.x,cacto.pos.y) < rex.raio + cacto.raio )
    text("Colidiu",width*0.8,200 );
  
}


void sortear_elementos()
{
    valor_sort_cacto = (float)Math.random();
    valor_sort_nuvem = (float)Math.random();
    for ( int k =0; k < 3; k++ )
      tam_cacto[k] = Math.random()%600 + 300;
    
    qtd = (int)(Math.random()*3);
    delta_x = 0;
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
