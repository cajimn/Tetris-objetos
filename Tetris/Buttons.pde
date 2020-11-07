boolean buttont1 = false;
boolean buttont2 = false;

boolean buttonn2 = false;
boolean buttonn3 = false;
boolean buttonn4 = false;
boolean buttonn5 = false;

boolean buttonPressedI = false;

int x=52; //posición inicial rectangulo 
int y=100; //altura 
int w=100; // width


void botones_inicio() {
  push();
  if (!buttonn2) {
    fill(0);
    stroke(0);
    rect(x, y, w, w, 10);
  }
  if (!buttonn3) {
    fill(0);
    stroke(0);
    rect(x+150, y, w, w, 10);
  }
  if (!buttonn4) {
    fill(0);
    stroke(0);
    rect(x+300, y, w, w, 10);
  }
  if (!buttonn5) {
    fill(0);
    stroke(0);
    rect(x+450, y, w, w, 10);
  }
  if (buttonn2) {
    fill(175);
    stroke(0);
    rect(x, y, w, w, 10);
  } else if (buttonn3) {
    fill(175);
    stroke(0);
    rect(x+150, y, w, w, 10);
  } else if (buttonn4) {
    fill(175);
    stroke(0);
    rect(x+300, y, w, w, 10);
  } else if (buttonn5) {
    fill(175);
    stroke(0);
    rect(x+450, y, w, w, 10);
  } else {
    fill(0);
    stroke(255);
    rect(x, y, w, w, 10);
    rect(x+150, y, w, w, 10);
    rect(x+300, y, w, w, 10);
    rect(x+450, y, w, w, 10);
  }





  pop();
}

void mousePressed() {
  if ((mouseX > x) && (mouseX< x+w)&&(mouseY >y )&&(mouseY < y +w)) {
    if (!buttonn2) { // si el boton esta apagado
      buttonn2 = true; // se prende el boton presionado
      buttonn3 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn5 = false;
    }
  }
  if ((mouseX > x+150) && (mouseX< x+150+w)&&(mouseY >y )&&(mouseY < y +w)) {
    if (!buttonn3) { // si el boton esta apagado
      buttonn3 = true; // se prende el boton presionado
      buttonn2 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn5 = false;
    }
  }
  if ((mouseX > x+300) && (mouseX< x+300+w)&&(mouseY >y )&&(mouseY < y +w)) {
    if (!buttonn4) { // si el boton esta apagado
      buttonn4 = true; // se prende el boton presionado
      buttonn3 = false;
      buttonn2 = false;// todos los demás botone se apagan
      buttonn5 = false;
    }
  }
  if ((mouseX > x+450) && (mouseX< x+450+w)&&(mouseY >y )&&(mouseY < y +w)) {
    if (!buttonn5) { // si el boton esta apagado
      buttonn5 = true; // se prende el boton presionado
      buttonn3 = false;
      buttonn4 = false;// todos los demás botone se apagan
      buttonn2 = false;
    }
  }
}

void eleccion() {
  if (buttonn2 == true) {
    nminos=2;
  } else if (buttonn3 == true) {
    nminos=3;
  } else if (buttonn4 == true) {
    nminos=4;
  } else if (buttonn5 == true) {
    nminos=5;
  }
}
