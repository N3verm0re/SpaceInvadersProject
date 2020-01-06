class Game {
  color bgcolor;
  Invaders invaders;
  Spaceship spaceship;

  Game() {
    bgcolor = color(10,10,100);
    invaders = new Invaders(10);
    spaceship = new Spaceship();
  }

  void show() {
    background(bgcolor);
    invaders.show();
    spaceship.show();
  }
}
