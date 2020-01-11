/*
GAME
 |_ Invaders
 |_ Spaceship
 |_ Ammo
 */
Game game;
boolean gs=false;
int d;
void setup() {
  size(400, 400);
  game = new Game();
}

void draw() {
  if (gs==true) {
    game.show();
  } else {
    background(0, 10, 30);
    textSize(32);
    fill(0, 102, 153, 204);
    text("press entere", 12, 45, -30);
    text("press enter", 12, 60);

    text("Space Invaders", width/2, height/2); 
  }
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
  if (key==ENTER) {
    gs=true;
    println("game start!");
  }
}