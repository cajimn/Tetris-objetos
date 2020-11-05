class Tablero {

  float posX;
  float posY;
  int pos_inicialX;
  int pos_inicialY; 
  int columnas;
  int filas;

  Tablero(int f, int c) {
    pos_inicialX=4;
    pos_inicialY=0;
    columnas=c;
    filas=f;
    
  }

  void display() {
    push();
    stroke(0);
    strokeWeight(2);
    translate(0, -figure.largo);
    for (int i=0; i < filas; i++) {
      push();
      stroke(0);
      strokeWeight(1);
      line(0, i*figure.largo, width/2, i*figure.largo);
      pop();
      for (int j=0; j < columnas; j++) {
        push();
        stroke(0);
        strokeWeight(1);
        line(j*figure.ancho, 0, j*figure.ancho, height);
        pop();
        if (j == 0 || j == columnas - 1 || i == filas - 1) {
          fill(colores[0]);
          rect(j*figure.ancho, i*figure.largo, figure.ancho, figure.largo, 4);
        } else if (grid.get(i)[j] != 0) {
          fill(grid.get(i)[j]);
          rect(j*figure.ancho, i*figure.largo, figure.ancho, figure.largo, 4);
        }
      }
    }
    pop();
  }

  void darPaso() {
    if (!figure.colisionAbajo()) {
      pos_inicialY++;
    } else {
      int i;
      for (i = 1; i < (columnas - 1)  &&  grid.get(1)[i] == 0; i++) {
      }
      gameOverBool = i < (columnas - 1);
      if (!gameOverBool) { 
        figure.nueva();
      }
    }
  }

  void filasCompletas() {
    for (int i = filas - 2; i >= 0; i--) {
      int j = 0;
      for (j = 1; (j < 11) && (grid.get(i)[j] != 0); j++) {
      }
      if (j == 11) {
        puntaje += 50;
        grid.remove(i);
        grid.add(0, new color[columnas]);
        grid.get(0)[0] = colores[0];
        grid.get(0)[columnas-1] = colores[0];
      }
    }
  }


  void reset() {
    grid = new ArrayList<color[]>();
    // ArrayList de arrays con ceros en sus elementos.
    for (int k = 0; k < filas; k++) {
      grid.add(new color[columnas]);
    }
    //imprimirArrayList();
    for (int i = 0; i < filas; i++) {
      for (int j = 0; j < columnas; j++) {
        if (j == 0 || j == columnas - 1 || i == filas - 1)
          grid.get(i)[j] = colores[0];
      }
    }
  }
}
