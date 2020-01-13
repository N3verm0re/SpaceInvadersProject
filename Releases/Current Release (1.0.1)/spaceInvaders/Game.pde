class Game {
  color bgcolor, c;
  Star[] stars;
  Spaceship spaceship;
  Barrier[] barrier;
  Score scoreTab;
  Lives livesTab;
  ArrayList<Invaders> invaders;
  PImage invaders1;
  PImage invaders2;
  PImage invaders3;
  PVector bgposition = new PVector(width/2, height/2);
  int numStars, lvl = 0;

  Game() {
    //Background vars
    bgcolor = color(10, 10, 100);
    numStars = 500;
    c = color(10, 10, 100);
    stars = new Star[numStars];
    
    for (int i = 0; i < numStars; i++) {
      stars[i] = new Star();
    }
    
    //Invaders List + Sprite Initialization + Objects
    invaders = new ArrayList<Invaders>();
    spaceship = new Spaceship();
    livesTab = new Lives(3);
    barrier = new Barrier[4];
    for(int i = 1; i <= barrier.length; i++) {
      barrier[i-1] = new Barrier(width/(barrier.length+1)*i);
    }
    scoreTab = new Score();
    
    invaders1 = loadImage("invader1.png");
    invaders2 = loadImage("invader2.png");
    invaders3 = loadImage("invader3.png");
    
    imageMode(CENTER);
    
    CreateInvaders(0);
  }
  
  //Invaders List assign Loop
  void CreateInvaders(float incr) {
    float numOfEnemies = 42;
    float stepX = width/(numOfEnemies/3+2);
    
    for(int i = 0; i < 3; i++) {
      float posX = width/(numOfEnemies/3+2)*(1.5);
      for(int j = 0; j < numOfEnemies/3; j++) {
        Invaders invader = new Invaders(incr);
        if (i == 0) {
          invader.image = invaders1;
          invader.position = new PVector(posX, invaders1.height+40);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        } else if(i == 1) {
          invader.image = invaders2;
          invader.position = new PVector(posX, (invaders1.height+60)*2);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        } else if(i == 2) {
          invader.image = invaders3;
          invader.position = new PVector(posX, (invaders1.height+60)*3);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        }
        invaders.add(invader);
        
        posX += stepX;
      }
    }
  }
  
  void BarrierReset() {
    for(int i = 0; i < barrier.length; i++) {
      barrier[i].lp = 100;
      barrier[i].c = color(255);
    }
  }
  
  void CheckForGameReset() {
    if(invaders.size() == 0) {
      CreateInvaders(0.6);
      lvl += 1;
    }
  }

  void show() {
    //Background Animation
    background(0, 10, 30);
    fill(c);
    noStroke();
    for (int i = 0; i < numStars; i++) {
      stars[i].show();
    }
    
    //Method calls
    spaceship.show();
    
    for (int i = 0; i < barrier.length; i++) {
      barrier[i].show();
    }
    
    scoreTab.show();
    livesTab.show();
    
    for(int i = 0; i< invaders.size(); i++) {
        invaders.get(i).show(i);
    }
    
    //Invaders Movement Method Call
    for(int i = 0; i < invaders.size(); i++) {
      invaders.get(i).move(i);
      
      if(invaders.get(i).position.x > width-invaders.get(i).image.width || invaders.get(i).position.x < invaders.get(i).image.width) {
        for(int j = 0; j < invaders.size(); j++) {
          invaders.get(j).shiftDown(j);
        }
      }
      
      
      if(invaders.get(i).position.y > spaceship.posX) {
        gameEndScreen = true;
      }
    }
    
    //Invaders Shooting Controller
    boolean flagShoot = false;
    if(invaders.size() > 0) {
      for(int i = 0; i < invaders.size(); i++) {
        if(invaders.get(i).d) {
          flagShoot = true;
        }
      }
      
      if(!flagShoot) {
        int i = int(random(0, invaders.size()));
        invaders.get(i).fire(i);
      }
  }
    
    CheckForGameReset();
  }
  
  void end() {
    textSize(32);
    textAlign(CENTER);
    fill(255);
    text("You Have died.", width/2, height/2);
    text("Final Score: " + scoreTab.value, width/2, height/2+40);
    text("Press BACKSPACE to return to Menu or ESC to exit", width/2, height/2+120);
  }
}
