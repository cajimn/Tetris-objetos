void niveles() {
  
  if (puntaje >= 300) {
    nivel=2;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 600) {
    nivel=3;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 900) {
    nivel=4;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 1200) {
    nivel=5;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 1500) {
    nivel=6;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 1800) {
    nivel=7;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 2100) {
    nivel=8;
    timerPaso=timerPaso-20;
  }
  if (puntaje >= 2400) {
    nivel=9;
    timerPaso=timerPaso-20;
  }
}
