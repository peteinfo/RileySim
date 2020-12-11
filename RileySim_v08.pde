
// -------------------
//     RileySim
// -------------------
//  Pete Bennett 2019
//  www.peteinfo.com

PGraphics canvas;

boolean savingFrames = false;

int currentDuration = 1200;
int lastFrameCount = 0;

int stepCount = 0;
int codeCount = 0;

int scene = 0;

//String wordsFile = "sceneA.txt";
String title = "";

StringList listA = new StringList();
StringList listB = new StringList();
StringList listC = new StringList();

int dotA = 2;
int dotB = 3;
int dotC = 4;

String[] lines;

PFont font;  

int pointerA = 0;
int pointerB = 0;
int pointerC = 0;

boolean writeList = false;
PrintWriter output;

PImage codeScreen;


// -------------------
//       setup 
// -------------------

void setup() {

  size(750, 900);
  canvas = createGraphics(700, 700);
  frameRate(25);

  currentDuration = int(random(6000, 18000));

  smooth();

  codeScreen = loadImage("codeScreen.png");

  font = loadFont("AvenirNext-UltraLight-27.vlw");
  //font = createFont("AvenirNext-UltraLight", 27, true);

  textFont(font, 27);

  loadTextFile("sceneA.txt");

  listA.shuffle();
  listB.shuffle(); 
  listC.shuffle();

  if (writeList) {
    output = createWriter("ideasList.txt");

    for (int n = 0; n < 10000; n++) {
      generateIdea();
      output.println(listA.get(pointerA) + " " + listB.get(pointerB) + " " + listC.get(pointerC));
    }
    output.flush(); // Write the remaining data
    output.close(); // Finish the file
  }


  background(255);

  fill(0);
  stroke(0);
  text(listA.get(pointerA) + "\n" + listB.get(pointerB) + "\n" + listC.get(pointerC), 25, 780);
}



// -------------------
//        draw 
// -------------------

void draw() {

  background(255);
  stroke(0);


  if (frameCount > lastFrameCount + currentDuration) {
    lastFrameCount = frameCount;
    currentDuration = int(random(6000, 18000));
    generateIdea();
  }


  switch (scene) {

  case 0: 
    text("RileySim\n\nA procedural art and narrative generator based on my\nvisit to the Bridget Riley exhibition at the Hayward Gallery\non Friday 1st November 2019.\n\nYou've queued, bought a ticket, and are now sat in\nthe café having a coffee whilst sketching and talking\nto James. When you are ready to enter the gallery,\npress spacebar.", 25, 300);
    break;

  case 1:
    text(listA.get(pointerA) + "\n" + listB.get(pointerB) + "\n" + listC.get(pointerC), 25, 780);
    imageMode(CENTER); 
    image(canvas, width/2, 375);
    break;

  case 2:
    text(listA.get(pointerA) + "\n" + listB.get(pointerB) + "\n" + listC.get(pointerC), 25, 780);
    imageMode(CENTER); 
    image(canvas, width/2, 375);
    break;

  case 3:
    text(listA.get(pointerA) + "\n" + listB.get(pointerB) + "\n" + listC.get(pointerC), 25, 780);
    imageMode(CENTER); 
    image(canvas, width/2, 375);
    break;

  case 4:
    text(listA.get(pointerA) + "\n" + listB.get(pointerB) + "\n" + listC.get(pointerC), 25, 780);
    imageMode(CENTER); 
    image(canvas, width/2, 375);
    break;

  case 5: 
    text("You exit the gallery, briefly stopping in the gift shop,\nbut without buying anything.\n\nAfter stopping for a quick lunch, you start walking towards\nthe Tate Modern thinking about how develop a \"gallery sim\"\nto capture the experience.\n\nPress spacebar to code the gallery sim.", 25, 300);
    break;

  case 6: 
    text("...coding!", 25, 300);
    imageMode(CENTER);
    image(codeScreen, width/2, height/2, codeScreen.width*0.45, codeScreen.height*0.45);

    noStroke();
    fill(255);
    if (25 * codeCount < 605) {
      rect(80, 175 + (19 * codeCount), 605, 584 - (19 * codeCount));
    }

    //println(codeCount);

    if (codeCount > 25) {
      fill(0);
      text("> Press RETURN to run RileySim", 40, 855);
    }
    if (codeCount > 26) {
      scene = 0;
      stepCount = 0;
      codeCount = 0;
      loadTextFile("sceneA.txt");
    }
    break;

  default:

    break;
  }

  if (savingFrames) {
    saveFrame("frames/frame-######.tif");

    if (frameCount > frameRate * 80) {
      savingFrames = false;
      exit();
    }
  }
}
