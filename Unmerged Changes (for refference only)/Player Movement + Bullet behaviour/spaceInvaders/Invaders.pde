class Invaders {
  int numberOfInvaders,x=width/2,y=width/2;
  PImage[] invaders;
  
  Invaders(int n) {
    numberOfInvaders = n;
    invaders = new PImage[n];
  }
  
  void show() {
    fill(255);
    noStroke();
    rect(x, y, 55, 55);
  }
}
