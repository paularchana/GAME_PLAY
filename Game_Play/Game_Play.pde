int sunCircleX1;
int sunCircleY1;
int sunWidth;
int sunHeight;

int cloudDiam, cloudX1, cloudY1, cloudX2, cloudY2, cloudOffset;
int fbirdX1, fbirdY1, fbirdX2, fbirdY2, fbirdX3, fbirdY3;
int birdX1, birdY1, birdX2, birdY2, birdX3, birdY3;

int speed;
int a;

final color WHITE = color(255, 255, 255);
final color BLUE = color (153, 204, 255);
final color AMBER = color(255, 194, 0);

void setup() {
  size(1080, 800);
  sunCircleX1 = width-(width/8);
  sunCircleY1 = height/5;

  cloudX1 = 50;
  cloudY1 = 240;
  cloudX2 = 100;
  cloudY2 = 290;
  cloudOffset = 50;
  cloudDiam = 50;

  fbirdX1 = 100;
  fbirdY1 = 160;

  fbirdX2 = 100;
  fbirdY2 = 240;

  fbirdX3 = 150;
  fbirdY3 = 200;

  birdX1 = 150;
  birdY1 = 260;

  birdX2 = 150;
  birdY2 = 340;

  birdX3 = 210;
  birdY3 = 300;


  speed = 2;
}//End setup

void draw() {
  background(BLUE);
  noStroke();

  sunOn(150);

  birdOn(fbirdX3, fbirdY3, fbirdX2, fbirdY2, fbirdX1, fbirdY1);
  fbirdX1 = fbirdX1 + speed;
  fbirdX2 = fbirdX2 + speed;
  fbirdX3 = fbirdX2 + speed;

  birdOn(birdX1, birdY1, birdX2, birdY2, birdX3, birdY3);
  birdX1 = birdX1 + speed;
  birdX2 = birdX2 + speed;
  birdX3 = birdX2 + speed;


  cloudOn(cloudX1, cloudY1, cloudDiam);
  cloudX1 = cloudX1 + speed;

  if (cloudX1 > width + cloudDiam) {
    cloudX1 = - cloudDiam;
  }

  cloudOn(cloudX2, cloudY2, cloudDiam);
  cloudX2 = cloudX2 + speed;

  if (cloudX2 > width + cloudDiam) {
    cloudX2 = - cloudDiam;
  }
}//End draw

void sunOn(int dynamic_Diam) {
  fill(AMBER);
  ellipse(sunCircleX1, sunCircleY1, dynamic_Diam, dynamic_Diam);
}

void cloudOn(int k, int g, int dynamic_Diam) {
  fill(WHITE);
  ellipse(k, g, dynamic_Diam, dynamic_Diam);
}

void birdOn(int k1, int g1, int k2, int g2, int k3, int g3) {
  fill(WHITE);
  triangle(k1, g1, k2, g2, k3, g3);
}
