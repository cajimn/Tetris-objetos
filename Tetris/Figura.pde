class Figura {

  float largo;
  float ancho;
  int rot_actual = 2;
  int rot_anterior = 1;
  int n;

  int [] figura;

  Figura(int nminos, float escala) {
    largo=(630/(tablero.filas))*escala;
    ancho=(315/tablero.columnas)*escala;
    n=nminos;
  }


  void bajar() {
    if (millis() - timerPaso >= intervaloPaso) {
      tablero.darPaso();
      timerPaso = millis();
      niveles();
    }
    if (millis() - timerFilaCompleta >= intervaloFilaCompleta) {
      tablero.filasCompletas();
      timerFilaCompleta = millis();
    }
  }

  boolean colisionIzquierda() {
    int posMX;
    int posMY;
    for (int j = 0; j < n; j++)
    {
      for (int i = j; i < n*n; i += n) {
        if ((figura[rot_actual] & (1 << (n*n)-1 - i)) != 0) {
          posMX = (i%n) + tablero.pos_inicialX;
          posMY = ((i/n)|0) + tablero.pos_inicialY;
          if (grid.get(posMY)[posMX-1] != 0)
            return true;
        }
      }
    }
    return false;
  }

  boolean colisionDerecha() {
    int posMX;
    int posMY;
    for (int j = 0; j < n; j++)
    {
      for (int i = j; i < n*n; i += n) {
        if ((figura[rot_actual] & (1 << i)) != 0) {
          posMX = (((n*n)-1-i)%n) + tablero.pos_inicialX;
          posMY = ((((n*n)-1-i)/n)|0) + tablero.pos_inicialY;
          if (grid.get(posMY)[posMX+1] != 0)
            return true;
        }
      }
    }
    return false;
  }

  boolean colisionAbajo() {
    int posMX;
    int posMY;
    for (int i = 0; i < n*n; i ++) {
      if ((figura[rot_actual] & (1 << i)) != 0) {
        posMX = (((n*n)-1-i)%n) + tablero.pos_inicialX;            //columnas
        posMY = (floor(((n*n)-1-i)/n)) + tablero.pos_inicialY;     //filas
        if (grid.get(posMY+1)[posMX] != 0) {
          return true;
        }
      }
    }
    return false;
  }

  boolean colisionRotacion() {
    int posMX;
    int posMY;
    for (int i = 0; i <= (n*n)-1; i++) {
      if ((figura[rot_actual] & (1 << (n*n)-1 - i)) != 0) {
        posMX = (i%n) + tablero.pos_inicialX;
        posMY = (floor(i/n)) + tablero.pos_inicialY;
        if (grid.get(posMY)[posMX] != 0) 
          return true;
      }
    }
    return false;
  }

  void nueva() {
    int posMX;
    int posMY;
    for (int i = 0; i <= (n*n)-1; i++) {
      if ((figura[rot_actual] & (1 << (n*n)-1 - i)) != 0) {
        puntaje +=1;
        posMX = (i%n) + tablero.pos_inicialX;
        posMY = (floor(i/n)) + tablero.pos_inicialY;
        grid.get(posMY)[posMX] = colores[num1];
      }
    }
    resetVariables();
  }
  void display(int numero, int x, int y, int mov, int tr, int r) {
    
    fill(colores[numero], 150*r);
    figura = fig[numero-1];
    push();
    translate(x, y);
    stroke(50);    
    for (int i = 0; i <= (n*n)-1; i++) {
      if ((figura[rot_actual] & (1 << (n*n)-1 - i)) != 0) {
        tablero.posX = (i%n)*ancho + tablero.pos_inicialX*ancho*mov+(ancho+50)*tr;
        tablero.posY = (floor(i/n)) * largo + tablero.pos_inicialY*largo*mov+largo*tr-largo;
        rect(tablero.posX, tablero.posY, ancho, largo, 2);
      } /*else {
       tablero.posX = (i%n)*ancho + pos_inicialX*ancho;
       tablero.posY = (floor(i/n)) * largo + pos_inicialY*largo;
       push();
       fill(colores[0]);
       rect(tablero.posX, tablero.posY, ancho, largo);
       pop();
       }*/
    }
    pop();
    niveles();
  }
}
