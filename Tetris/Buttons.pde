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
