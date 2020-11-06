Figura figure;
Figura figure2;
Tablero tablero;
//ultimo
ArrayList<color[]> grid = new ArrayList<color[]>();

int nminos=4;

int n3=int(random (2, 4));
int n4=int(random (4, 11));
int n5=int(random (11, 29));

int[] numero ={1,n3,n4,n5};

int num1 = numero[nminos-2];
int num2 = numero[nminos-2];

int j=10+(nminos-4)*5;

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
  size(650, 650);
  background(0, 14, 56);
  tablero= new Tablero(12+j, 7+(j/2));
  figure= new Figura(nminos,1);
  figure2= new Figura(nminos,1.2);

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
      figure.display(num1, 0  , 0, 1, 0, 1);
      figure2.display(num2, 350, 75, 0, 1, 3);
      figure.bajar();  
      imprimirArrayList();
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
  if(nminos==3){
    num2=int(random(2, 4));
  } else if(nminos==4){
    num2=int(random(4, 11));
  } else if(nminos==5){
    num2=int(random(11, 29));
  }
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

void imprimirArrayList() {
  for (int i = 0; i < tablero.filas; i++) {
    for (int j = 0; j < tablero.columnas; j++) {
      print(grid.get(i)[j] + " ");
    }
    println();
  }
}
