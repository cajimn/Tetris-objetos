class Forma {

  float largo;
  float ancho;
  int rot_actual = 2;
  int rot_anterior = 1;
  int n;
  int [] figura;
  int shape;

  Forma(float escala) {
    largo=(630/(tablero.filas))*escala;
    ancho=(315/tablero.columnas)*escala;

  }
  

  void display(int numero, int x, float y, int mov, int tr, int r, int nms, int tips) {
    n=nms;
    shape = tips;
    fill(colores[numero], 150*r);
    figura = fig[numero-1];
    push();
    translate(x, y);
    stroke(50);
    for (int i = 0; i <= (n*n)-1; i++) {
      if ((figura[rot_actual] & (1 << (n*n)-1 - i)) != 0) {
        tablero.posX = (i%n)*ancho + tablero.pos_inicialX*ancho*mov+(ancho+50)*tr;
        tablero.posY = (floor(i/n)) * largo + tablero.pos_inicialY*largo*mov+largo*tr-largo;        
        if (shape==1) {          
          rect(tablero.posX, tablero.posY, ancho, largo, 2);
        } else if (shape==2) {
          triangle(tablero.posX, tablero.posY+largo, tablero.posX+ancho/2, tablero.posY, tablero.posX+ancho, tablero.posY+largo);
        } else if (shape==3) {      
          ellipse(tablero.posX+ancho/2, tablero.posY+largo/2, ancho, largo);
        }
      }
      /*else {
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
  num1 = num2;
  if (nminos==3) {
    num2=int(random(2, 4));
  } else if (nminos==4) {
    num2=int(random(4, 11));
  } else if (nminos==5) {
    num2=int(random(11, 29));
  }
  rot_actual = 2;
  tablero.pos_inicialX = 4;
  tablero.pos_inicialY = 0;
  gameOverBool = false;
  timerPaso = millis();
  timerFilaCompleta = millis();
}

}
