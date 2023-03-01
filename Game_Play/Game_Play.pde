int sunCircleX1;
int sunCircleY1;
int sunWidth;
int sunHeight;

int sunCircleX2;
int sunCircleY2;
int cloudWidth;
int cloudHeight;


final color WHITE = color(255, 255, 255);
final color BLUE = color (153, 204, 255);
final color AMBER = color(255, 194, 0);

void setup() {
  size(1500, 1500);
  sunCircleX1 = 1300;
  sunCircleY1 = 200;
  sunWidth = 75;
  sunHeight = 75;

  sunCircleX2 = 100;
  sunCircleY2 = 160;
  cloudWidth = 50;
  cloudHeight = 50;
}//End setup




void draw() {
  background(BLUE);

  sunOn(200);
  cloudOn(50, 240, 50);
  cloudOn(50, 300, 50);
  birdOn(100, 40, 50, 100, 70, 60);
  birdOn(150, 100, 80, 100, 80, 80);
 
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
