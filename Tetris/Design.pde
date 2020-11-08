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
