class Game {

  color bgcolor, c;
  int numStars;
  Invaders invaders;
  Spaceship spaceship; 
  Barrier barrier;
  int barlp=50;
  Star[] stars;

  Game() {
    bgcolor = color(10, 10, 100);
    barrier= new Barrier();
    invaders = new Invaders(10);
    spaceship = new Spaceship();
    numStars = 500;
    c = color(10, 10, 100);
    stars = new Star[numStars];
    for (int i = 0; i < numStars; i++) {
      stars[i] = new Star();
    }
  }

  void show() {
    fill(c);
    noStroke();
    for (int i = 0; i < numStars; i++) {
      stars[i].show();
    }
    //invader.show();
    barrier.show(barlp);
    spaceship.show();
    
  }
}
