class Star {
  float posX, posY, size;
  color c;

  Star() {
    posX = random(width);
    posY = random(height);
    size = random(2);
    c = color(random(200, 255));
    
  }

  void show() {
    if (posX<width) {
      posX=posX+0.5;
    } else {
      posY = random(height);
      posX=0;
    }
    noStroke();
    fill(c);
    ellipse(posX, posY, size, size);
  }
}
