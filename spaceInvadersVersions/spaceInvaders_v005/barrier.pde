class Barrier {
  float x, y, lp;
  color c;
  
  Barrier(float posX) {
    c = color(255);
    x = posX;
    y = height/4*3;
    lp = 100;
  }
  
  void show() {
    fill(c);
    noStroke();
    rectMode(CENTER);
    rect(x, y, lp*2, lp);
  }
  
  void dano() {
    
    if (lp > 10) {
      lp -= 10;
    }
    
    if (lp == 10) {
      lp = 0;
    }
    
    c = color(0, 255, 0);
    println("diminui");
    println(lp);
    hitw.play();
    hitw.rewind();
  }
}
