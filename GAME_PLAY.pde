/*
 Author: Archana Paul
 Date: 3/09/2023
 Version : 1.0
 Description: Random object location by clicking on a target and getting a score.
 */


float sunCircleX1;
float sunCircleY1;

float cloudDiam, cloudX1, cloudY1, cloudX2, cloudY2, cloudOffset;
float fbirdX1, fbirdY1, fbirdX2, fbirdY2, fbirdX3, fbirdY3;
float birdX1, birdY1, birdX2, birdY2, birdX3, birdY3, birdWidth, cloudSpeed, birdSpeed;

float pinkX;
float pinkY;
float diam;

float speed;
float maxSize;
int score;

final color WHITE = color(255, 255, 255);
final color BLUE = color (153, 204, 255);
final color AMBER = color(255, 194, 0);
final color PINK = color (159, 43, 104);

void setup() {
  size(1080, 800);
  sunCircleX1 = width -(width/8);
  sunCircleY1 = height/5;
  

  cloudX1 = 50;
  cloudY1 = 240;
  cloudX2 = 100;
  cloudY2 = 290;
  cloudOffset = 50;
  cloudDiam = 50;

  birdWidth = 50;

  fbirdX1 = 100;
  fbirdY1 = 160;

  fbirdX2 = fbirdX1;
  fbirdY2 = 240;

  fbirdX3 = fbirdX1 + birdWidth;
  fbirdY3 = 200;

  birdX1 = 150;
  birdY1 = 260;

  birdX2 = 150;
  birdY2 = 340;

  birdX3 = birdX1 + birdWidth;
  birdY3 = 300;

  cloudSpeed = 2;
  birdSpeed = 2.5;

  diam = 200;
  maxSize = 300;

  pinkX = random(maxSize, width-maxSize);
  pinkY = random(maxSize, height-maxSize);

  speed = 2;
  score = 0;

}//End setup

void draw() {
  background(BLUE);
  noStroke();

  textSize(50);
  text(" SCORE IS: " + score, 100, 100);


  drawPinkEllipse(pinkX, pinkY);
  diam = move1(diam, maxSize);
  
  sunOn(150);

  cloudOn(cloudX1, cloudY1, cloudDiam);
  cloudX1 = move(cloudX1, cloudSpeed);
  cloudX1 = cloudLocationReset(cloudX1);

  cloudOn(cloudX2, cloudY2, cloudDiam);
  cloudX2 = move(cloudX2, cloudSpeed-0.25);
  cloudX2 = cloudLocationReset(cloudX2);

  // A Bird
  birdOn(birdX1, birdY1, birdX2, birdY2, birdX3, birdY3);
  birdX1 = move(birdX1, birdSpeed);
  birdX2 = move(birdX2, birdSpeed);
  birdX3 = move(birdX3, birdSpeed);

  birdX1 = birdLocationReset(birdX1, 0);
  birdX2 = birdLocationReset(birdX2, 0);
  birdX3 = birdLocationReset(birdX3, birdWidth);

  //_____________________________________________________________//

  //Another bird
  birdOn(fbirdX1, fbirdY1, fbirdX2, fbirdY2, fbirdX3, fbirdY3);
  fbirdX1 = move(fbirdX1, birdSpeed-0.25);
  fbirdX2 = move(fbirdX2, birdSpeed-0.25);
  fbirdX3 = move(fbirdX3, birdSpeed-0.25);

  fbirdX1 = birdLocationReset(fbirdX1, 0);
  fbirdX2 = birdLocationReset(fbirdX2, 0);
  fbirdX3 = birdLocationReset(fbirdX3, birdWidth);
}//End draw

float birdLocationReset(float wx, float m ) {
  if (wx > (width + m) ) {
    if (m == 0) { // means we are getting x1 or x2
      wx = 0 - birdWidth;
    }
    if ( m == birdWidth) { // means we are getting x3 where m = 50
      wx = 0;
    }
  }
  return wx;
}//End birdlocationReset

float move(float d, float k) {
  d = d + k;
  return d;
}

float cloudLocationReset(float cx) {
  if (cx > width + cloudDiam) {
    cx = - cloudDiam;
  }
  return cx;
}

float move1(float circleDiam, float top_limit) {
  if (circleDiam > top_limit) {
    speed = - speed;
  }
  if (circleDiam < 10) {
    speed = - speed;
  }
  circleDiam = circleDiam + speed;
  return circleDiam;
}//end


void drawPinkEllipse(float s, float j) {
  fill(PINK);
  ellipse(s, j, diam, diam);
}// mouse pressed.

void mouseClicked() {
  if (mouseX > (pinkX-diam/2) && mouseX < (pinkX + diam/2) ) {
    if (mouseY > (pinkY - diam/2) && mouseY< ( pinkY + diam)) {
      // if mouse clicked in the proper location, do these tasks.
      score ++;
      pinkX = random(width-maxSize);
      pinkY = random(height-maxSize);
    }
  }
}

void sunOn(float dynamic_Diam) {
  fill(AMBER);
  ellipse(sunCircleX1, sunCircleY1, dynamic_Diam, dynamic_Diam);
}

void cloudOn(float k, float g, float dynamic_Diam) {
  fill(WHITE);
  ellipse(k, g, dynamic_Diam, dynamic_Diam);
}

void birdOn(float k1, float g1, float k2, float g2, float k3, float g3) {
  fill(WHITE);
  triangle(k1, g1, k2, g2, k3, g3);
}
