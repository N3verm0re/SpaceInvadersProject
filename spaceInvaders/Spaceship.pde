class Spaceship {
  float posY, shipW, shipH;
  int posX;
  color c;

  Spaceship() {
    rectMode(CENTER);
    c = color(#2BCB4A);
    shipW = 60;
    shipH = 20;
    posX = width/2;
    posY = height-shipH/2;
  }

  void show() {
    fill(c);
    rect(posX, posY, shipW, shipH);
    rect(posX, posY-shipH, shipW-shipW/2, shipH);
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
    float i=0;
    ellipse(posX, i, 10, 10);
    i+=0.00000001;
    println("bullet fired");
  }
}
