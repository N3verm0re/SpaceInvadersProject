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
PFont font;

void setup() {
  fullScreen(P2D);
  
  //Sound Loading
  game = new Game();
  minim=new Minim(this);
  tiro = minim.loadFile("lasershot.mp3");
  hitw = minim.loadFile("Hitwall.wav");
  st = minim.loadFile("metroid.wav");
  
  //Main Theme
  st.loop();
  
  //Font Loading
  font = createFont("PressStart2P-vaV7.ttf", 32);
  textFont(font);
}

void draw() {
  background(0);
  
  //Menu Text And Game/Credits Trigger
  if (gs==true) {
    game.show();
  } else {  
    textAlign(CENTER);
    fill(#DDDE55);
    
    textSize(90);
    text("Space Invaders", width/2, height/2-70, 0);
    fill(#2F4DDE);
    text("Space Invaders", width/2, height/2-80, 10);
    fill(#3B366A);
    text("Space Invaders", width/2, height/2-90, 20);
    
    fill(#DDDE55);
    textSize(32);
    text("Press Enter to Play", width/2, height/2+60);
    text("Press ESC to Exit", width/2, height/2+200);
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
  
  if (key == ESC) {
    exit();
  }
  
  //Font debugging (Press Start 2P)
  /*if (key == 't') {
    String[] fontList = PFont.list();
    printArray(fontList);
  }*/
  
  /*if(dist(game.spaceship.b.x, game.spaceship.b.i, i.y, i.x) == 0){
    game.spaceship.d = false;
    println("colisao");
  }*/
}

//Integrar colisão
