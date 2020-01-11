class Barrier {
  int x=width/2, y=height/2, lp;
  color c;
  Barrier() {
    c=color(255);
    lp=40;
  }
  void show() {
    fill(c);
    noStroke();
    rect(x, y, lp, lp);
  }
  void dano() {
    lp=lp-10;
    c=color(0, 255, 0);
    println("diminui");
    //dá a mensagem que chega aqui mas não faz mudanças
  }
}
