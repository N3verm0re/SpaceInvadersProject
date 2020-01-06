class Game {
  color bgcolor;
  Spaceship spaceship;
  ArrayList<Invaders> invaders;
  PImage invaders1;
  PImage invaders2;
  PImage invaders3;
  PImage bg = loadImage("background.png");
  PVector bgposition = new PVector(width/2, height/2);

  Game() {
    invaders = new ArrayList<Invaders>();
    spaceship = new Spaceship();
    
    invaders1 = loadImage("invader1.png");
    invaders2 = loadImage("invader2.png");
    invaders3 = loadImage("invader3.png");
    
    imageMode(CENTER);
  }
  
  void backgroundAnimation() {
    image(bg, bgposition.x, bgposition.y, bg.width, height*3);
    bgposition.y -=3;
    if(bgposition.y == -height*2) {
      bgposition.y = 0+height/2;
    }
  }

  void show() {
    backgroundAnimation();
    spaceship.show();
    
    float numOfEnemies = width/invaders1.width;
    //all images will have same width/height so this is irrelevant wich image is used;
    
    for(int i = 0; i < 3; i++) {
      float posX = 0;
      for(int j = 0; j < numOfEnemies; j++) {
        Invaders invader = new Invaders();
        if (i == 0) {
          invader.image = invaders1;
          invader.position = new PVector(posX, 0);
        } else if(i == 1) {
          invader.image = invaders2;
          invader.position = new PVector(posX, invaders1.width+50);
        } else if(i == 2) {
          invader.image = invaders3;
          invader.position = new PVector(posX, invaders1.width+50+invaders2.width+50);
        }
        invaders.add(invader);
        
        posX += invaders1.width;
        //all images will have same width/height so this is irrelevant wich image is used;
      }
    }
    
    for(int i = 0; i< invaders.size(); i++) {
        image(invaders.get(i).image, invaders.get(i).position.x, invaders.get(i).position.y);
    }
  }
}

/*Color Info:
  #2D11D1 - BG (temp)
  #2BCB4A - Spaceship(temp)
  
  To Implement:
  Finish work on BG Animation:
    Work on image sizes
    Improve image color
  Enemies:
    Less Enemies + Smaller Enemies
    Movement
    Dynamic Movement(if one unit is destroyed, movement is adjusted so units move across all canvas)
    Better (custom) Sprites?
    
  Fix framerate!!
*/
