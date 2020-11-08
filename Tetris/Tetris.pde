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
boolean buttonn2 = false;
boolean buttonn3 = false;
boolean buttonn4 = false;
boolean buttonn5 = false;

boolean buttont1 = false;
boolean buttont2 = false;
boolean buttont3 = false;

int x=225; //posición inicial rectangulo 
int y=100; //altura 
int w=100; // width


void botones_inicio() {
  push();
  if (!buttonn2) {
    fill(0);
    stroke(175);
    rect(x, y*1.5, w, w, 10);
  }
  if (!buttonn3) {
    fill(0);
    stroke(175);
    rect(x+150, y*1.5, w, w, 10);
  }
  if (!buttonn4) {
    fill(0);
    stroke(175);
    rect(x+300, y*1.5, w, w, 10);
  }
  if (!buttonn5) {
    fill(0);
    stroke(175);
    rect(x+450, y*1.5, w, w, 10);
  }
  if (!buttont1) {
    fill(0);
    stroke(175);
    rect(x+75, 3*y, w, w, 10);
  }
  if (!buttont2) {
    fill(0);
    stroke(175);
    rect(x+75+150, 3*y, w, w, 10);
  }
  if (!buttont3) {
    fill(0);
    stroke(175);
    rect(x+75+300, 3*y, w, w, 10);
  }  
  ////////////////////////////////////////////////////////////////////

  if (buttonn2) {
    fill(175);
    stroke(0);
    rect(x, y*1.5, w, w, 10);
  } else if (buttonn3) {
    fill(175);
    stroke(0);
    rect(x+150, y*1.5, w, w, 10);
  } else if (buttonn4) {
    fill(175);
    stroke(0);
    rect(x+300, y*1.5, w, w, 10);
  } else if (buttonn5) {
    fill(175);
    stroke(0);
    rect(x+450, y*1.5, w, w, 10);
  } 
  if (buttont1) {
    fill(175);
    stroke(0);
    rect(x+75, 3*y, w, w, 10);
  } else if (buttont2) {
    fill(175);
    stroke(0);
    rect(x+225, 3*y, w, w, 10);
  } else if (buttont3) {
    fill(175);
    stroke(0);
    rect(x+375, 3*y, w, w, 10);
  } else {
    fill(0);
    stroke(175);
    rect(x, y*1.5, w, w, 10);
    rect(x+150, y*1.5, w, w, 10);
    rect(x+300, y*1.5, w, w, 10);
    rect(x+450, y*1.5, w, w, 10);
    rect(x+75, 3*y, w, w, 10);
    rect(x+225, 3*y, w, w, 10);
    rect(x+375, 3*y, w, w, 10);
  }
  pop();
}

