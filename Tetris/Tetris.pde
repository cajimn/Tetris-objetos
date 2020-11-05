color[] colores = {
  color(234, 230, 202), //Borde---0
  color(128, 12, 128), //purple---1-T
  color(230, 12, 12), //red-------2-Z
  color(12, 230, 12), //green-----3-S
  color(9, 239, 230), //cyan------4-I
  color(230, 230, 9), //yellow----5-O
  color(230, 128, 9), //orange----6-L
  color(12, 12, 230)};//blue------7-J

Figura figure;
Figura figure2;
Tablero tablero;

ArrayList<color[]> grid = new ArrayList<color[]>();

int num2 = int(random (0, 7));
int num1 = int(random (0, 7));  

// contadores e Intervalos.
int timerPaso;
int intervaloPaso = 1000;
int timerFilaCompleta;
int intervaloFilaCompleta = 10;

// Fuente para letreros
PFont f;

// banderas
boolean startgame = false;
boolean gameOverBool = false;

//Niveles
int puntaje=0;
int nivel=1;

void setup() {
  size(504, 504); 
  tablero= new Tablero(22, 12);
  figure= new Figura();
  figure2= new Figura();

  tablero.reset(); 
  //printArray(PFont.list());
  f = createFont("Consolas Bold", 24);
}

void draw() {

  inicio();

  if (startgame) {
    marcadores();    

    if (!gameOverBool) {
      tablero.display();      
      figure.display(num1,0,1,2,1,0,1);
      figure2.display(num2,265,0,0,0,1,3);
      figure.bajar();  
      //imprimirArrayList();
    } else {
      gameOver();
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    startgame =true;
  }
  if (!gameOverBool) {
    if (key == 'a' || keyCode == LEFT) {
      if (!figure.colisionIzquierda()) 
        tablero.pos_inicialX--;
    } else if (key == 'd' || keyCode == RIGHT) {
      if (!figure.colisionDerecha()) 
        tablero.pos_inicialX++;
    } else if (key == 's' || keyCode == DOWN) {
      if (!figure.colisionAbajo()) 
        tablero.darPaso();
      puntaje+=1;
    } else if (key == ' ') {
      if (!figure.colisionAbajo()) {
        tablero.darPaso();
        push();
        if (!figure.colisionAbajo()) {
          timerPaso=10;
        }
        pop();
      }
    } else if (key == 'w' || keyCode == UP) {
      figure.rot_anterior = figure.rot_actual;
      figure.rot_actual = (figure.rot_actual + 1)%4;
      // Agregada esta condición para evitar bugs en las rotaciones cerca de un borde.
      if (figure.colisionRotacion()) figure.rot_actual = figure.rot_anterior;
    }
  } else {
    if (keyCode == ENTER) {
      tablero.reset();
      resetVariables();
      resetMarcadores();
    }
  }
}

void resetVariables() {
  num1 = num2;
  num2=int(random(0, 7));
  figure.rot_actual = 2;
  tablero.pos_inicialX = 4;
  tablero.pos_inicialY = 0;
  gameOverBool = false;
  timerPaso = millis();
  timerFilaCompleta = millis();
}

void resetMarcadores() {
  puntaje=0;
  nivel=1;
}

/*void imprimirArrayList() {
 for (int i = 0; i < filas; i++) {
 for (int j = 0; j < columnas; j++) {
 print(grid.get(i)[j] + " ");
 }
 println();
 }
 }*/
