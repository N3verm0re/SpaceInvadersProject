class Invaders {
  public PImage image;
  public PVector position;
  Bullet b;
  float xdir = 0.7;
  boolean d = false;
  
  Invaders(float incr) {xdir += incr;}
  
  void show(int i) {
    image(game.invaders.get(i).image, game.invaders.get(i).position.x, game.invaders.get(i).position.y);
    
    if (d == true) {
      b.desenha();
    }
    
    //Colisao Bala - Barreira
    for(int j = 0; j < game.barrier.length; j++) {
      if (dist(b.x, b.y, game.barrier[j].x, game.barrier[j].y) < game.barrier[j].lp) {
        game.barrier[j].dano();
        d = false;
        b.y = game.invaders.get(i).position.y;
      }
    }
    
    //Colisao Bala - Player
    if(dist(b.x, b.y, game.spaceship.posX, game.spaceship.posY) < game.spaceship.SSSprite.width) {
      game.spaceship.hit();
      d = false;
      b.y = game.invaders.get(i).position.y;
    }
    
    //Bala OffScreen
    if (b.y >= height) {
      d = false;
      b.y = game.invaders.get(i).position.y;
    }
  }
  
  void move(int i) {
    game.invaders.get(i).position.x += xdir;
  }
  
  void shiftDown(int i) {
    game.invaders.get(i).position.y += game.invaders.get(i).image.height;
    xdir *= -1;
  }
  
  void death(int i) {
    game.invaders.remove(i);
  }
  
  void fire(int i) {
    if (d != true) {
      d = true;
      println("bullet fired");
      b.x = game.invaders.get(i).position.x;
    }
  }
}
