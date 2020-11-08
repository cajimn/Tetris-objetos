import processing.sound.*;
SoundFile file;
PImage fondo1;

Forma forma1;
Forma forma2;

Forma forma3;
Forma forma4;
Forma forma5;
Forma forma6;

Tablero tablero;

ArrayList<color[]> grid = new ArrayList<color[]>();

int nminos=5;//tamaño de tablero 
int tipo=1;

int n3=int(random (2, 4));
int n4=int(random (4, 11));
int n5=int(random (11, 29));

int[] numero ={1, n3, n4, n5};

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
boolean eleccion =false;
boolean controlsave = true;
boolean startgame = false;
boolean gameOverBool = false;
boolean mostrarpuntajes = false;

//Niveles
int puntaje=0;
int nivel=1;


void setup() {
  size(1000, 650);
  background(0, 14, 56);
  file = new SoundFile(this, "Tetris.mp3");
  file.amp(0.1);
  file.play();
  fondo1=loadImage("fondo1.jpg");
  tablero= new Tablero(12+j, 7+(j/2));
  forma1= new Forma(1);
  forma2= new Forma(1.2);
  forma3= new Forma(1);
  forma4= new Forma(1);
  forma5= new Forma(1);
  forma6= new Forma(1);


  tablero.reset();

  //printArray(PFont.list());
  f = createFont("Consolas Bold", 24);
}

void draw() {

  inicio();

  if (startgame) {
    marcadores();    

    if (!gameOverBool) { 
      tablero.display(tipo);
      forma1.display(num1, 0, 0, 1, 0, 1, nminos, tipo);
      forma2.display(num2, 350, 75, 0, 1, 3, nminos, tipo);
      forma1.bajar();
      imprimirArrayList();
    } else {      
        gameOver();      
    }
  }
}

void keyPressed() {
  if (keyCode == ENTER) {
    startgame =true;
    controlsave = true;
  }
  if (!gameOverBool) {
    if (key == 'a' || keyCode == LEFT) {
      if (!forma1.colisionIzquierda()) 
        tablero.pos_inicialX--;
    } else if (key == 'd' || keyCode == RIGHT) {
      if (!forma1.colisionDerecha()) 
        tablero.pos_inicialX++;
    } else if (key == 's' || keyCode == DOWN) {
      if (!forma1.colisionAbajo()) 
        tablero.darPaso();
      puntaje+=1;
    } else if (key == ' ') {
      if (!forma1.colisionAbajo()) {
        tablero.darPaso();
        push();
        if (!forma1.colisionAbajo()) {
          timerPaso=10;
        }
        pop();
      }
    } else if (key == 'w' || keyCode == UP) {
      forma1.rot_anterior = forma1.rot_actual;
      forma1.rot_actual = (forma1.rot_actual + 1)%4;
      // Agregada esta condición para evitar bugs en las rotaciones cerca de un borde.
      if (forma1.colisionRotacion()) forma1.rot_actual = forma1.rot_anterior;
    } else if (key=='p') startgame=false;
  } else {
    if (key == 's') mostrarpuntajes=true;
    if (keyCode == ENTER) {
      forma1.nueva();
      tablero.reset();      
      resetMarcadores();
    }
  }
}

JSONArray loadData() {
  JSONObject json = loadJSONObject("data/Puntajes.json");
  JSONArray scores = json.getJSONArray("Top");
  return scores;
}

void saveData(String nombre, int puntaje) {
  JSONObject json;
  JSONArray scores = loadData();
  for (int i = 0; i<scores.size(); i++) {
    JSONObject persona = scores.getJSONObject(i);
    int puntajem = persona.getInt("puntaje");
    if (puntaje>puntajem) {
      String nombretemp = persona.getString("nombre");
      int puntajetemp = persona.getInt("puntaje");
      persona.setInt("puntaje", puntaje);
      persona.setString("nombre", nombre);
      nombre = nombretemp;
      puntaje=puntajetemp;
    }
  }
  json= new JSONObject(); 
  json.setJSONArray("Top", scores);
  saveJSONObject(json, "data/Puntajes.json");
}

void niveles() {
  int j=1;
  for (int i=0; i<=20; i++) {    
    if (puntaje >=j*300) {
      j++;
      nivel=j;      
      timerPaso-=20;
    }
  }
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
