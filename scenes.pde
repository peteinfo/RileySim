

// ---------------------------------------
//                SCENE A
// ---------------------------------------

void sceneA() {

  canvas.beginDraw();

  canvas.background(color(random(248, 253)));

  canvas.noFill();


  int cRad = int(random(80, 160));

  canvas.strokeWeight((cRad)/60);

  float offset = -random(cRad/4);

  for (int z = 0; z < 3; z++) {

    for (int x = 0; x < 10; x++) {
      for (int y = 0; y < 10; y++) {
        if (chance(50)) {
          canvas.stroke(color(random(65, 130)));

          canvas.ellipse(offset + (x+0.5*z) * cRad, (y+0.5*z) * cRad, cRad, cRad);
        }
      }
    }
  }

  canvas.endDraw();
}






// ---------------------------------------
//                SCENE B
// ---------------------------------------

void sceneB() {

  int barWidth = int(random(6, 14));
  int numberOfBars = canvas.width / barWidth;


  canvas.beginDraw();
  canvas.smooth();
  canvas.noStroke();

  color c1, c2, c3;


  if (random(2) > 1.0) {
    c1 = color(random(170, 200), random(100, 150), random(100, 150));
    c2 = color(random(120, 110), random(170, 210), random(140, 110));
    c3 = color(random(230, 240), random(230, 240), random(230, 240));
  } else {
    c1 = color(random(110, 140), random(180, 210), random(100, 150));
    c2 = color(random(110, 140), random(110, 140), random(200, 240));
    c3 = color(random(240, 245), random(240, 245), random(240, 245));
  }

  if (random(2) > 1.0) {

    for (int n = 0; n < numberOfBars+1; n++) {
      switch(n % 6) {
      case 0: 
        canvas.fill(c1);
        break;
      case 1:  
        canvas.fill(c2);
        break;
      case 2:  
        canvas.fill(c3);
        break;
      case 3:  
        canvas.fill(lerpColor(c2, color(random(255)), random(0.2)));
        break;
      case 4:  
        canvas.fill(c1);
        break;
      case 5:  
        canvas.fill(c3);
        //canvas.fill(random(70, 100));
        break;
      default:
        break;
      }
      canvas.rect(n * barWidth, 0, barWidth, canvas.height);
    }
  } else {

    int currentColour = 1;
    for (int n = 0; n < numberOfBars+1; n++) {
      switch(currentColour) {
      case 1: 
        if (random(100) > 50) {
          canvas.fill(c2);
          currentColour = 2;
        } else {
          canvas.fill(lerpColor(c3, color(random(150, 200), random(150, 20), random(150, 20)), 0.5));
          currentColour = 3;
        }
        break;
      case 2:  
        if (random(100) > 50) {
          canvas.fill(c1);
          currentColour = 1;
        } else {
          canvas.fill(c3);
          currentColour = 3;
        }
        break;
      case 3:
        if (random(100) > 50) {
          canvas.fill(c1);
          currentColour = 1;
        } else {
          canvas.fill(c2);
          currentColour = 2;
        }
        break;
      }
      canvas.rect(n * barWidth, 0, barWidth, canvas.height);
    }
  }

  canvas.endDraw();
}


// ---------------------------------------
//                SCENE C
// ---------------------------------------

void sceneC() {

  canvas.beginDraw();

  canvas.background(color(random(240, 250)));


  canvas.noFill();
  canvas.stroke(0);

  int horizon = int(random(canvas.height*0.6, canvas.height*0.8));

  canvas.fill(color(random(15, 30)));
  canvas.rect(0, horizon, width, height);

  canvas.bezier(-canvas.width*random(1, 2), 0, 
    canvas.width*random(0.1, 0.5), horizon*random(1.32, 1.326), 
    canvas.width*random(0.5, 0.9), horizon*random(1.32, 1.326), 
    canvas.width*random(2, 3), 0);


  canvas.endDraw();
}



// ---------------------------------------
//                SCENE D
// ---------------------------------------

void sceneD() {

  canvas.beginDraw();


  int w = int(random(5, 16));
  float f = random(0.025, 0.035);
  float h = random(4, 9);
  float o = random(0.015, 0.055);

  int colourPattern = int(random(2));


  color c1, c2, c3;
  if (chance(50)) {
    c1 = color(random(220, 240), random(100, 120), random(100, 120));
    c2 = color(random(80, 90), random(170, 200), random(120, 140));
    c3 = color(random(230, 240), random(230, 240), random(230, 240));
  } else {
    c1 = color(random(100, 120), random(100, 120), random(220, 240));
    c2 = color(random(80, 90), random(170, 200), random(120, 140));
    c3 = color(random(230, 240), random(230, 240), random(230, 240));
  } 
  int c = -1;
  for (int y = -2*w; y < canvas.height; y += w) {
    c++;

    canvas.noStroke();

    if (colourPattern == 0) {

      float lerpAmount = 0.5*abs(1.0 - abs(canvas.width/2 - y) / float(canvas.width/2));

      switch(c % 6) {
      case 0:
        canvas.fill(c1);
        break;
      case 1:
        canvas.fill(c2);
        break;
      case 2:
        //println(lerpAmount);
        canvas.fill(lerpColor(c3, c2, lerpAmount));
        break;
      case 3:
        canvas.fill(c2);
        break;
      case 4:
        canvas.fill(c1);
        break;
      case 5:
        canvas.fill(lerpColor(c3, color(200), lerpAmount));
        break;
      }
    }
    if (colourPattern == 1) {
      if (c % 2 == 0) {
        canvas.fill(color(random(15, 60)));
      } else {
        canvas.fill(color(random(225, 250)));
      }
    }

    canvas.beginShape();
    
    float wiggle = random(-0.5, 0.5);

    for (int x = -2; x < canvas.width+2; x++) {
      canvas.vertex(x, y + wiggle + cos(x*f-y*o)*h);
    }

    canvas.vertex(canvas.width, canvas.height);
    canvas.vertex(0, canvas.height);  

    canvas.endShape();
  }




  canvas.endDraw();
}
