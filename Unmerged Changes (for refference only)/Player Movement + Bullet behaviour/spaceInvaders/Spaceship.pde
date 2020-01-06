class Spaceship {
  float posY, shipW, shipH;
  int posX;
  color c;
  boolean d=false;
  bullet b;
  Spaceship() {
    b = new bullet(posX);
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
    }
  }
}
