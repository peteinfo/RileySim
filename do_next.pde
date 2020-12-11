
void doNext() {


  if (scene == 0) {
    scene++;
  } else if (stepCount == 4) {
    loadTextFile("sceneB.txt");
    scene++;
  } else if (stepCount == 8) {
    loadTextFile("sceneC.txt");
    scene++;
  } else if (stepCount == 12) {
    loadTextFile("sceneD.txt");
    scene++;
  } else if (stepCount == 18) {
    scene++;
  } else if (stepCount == 19) {
    scene++;
  } else if (stepCount > 19) codeCount++;


  stepCount++;





  switch(scene) {
  case 1:
    canvas = createGraphics(int(random(450, 600)), int(random(650, 700)));
    break;
  case 2:
    canvas = createGraphics(int(random(650, 700)), int(random(350, 450)));
    break;
  case 3:
    int size = int(random(600, 700));
    canvas = createGraphics(size, size);

    break;
  case 4:
    if (chance(50)) {
      canvas = createGraphics(700, int(random(350, 700)));
    } else {
      canvas = createGraphics(int(random(500, 700)), 700);
    }    
    break;
  default:
    break;
  }





  generateIdea();

  switch(scene) {
  case 1:
    sceneA();
    break;
  case 2:
    sceneB();
    break;
  case 3:
    sceneC();
    break;
  case 4:
    sceneD();
    break;
  default:
    break;
  }
}
