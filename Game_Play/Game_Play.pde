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
  cloudOn(100, 100, 50);
  cloudOn(200, 200, 50);
  birdOn()
}//End draw

void sunOn(int dynamic_Diam) {
  fill(AMBER);
  ellipse(sunCircleX1, sunCircleY1, dynamic_Diam, dynamic_Diam);
}



void cloudOn(int k, int g, int dynamic_Diam) {
  fill(WHITE);
  ellipse(k, g, dynamic_Diam, dynamic_Diam);
}
