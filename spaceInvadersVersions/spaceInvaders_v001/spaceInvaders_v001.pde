Game game;
int d;

void setup() {
  fullScreen(P2D);
  game = new Game();
}

void draw() {
  game.show();
}

void mouseReleased() {
  game.spaceship.fire();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      d = -20;
    } else if (keyCode == RIGHT) {
      d = 20;
    } 
    game.spaceship.move(d);
  }
}
