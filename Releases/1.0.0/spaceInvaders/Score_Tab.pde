class Score {
  float value;
  
  Score() {
    value = 0;
  }
  
  void show(){
    textSize(14);
    textAlign(RIGHT);
    fill(255);
    text("Score: " + value, width, 14);
  }
  
  void AddValue(float v) {
    if(v != -1) {
      value += v;
    } else {
      value = 0;
    }
  }
}
