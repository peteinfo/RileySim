

// -------------------
//    Generate Idea 
// -------------------


void generateIdea() {

  pointerA++;
  if (pointerA >= listA.size()) 
  {
    pointerA = 0;
    listA.shuffle();
  }

  pointerB++;
  if (pointerB >= listB.size()) 
  {
    pointerB = 0;
    listA.shuffle();
  }

  pointerC++;
  if (pointerC >= listC.size()) { 
    pointerC = 0;
    listC.shuffle();
  }
}


// -------------------
//      Load Text 
// -------------------

void loadTextFile(String wordsFile) {

  listA.clear();
  listB.clear();
  listC.clear();

  // load text file
  lines = loadStrings(wordsFile);

  int currentList = 0;

  println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i++) {
    println(lines[i]);
    if (lines[i].equals("-A-")) {
      currentList = 1;
    } else if (lines[i].equals("-B-")) {
      currentList = 2;
    } else if (lines[i].equals("-C-")) {
      currentList = 3;
    } else if (lines[i].equals("-TITLE-")) {
      title = lines[i+1];
    } else if (!lines[i].equals("")) {
      switch(currentList) {
      case 1:
        listA.append(lines[i]);
        break;
      case 2:
        listB.append(lines[i]);
        break;
      case 3:
        listC.append(lines[i]);
        break;
      }
    }
  }

  int textPermutations = listA.size() * listB.size() * listC.size();
  println("There are " + textPermutations + " permutations of text.");
}
