class bullet{
  int x,i=height,y=0;
  bullet(int ox){
    x=ox;
  }
  void desenha(){
    fill(255);
    noStroke();
    ellipse(x, i, 10, 10);
    i=i-10;
  }
}
