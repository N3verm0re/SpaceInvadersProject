class Game {
  color bgcolor;
  Invaders invaders;
  Spaceship spaceship; 
  Barrier barrier;
  
  Game() {
    bgcolor = color(10, 10, 100);
    barrier= new Barrier();
    invaders = new Invaders(10);
    spaceship = new Spaceship();
  }

  void show() {
    background(0,10,30);
    //invarrier.show();
    barrier.show();
    spaceship.show();
  }
}
