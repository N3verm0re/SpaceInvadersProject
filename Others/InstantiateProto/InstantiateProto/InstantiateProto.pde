ArrayList<Enemy> enemies;

PImage enemyImage;

void setup()
{
  size(1500, 500);
  background(255);

  enemies = new ArrayList<Enemy>();

  enemyImage = loadImage("image.png");

  float numOfEnemies = width / enemyImage.width;
  float posX = 0;
  
  for (int i = 0; i < numOfEnemies; i++)
  {
    Enemy enemy = new Enemy();
    enemy.image = enemyImage;
    enemy.position = new PVector(posX, 0);
    enemies.add(enemy);

    posX+= enemyImage.width;
  }

  for (int i = 0; i < enemies.size(); i++)
  {
    image(enemies.get(i).image, enemies.get(i).position.x, enemies.get(i).position.y);
  }
}

void draw()
{
  background(255);
  
   for (int i = 0; i < enemies.size(); i++) 
  {
    enemies.get(i).position.x--;
    image(enemies.get(i).image, enemies.get(i).position.x, enemies.get(i).position.y);
  }
  
}
