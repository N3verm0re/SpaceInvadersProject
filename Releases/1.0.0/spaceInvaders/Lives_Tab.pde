class Lives {
  int i;
  boolean dead = false;
  
  Lives(int life) {
    i = life;
  }
  
  void show() {
    textSize(14);
    textAlign(LEFT);
    fill(255);
    text("Lives: " + i, 0, 14);
  }
  
  void looselife() {
    i -= 1;
    if(i == 0) {
      gs = false;
      gameEndScreen = true;
    }
  }
}
