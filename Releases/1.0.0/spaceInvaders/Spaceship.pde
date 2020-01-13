class Spaceship {
  float posY, posX;
  boolean d = false;
  Bullet b;
  PImage SSSprite;
  
  Spaceship() {
    SSSprite = loadImage("spaceship.png");
    b = new Bullet(posX, true, height);
    rectMode(CENTER);
    posX = width/2;
    posY = height-SSSprite.height/2;
  }

  void show() {
    image(SSSprite, posX, posY);
    
    //Draw bala + Colisoes
    if (d == true) {
      b.desenha();
      
      //Colisao Bala - Barreira
      for(int i = 0; i < game.barrier.length; i++) {
        if (dist(b.x, b.y, game.barrier[i].x, game.barrier[i].y) < game.barrier[i].lp) {
          println("colisao");
          println("recarregado");
          game.barrier[i].dano();

          d = false;
          b.y = height;
        }
      }
      
      //Colisao Bala - Invader
      for(int i = 0; i< game.invaders.size(); i++) {
        if(dist(game.invaders.get(i).position.x, game.invaders.get(i).position.y, b.x, b.y) < game.invaders.get(i).image.width) {
          println("colisao1");
          println("recarregado");
          game.invaders.get(i).death(i);
          game.scoreTab.AddValue(100);
          
          d = false;
          b.y = height;
        }
      }
    }
    
    //Bala OffScreen
    if (b.y <= 0) {
      d = false;
      b.y = height;
      println("recarregado");
    }
  }
  
  void move(int newPos) { 
    posX += newPos;
    println(posX);
    
    if (posX >= width) {
      posX = width-20;
    }
    
    if (posX <= 0) {
      posX = 20;
    }
  }

  void fire() {
    if (d != true) {
      d = true;
      println("bullet fired");
      b.x = posX;
      tiro.play();
      tiro.rewind();
    }
  }
  
  void hit() {
    game.livesTab.looselife();
  }
}
