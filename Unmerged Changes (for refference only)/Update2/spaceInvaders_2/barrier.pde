class Barrier {
  int x=width/2, y=height/2, lp;
  color c;
  Barrier() {
    c=color(255);
  }
  void show(int p) {
    lp=p;
    fill(c);
    noStroke();
    rect(x, y, p, p);
  }
  void dano() {
    if (lp>0) {
      lp=lp-10;
    }
    c=color(0, 255, 0);
    println("diminui");
    println(lp);
    hitw.play();
    hitw.rewind();
    //dá a mensagem que chega aqui mas não faz mudanças
  }
}
