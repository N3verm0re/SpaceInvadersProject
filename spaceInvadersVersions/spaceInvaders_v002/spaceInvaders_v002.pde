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
    if (keyCode == LEFT || keyCode == 'a' || keyCode == 'A') {
      d = -20;
    } else if (keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') {
      d = 20;
    } 
    game.spaceship.move(d);
  }
}
