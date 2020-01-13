class Invaders {
  public PImage image;
  public PVector position;
  Bullet b;
  
  Invaders() {}
  
  void show(int i) {
    image(game.invaders.get(i).image, game.invaders.get(i).position.x, game.invaders.get(i).position.y);
  }
  
  void move() {
  }
  
  void death(int i) {
    game.invaders.remove(i);
  }
  
  void shoot() {
    
  }
}

//class can be used to implement enemy bullets
