class Spaceship {
  float posY, shipW, shipH;
  int posX;
  color c;
  boolean d=false;
  Bullet b;
  Barrier bar;
  
  Spaceship() {
    bar=new Barrier();
    b=new Bullet(posX);
    rectMode(CENTER);
    c = color(255);
    shipW = 60;
    shipH = 20;
    posX = width/2;
    posY = height-shipH/2;
  }

  void show() {
    fill(c);
    noStroke();
    rect(posX, posY, shipW, shipH);
    rect(posX, posY-shipH, shipW-shipW/2, shipH);
    
    if (d==true) {
      b.desenha();
      println(bar.x);
      if (dist(b.x, b.i, bar.x, bar.y)<40) {
        println("colisao");
        println("recarregado");
        bar.dano();
        
        d=false;
        b.i=height;
      }
    }
    
    if (b.i<=0) {
      d=false;
      b.i=height;
      println("recarregado");
    }
  }
  
  void move(int newPos) { 
    posX += newPos;
    println(posX);
    
    if (posX>=width) {
      posX=width-20;
    }
    
    if (posX<=0) {
      posX=20;
    }
  }


  void fire() {
    if (d!=true) {
      d=true;
      println("bullet fired");
      b.x = posX;
      tiro.play();
      tiro.rewind();
    }
  }
}
