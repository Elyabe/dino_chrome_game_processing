class Nuvem {

  
  
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
  
}
