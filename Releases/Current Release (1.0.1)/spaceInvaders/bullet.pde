class Bullet{
  float x, y, speed;
  color c;
  
  Bullet(float ox, boolean spaceship, float oy){
    x = ox;
    if(spaceship) {
      y = height;
      speed = -25;
      c = color(255);
    } else {
      y = oy;
      speed = 10;
      c = color(#F1F543);
    }
  }
  
  void desenha(){
    fill(c);
    noStroke();
    ellipse(x, y, 10, 10);
    y += speed;
  }
}