void mousePressed() {
  if ((mouseX > x) && (mouseX< x+w)&&(mouseY >y*1.5 )&&(mouseY < y*1.5 +w)) {
    if (!buttonn2) { // si el boton esta apagado
      buttonn2 = true ; // se prende el boton presionado
      buttonn3 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn5 = false;
      nminos=2;
      eleccion =true;
    }
  }
  if ((mouseX > x+150) && (mouseX< x+150+w)&&(mouseY >y*1.5 )&&(mouseY < y*1.5 +w)) {
    if (!buttonn3) { // si el boton esta apagado
      buttonn3 = true; // se prende el boton presionado
      buttonn2 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn5 = false;
      nminos=3;
      eleccion =true;
    }
  }
  if ((mouseX > x+300) && (mouseX< x+300+w)&&(mouseY >y*1.5 )&&(mouseY < y*1.5 +w)) {
    if (!buttonn4) { // si el boton esta apagado
      buttonn4 = true; // se prende el boton presionado
      buttonn3 = false;
      buttonn2 = false;// todos los demás botone se apagan
      buttonn5 = false;
      nminos=4;
      eleccion =true;
    }
  }
  if ((mouseX > x+450) && (mouseX< x+450+w)&&(mouseY >y*1.5 )&&(mouseY < y*1.5 +w)) {
    if (!buttonn5) { // si el boton esta apagado
      buttonn5 = true; // se prende el boton presionado
      buttonn3 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn2 = false;
      nminos=5;
      eleccion =true;
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////
  if ((mouseX > x+75) && (mouseX< x+75+w)&&(mouseY >y*3 )&&(mouseY < y*3 +w)) {
    if (!buttont1) { // si el boton esta apagado
      buttont1 = true; // se prende el boton presionado
      buttont2 = false;
      buttont3 = false;// todos los demás botone se apagan
      tipo = 1;
      eleccion =true;
    }
  }
  if ((mouseX > x+225) && (mouseX< x+225+w)&&(mouseY >y*3 )&&(mouseY < y*3 +w)) {
    if (!buttont2) { // si el boton esta apagado
      buttont2 = true; // se prende el boton presionado
      buttont1 = false;
      buttont3 = false;// todos los demás botone se apagan
      tipo=2;
      eleccion =true;
    }
  }
  if ((mouseX > x+375) && (mouseX< x+375+w)&&(mouseY >y*3 )&&(mouseY < y*3 +w)) {
    if (!buttont3) { // si el boton esta apagado
      buttont3 = true; // se prende el boton presionado
      buttont2 = false;
      buttont1 = false;// todos los demás botone se apagan
      tipo=3;
      eleccion =true;
    }
  }
}
void inicio() {

  push();
  background(0, 14, 56);
  image(fondo1, 0, 0, width, height);
  translate(width/2, height*3/4);
  textFont(f);
  textAlign(CENTER, CENTER);

  stroke(75, 54, 33);
  strokeWeight(5);
  fill(255, 230, 0);
  rectMode(CENTER);
  rect(0, 4, 240, 70, 10);

  fill(0, 0, 255);
  textSize(20);
  text("Press ENTER to start", 0, 0);
  pop();

  botones_inicio();
  //eleccion();
  push();
  forma3.display(1, x-32, y*1.75, 0, 1, 3, 2, tipo);
  forma4.display(3, x+110, y*1.5, 0, 1, 3, 3, tipo);
  forma5.display(5, x+245, y*1.75, 0, 1, 3, 4, tipo);
  forma6.display(20, x+375, y*1.4, 0, 1, 3, 5, tipo);
  noFill();
  stroke(255);
  rect(x+75+w/2-forma1.ancho, 3*y+w/2-forma1.largo, forma1.ancho*2, forma1.largo*2);
  triangle(x+225+w/2-forma1.ancho, 3*y+w/2+forma1.ancho, x+225+forma1.ancho+w/2-forma1.ancho, 3*y-2*forma1.largo+w/2+forma1.ancho, x+225+2*forma1.ancho+w/2-forma1.ancho, 3*y+w/2+forma1.ancho);
  ellipse(x+375+w/2, 3*y+w/2, forma1.ancho*2, forma1.largo*2);
  pop();
} 


void pausa() {
  startgame=false;
  push();
  background(0, 14, 56, 10);
  rectMode(CENTER);
  rect(0, 4, 240, 70, 10);
  fill(255);
  textSize(30);
  text("PAUSE", 0, 0);


  pop();
}

void marcadores() {

  background(0, 14, 56);
  push();
  textAlign(CENTER, 0);
  fill(0, 255, 0);
  push();
  translate(480, 40);
  textSize(20);
  text("Next figure", 0, 0);
  pop();
  translate(width*10/13.3, height/2);
  textFont(f);


  stroke(75, 54, 33);
  strokeWeight(5);
  fill(255, 230, 0);
  rectMode(CENTER);
  rect(0, 4, 200, 70, 10);

  fill(0, 0, 255);
  textSize(20);
  text("Nivel: "+nivel, 0, 0);

  translate(0, height/4);

  fill(255, 50, 0);
  rect(0, 4, 150, 150, 10);

  fill(0, 0, 255);
  textSize(20);
  text("Score", 0, -20);
  textSize(40);
  text(puntaje, 0, 20);

  pop();
}



void gameOver() {
  background(0, 14, 56);
  push();
  translate(width*0.75, height/5);
  textFont(f);
  textAlign(CENTER, CENTER);

  stroke(75, 54, 33);
  strokeWeight(5);
  fill(255, 240, 0);
  rectMode(CENTER);
  rect(0, 0, 240, 70, 10);

  fill(40);
  textSize(35);
  text("GAME OVER", 0, 0);

  fill(255, 50, 0);
  translate(0, height/4);
  rect(0, 4, 310, 130, 10);

  fill(40);
  textSize(34.5);
  text("Your score was", 0, -20);
  text(puntaje, 0, 35);
  //
  fill(255, 230, 00);
  translate(0, height/4);
  rect(0, 40, 350, 80, 10);

  fill(40);
  textSize(30.5);
  text("¡Try Again!", 0, 20);
  text("Press Enter", 0, 50);
  if (controlsave) {
    saveData("Carlos", puntaje);
    controlsave = !controlsave;
  }
  

  pop();

showpuntajes();
}

void showpuntajes() {
  push();
  //translate(width/4, height/4);
  textFont(f);
  textAlign(CENTER, CENTER);

  stroke(75, 54, 33);
  strokeWeight(5);
  fill(255, 240, 0);
  rectMode(CORNER);
  rect(50, 50, 450,height-100, 10);

  fill(40);
  textSize(35);

  JSONArray scores = loadData();
  for (int i = 0; i<5; i++) {
    JSONObject persona = scores.getJSONObject(i);
    int puntajem = persona.getInt("puntaje");
    String nombre = persona.getString("nombre");
    text("nombre: "+nombre, 250, 100+100*i);
    text("puntaje: "+puntajem,250, 150+100*i);
  }

  pop();
}

color [] colores= {  
  color(234, 230, 202), //Borde---0
//n=2
  color(9, 239, 230), //green-----1-d
//n=3
  color(12, 12, 230),//blue------2-t1
  color(230, 230, 9), //yellow----3-t3
//n=4
  color(128, 12, 128), //purple---4-T
  color(230, 12, 12), //red-------5-Z
  color(12, 230, 12), //green-----6-S
  color(9, 239, 230), //cyan------7-I
  color(230, 230, 9), //yellow----8-O
  color(230, 128, 9), //orange----9-L
  color(12, 12, 230),//blue------10-J
//n=5  
  color(128, 12, 128), //purple---11-p1
  color(230, 12, 12), //red-------12-p2
  color(12, 230, 12), //green-----13-p3
  color(9, 239, 230), //cyan------14-p4
  color(230, 230, 9),//yellow----15-p5
  color(230, 128, 9),//orange----16-p6
  color(12, 12, 230),//blue------17-p7
  color(128, 12, 128), //purple---18-p8
  color(230, 12, 12), //red-------19-p9
  color(12, 12, 230), //green-----20-p10
  color(9, 239, 230), //cyan------21-p11
  color(230, 230, 9),//yellow----22-p12
  color(230, 128, 9),//orange----23-p13
  color(12, 12, 230),//blue------24-p14
  color(128, 12, 128), //purple---25-p15
  color(230, 12, 12), //red-------26-p16
  color(12, 230, 12), //green-----27-p17
  color(9, 239, 230) //cyan------28-p18
};

//n=2

int [] d ={10,12,10,12};

//n=3
int [] t1={146,56,146,56};
int [] t2={50,22,38,52};
//n=4

int [] T = {58368, 19520, 19968, 35968};
int [] Z = {50688, 19584, 50688, 19584};
int [] S = {27648, 35904, 27648, 35904};
int [] I = {3840, 17476, 61440, 17476};
int [] O = {26112, 26112, 26112, 26112};
int [] L = {59392, 50240, 11776, 35008};
int [] J = {57856, 17600, 36352, 51328};

//n=5

int [] p1 = {8659208,1015808,8659208,1015808};
int [] p2 = {209024 ,145472 ,137600 ,276608 };
int [] p3 = {399488 ,80000  ,143552 ,145664 };
int [] p4 = {4329856,555008 ,6426752,15392  };
int [] p5 = {4329664,31232 ,12718208,48128  };
int [] p6 = {405632 ,210944,137408  ,14720  };
int [] p7 = {202880 ,14528 ,143744  ,407552 };
int [] p8 = {4337920,800768,4595968 ,923648 };
int [] p9 = {4331584,241664,4393024 ,112640 };
int [] p10 = {462976, 79936, 135616, 276736};
int [] p11 = {342016, 200896, 468992, 397696};
int [] p12 = {68032, 270784, 467200, 460864};
int [] p13 = {72064, 274624, 209152, 399424};
int [] p14 = {145536, 145536, 145536, 145536};
int [] p15 = {4591744, 5177344, 4331648, 991232};
int [] p16 = {4395136, 987136, 4337792, 9371648};
int [] p17 = {201088,276544,201088,276544};
int [] p18 = {397504,80128,397504, 80128};


int[][] fig={d,t1,t2,T,Z,S,I,O,L,J,p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18};
