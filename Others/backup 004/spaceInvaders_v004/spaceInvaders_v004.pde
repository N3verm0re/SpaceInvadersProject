import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer tiro, hitw, st;
Game game;
boolean gs = false;
int d;

void setup() {
  fullScreen(P2D);
  game = new Game();
  minim=new Minim(this);
  tiro= minim.loadFile("lasershot.mp3");
  hitw=minim.loadFile("Hitwall.wav");
  st=minim.loadFile("metroid.wav");
  st.loop();
}

void draw() {
  background(0, 10, 30);
  
  if (gs==true) {
    game.show();
  } else {  
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
  
  /*if(dist(game.spaceship.b.x, game.spaceship.b.i, i.y, i.x) == 0){
    game.spaceship.d = false;
    println("colisao");
  }*/
}

//Integrar colisão
