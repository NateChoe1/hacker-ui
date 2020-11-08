boolean showDenied = false;
boolean showEntered = false;

void showMessages() {
  if (showDenied) {
    showMessage("ACCESS DENIED", color(0, 255, 0), color(255, 0, 0), color(0));
  }
  if (showEntered) {
    showMessage("ACCESS GRANTED", color(0, 255, 0), color(0, 255, 0), color(0));
  }
}

void showMessage(String input, color textColor, color boxOutline, color boxInside) {
  stroke(boxOutline);
  strokeWeight(5);
  fill(boxInside);
  rect(displayWidth / 5, displayHeight / 3, displayWidth / 5 * 3, displayHeight / 3);
  textAlign(CENTER, CENTER);
  fill(textColor);
  textSize(50);
  text(input, displayWidth / 2, displayHeight / 2);
}

void keyPressed() {
  if (keyCode == TAB) showDenied = true;
  if (keyCode == ENTER) {
    if (!showEntered) showEntered = true;
    else if (phase == HACKING) phase++;
    else {
      stack.add(n);
      enterFrame = frameCount;
      fileName = fileNames[(int) random(0, fileNames.length)];
    }
  }
  if (keyCode == DELETE) {
    saveFrame();
  }
}

void keyReleased() {
  if (keyCode == TAB) showDenied = false;
}
