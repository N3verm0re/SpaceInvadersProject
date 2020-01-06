Game game;
int d;

void setup() {
  fullScreen(P2D);
  game = new Game();
}

void draw() {
  game.show();
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

void keyReleased() {
  if (key == 32) {
    game.spaceship.fire();
    println("bullet fired1");
  }
  
  /*if(dist(game.spaceship.b.x, game.spaceship.b.i, i.y, i.x) == 0){
    game.spaceship.d = false;
    println("colisao");
  }*/
}

//Integrar colisão
