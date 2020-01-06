/*
GAME
 |_ Invaders
 |_ Spaceship
 |_ Ammo
 */
bullet b;
Invaders i;
Spaceship s;
Game game;
int d;
void setup() {
  size(400, 400);
  game = new Game();
}

void draw() {
  game.show();
}

/*void mouseMoved() { 
 game.spaceship.move(mouseX);
 }*/
/*void mouseReleased() {
 game.spaceship.fire();
 }*/
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
  if(dist(b.x,b.i,i.y,i.x)==0){
    s.d=false;
    println("colisao");
  }
}
