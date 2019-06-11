class Dino
{
  boolean andando;
  boolean agachado;
  boolean vivo, birthday;
  
  Dino()
  {
    this.vivo = false;
    this.andando = false;
    this.agachado = false;
    this.birthday = true;
  }
  
  void criar_dino() 
  {
      float box_ca_x;
      PVector x = new PVector(), t = new PVector();
      box(150);
      
      pushMatrix();
        
        
        if ( this.agachado ) {
          box_ca_x = 110;
          t.x = 0;
          t.y = -60;
        } else {
          box_ca_x = 75;
          t.x = 38;
          t.y = -112;
        }
        
        translate(t.x,t.y);
        box(box_ca_x,75,150);
        
        
        if ( !this.agachado )
        {
          pushMatrix();
          translate(-55,15);
          box(40,50,150);
          popMatrix();
          
          pushMatrix();
            translate(10,-50);
            box(50,25,150);
          popMatrix();
        }
        pushMatrix();
        
        if ( keyPressed && key == 'c' )
          rotateZ(radians(20));
        
        if ( this.birthday )
        {
          pushMatrix();
          translate(100,-400);
          this.drawCylinder(5, 80, 200, 16);
          this.star(0,0,30,15, 5);
          popMatrix();
        }
        
        //cabeca
        pushMatrix();
          if ( this.agachado ) {
            x.x = 170;
            x.y = 20; 
          } else { 
            x.x = 50;
            x.y = -105; 
          }
            
          translate(x.x, x.y);
            
          box(90,90,150);
          //boca
          translate(85,35);
          box(80,20,150);
          // boca cima
          
          translate(0,-70);
          box(140,90,150);
          
          pushMatrix();
             if( this.vivo )
             {
               x.x =30;
               x.y = 40;
               t.x = -115;
               t.y = -25;
             } else {
               x.x = 20;
               x.y = 40;
               t.x = -105;
               t.y = -25;
             }

          translate(t.x,t.y);
          box(x.x,x.y,150);
          popMatrix();
          
          translate(-30,-50);
          box(170,20,150);
        popMatrix();
        
        popMatrix();
        
        if ( this.agachado ){
          x.x = 80;
          x.y = 100;
          
          t.x = 90;
          t.y = 50;
        } else{
          x.x = 80;
          x.y = 180;
          
          t.x = 62;
          t.y = 28;
        }
        
        // Peitoral
        translate(t.x,t.y);
        box(x.x,x.y,150);
        
          // Pata
          pushMatrix();
              if ( this.agachado ){
                t.x = 10;
                t.y = 60;
              } else {
                t.x = 40;
                t.y = -20;
              }
              
              translate(t.x,t.y,45);
              box(25,25,20);
              
              if ( this.agachado ){
                t.x = 15;
                t.y = 25;
                x.x = 40;
                x.y = 25;
              } else {
                t.x = 25;
                t.y = 10;
                x.x = 25;
                x.y = 45;
              }
              translate(t.x,t.y,0);
              box(x.x,x.y,20);
          popMatrix();
          
          pushMatrix();
              if ( this.agachado ){
                t.x = 10;
                t.y = 60;
              } else {
                t.x = 40;
                t.y = -20;
              }
              
              translate(t.x,t.y,-45);
              box(25,25,20);
              
              if ( this.agachado ){
                t.x = 15;
                t.y = 25;
                x.x = 40;
                x.y = 25;
              } else {
                t.x = 25;
                t.y = 10;
                x.x = 25;
                x.y = 45;
              }
              translate(t.x,t.y,0);
              box(x.x,x.y,20);
              //translate(40,-20,-45);
              //box(25,25,20);
              //translate(20,10,0);
              //box(25,45,20);
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
        box(75,75,150);
        pushMatrix();
          translate(-15,-48);
          box(45,22,150);
          translate(-8,-15);
          box(30,32,150);
        popMatrix();
        
      if ( this.agachado ){
                t.x = -50;
                t.y = -35;
                x.x = 25;
                x.y = 130;
              } else {
                t.x = -50;
                t.y = -45;
                x.x = 25;
                x.y = 160;
              }
       
        pushMatrix();
          translate(t.x,t.y);
          box(x.x,x.y,150);
        popMatrix();
        
        translate(10,55);
        box(55,35,150);
        translate(15,26);
         box(20,20,150);
      popMatrix();
      
      pushMatrix();
      // Pé
      if ( this.andando && i < PASSO_FRENTE)
        rotateZ(radians(25));
      
      pushMatrix();
        translate(-15,80,-35);
        box(70,20,40);
        translate(0,30);
        box(30,80,40);
        
        translate(15,40);
        box(60,20,40);
      popMatrix();
      
      if ( this.andando && i < PASSO_FRENTE)
        rotateZ(radians(-50)); 
       
      pushMatrix();
        translate(25,80,40);
        box(70,20,40);
        translate(0,30);
        box(30,80,40);
        
        translate(15,40);
        box(60,20,40);
      popMatrix();
      
      popMatrix();
      if ( i < PASSO_FRENTE )
        i += 1;
      else if ( i < PASSO_TRAS )
        i += 1;
      else 
        i = 0;
  } 
 
  void drawCylinder(float topRadius, float bottomRadius, float tall, int sides) {
  float angle = 0;
  float angleIncrement = TWO_PI / sides;
  beginShape(QUAD_STRIP);
  for (int i = 0; i < sides + 1; ++i) {
    vertex(topRadius*cos(angle), 0, topRadius*sin(angle));
    vertex(bottomRadius*cos(angle), tall, bottomRadius*sin(angle));
    angle += angleIncrement;
  }
  endShape();
  
  // If it is not a cone, draw the circular top cap
  if (topRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    
    // Center point
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(topRadius * cos(angle), 0, topRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }

  // If it is not a cone, draw the circular bottom cap
  if (bottomRadius != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);

    // Center point
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(bottomRadius * cos(angle), tall, bottomRadius * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

  void agachar()
  {
    this.agachado = true;
  }
  
}
