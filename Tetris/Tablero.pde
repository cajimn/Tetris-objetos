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

  void display(int tipo) {
    
    push();
    strokeWeight(2);
    translate(0, -forma1.largo);
    for (int i=0; i < filas; i++) {
      for (int j=0; j < columnas; j++) {

        push();        
        stroke(100);
        strokeWeight(1);

        if (tipo==1) {
          line(forma1.ancho, i*forma1.largo, j*forma1.ancho, i*forma1.largo);//horizontales
          line(j*forma1.ancho, 0, j*forma1.ancho, i*forma1.largo);//verticales
        } else if (tipo ==2) {            
          noFill();  
          triangle(j*forma1.ancho, i*forma1.largo+forma1.largo, j*forma1.ancho+forma1.ancho/2, i*forma1.largo, j*forma1.ancho+forma1.ancho, i*forma1.largo+forma1.largo);
        }


        pop();
        if (j == 0 || j == columnas - 1 || i == filas - 1) {
          fill(colores[0]);
          rect(j*forma1.ancho, i*forma1.largo, forma1.ancho, forma1.largo, 2);
        } else if (grid.get(i)[j] != 0 && tipo==1) {
          fill(grid.get(i)[j]);
          rect(j*forma1.ancho, i*forma1.largo, forma1.ancho, forma1.largo, 2);
        } else if (grid.get(i)[j] != 0 && tipo==2) {
          fill(grid.get(i)[j]);
          triangle(j*forma1.ancho, i*forma1.largo+forma1.largo, j*forma1.ancho+forma1.ancho/2, i*forma1.largo, j*forma1.ancho+forma1.ancho, i*forma1.largo+forma1.largo);//triangle(posX, posY+largo, posX+ancho/2, posY, posX+ancho, posY+largo);
        }
      }
    }
    pop();
  }

  void darPaso() {
    if (!forma1.colisionAbajo()) {
      pos_inicialY++;
    } else {
      int i;
      for (i = 1; i < (columnas - 1)  &&  grid.get(1)[i] == 0; i++) {
      }
      gameOverBool = i < (columnas - 1);
      if (!gameOverBool) { 
        forma1.nueva();
      }
    }
  }

  void filasCompletas() {
    for (int i = filas - 2; i >= 0; i--) {
      int j = 0;
      for (j = 1; (j < columnas-1) && (grid.get(i)[j] != 0); j++) {
      }
      if (j == columnas-1) {
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
