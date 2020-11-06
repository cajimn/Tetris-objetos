void marcadores() {
  background(0, 14, 56);
  push();
  textAlign(CENTER,0);
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

void inicio() {
  push();
  translate(width/2, height/2);
  textFont(f);
  textAlign(CENTER, CENTER);

  stroke(75, 54, 33);
  strokeWeight(5);
  fill(255, 230, 0);
  rectMode(CENTER);
  rect(0, 4, 240, 70, 10);

  fill(0, 0, 255);
  textSize(18);
  text("Press ENTER to start", 0, 0);
  pop();
}

void gameOver() {
  background(0, 14, 56);
  push();
  translate(width/2, height/5);
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


  pop();
}
