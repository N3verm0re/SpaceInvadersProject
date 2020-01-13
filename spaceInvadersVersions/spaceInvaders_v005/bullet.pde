class Bullet{
  float x, y;
  
  Bullet(float ox, boolean spaceship, float oy){
    x = ox;
    if(spaceship) {
      y = height;
    } else {
      y = oy;
    }
  }
  
  void desenha(){
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
    y -= 25;
  }
}
