class Game {
  color bgcolor, c;
  Star[] stars;
  Spaceship spaceship;
  Barrier[] barrier;
  Score scoreTab;
  ArrayList<Invaders> invaders;
  PImage invaders1;
  PImage invaders2;
  PImage invaders3;
  PVector bgposition = new PVector(width/2, height/2);
  int numStars;

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
    barrier = new Barrier[3];
    for(int i = 1; i <= barrier.length; i++) {
      barrier[i-1] = new Barrier(width/(barrier.length+1)*i);
    }
    scoreTab = new Score();
    
    invaders1 = loadImage("invader1.png");
    invaders2 = loadImage("invader2.png");
    invaders3 = loadImage("invader3.png");
    
    imageMode(CENTER);
    
    CreateInvaders();
  }
  
  //Invaders List assign Loop
  void CreateInvaders() {
    float numOfEnemies = width/invaders1.width;
    //all images will have same width/height so this is irrelevant wich image is used;
    
    for(int i = 0; i < 3; i++) {
      float posX = 0;
      for(int j = 0; j < numOfEnemies; j++) {
        Invaders invader = new Invaders();
        if (i == 0) {
          invader.image = invaders1;
          invader.position = new PVector(posX, 0);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        } else if(i == 1) {
          invader.image = invaders2;
          invader.position = new PVector(posX, invaders1.width+50);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        } else if(i == 2) {
          invader.image = invaders3;
          invader.position = new PVector(posX, invaders1.width+50+invaders2.width+50);
          invader.b = new Bullet(invader.position.x, false, invader.position.y);
        }
        invaders.add(invader);
        
        posX += invaders1.width;
        //all images will have same width/height so this is irrelevant wich image is used;
      }
    }
  }
  
  void CheckForGameReset() {
    if(invaders.size() == 0) {
      CreateInvaders();
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
    
    for(int i = 0; i< game.invaders.size(); i++) {
        invaders.get(i).show(i);
    }
    
    //Invaders Movement Method Called here
    //invaders.get(i).move();
    
    CheckForGameReset();
  }
}

/*
To Implement:
  Enemies:
    Less Enemies + Smaller Enemies
    Movement
    Dynamic Movement(if one unit is destroyed, movement is adjusted so units move across all canvas)
*/
