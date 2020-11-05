class Figura {
  
  float largo;
  float ancho;
  int rot_actual = 2;
  int rot_anterior = 1;
  
  int [] figura;

  Figura() {
    largo=height/(tablero.filas-1);
    ancho=252/tablero.columnas;
  }
  void display(int numero, int x, int y, int stroke, int mov, int tr, int r) {
    switch (numero) {
    case 0:
      fill(colores[1], 80*r);
      figura = T;   
      break;
    case 1:
      fill(colores[2], 80*r);
      figura = Z;
      break;
    case 2:
      fill(colores[3], 80*r);
      figura = S;
      break;
    case 3:
      fill(colores[4], 80*r);
      figura = I;
      break;
    case 4:
      fill(colores[5], 80*r);
      figura = O;
      break;
    case 5:
      fill(colores[6], 80*r);
      figura = L;
      break;
    case 6:
      fill(colores[7], 80*r);
      figura = J;
      break;
    }

    push();
    translate(x, -largo*y+25);//(0, -largo)
    stroke(stroke);
    strokeWeight(2);
    for (int i = 0; i <= 15; i++) {
      if ((figura[rot_actual] & (1 << 15 - i)) != 0) {
        tablero.posX = (i%4)*ancho + tablero.pos_inicialX*ancho*mov+(ancho+50)*tr;
        tablero.posY = (floor(i/4)) * largo + tablero.pos_inicialY*largo*mov+largo*tr-largo;
        rect(tablero.posX, tablero.posY, ancho, largo, 4);
      } /*else {
       tablero.posX = (i%4)*ancho + pos_inicialX*ancho;
       tablero.posY = (floor(i/4)) * largo + pos_inicialY*largo;
       push();
       fill(colores[0]);
       rect(tablero.posX, tablero.posY, ancho, largo);
       pop();
       }*/
    }
    pop();
    niveles();
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
    for (int j = 0; j < 4; j++)
    {
      for (int i = j; i < 16; i += 4) {
        if ((figura[rot_actual] & (1 << 15 - i)) != 0) {
          posMX = (i%4) + tablero.pos_inicialX;
          posMY = ((i/4)|0) + tablero.pos_inicialY;
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
    for (int j = 0; j < 4; j++)
    {
      for (int i = j; i < 16; i += 4) {
        if ((figura[rot_actual] & (1 << i)) != 0) {
          posMX = ((15-i)%4) + tablero.pos_inicialX;
          posMY = (((15-i)/4)|0) + tablero.pos_inicialY;
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
    for (int i = 0; i < 16; i ++) {
      if ((figura[rot_actual] & (1 << i)) != 0) {
        posMX = ((15-i)%4) + tablero.pos_inicialX;            //columnas
        posMY = (floor((15-i)/4)) + tablero.pos_inicialY;     //filas
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
    for (int i = 0; i <= 15; i++) {
      if ((figura[rot_actual] & (1 << 15 - i)) != 0) {
        posMX = (i%4) + tablero.pos_inicialX;
        posMY = (floor(i/4)) + tablero.pos_inicialY;
        if (grid.get(posMY)[posMX] != 0) 
          return true;
      }
    }
    return false;
  }

  void nueva() {
    int posMX;
    int posMY;
    for (int i = 0; i <= 15; i++) {
      if ((figura[rot_actual] & (1 << 15 - i)) != 0) {
        puntaje +=1;
        posMX = (i%4) + tablero.pos_inicialX;
        posMY = (floor(i/4)) + tablero.pos_inicialY;
        grid.get(posMY)[posMX] = colores[num1+1];
      }
    }
    resetVariables();
  }
}
