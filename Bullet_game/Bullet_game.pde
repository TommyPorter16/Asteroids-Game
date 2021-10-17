/*
Tommy Porter
 Block: 1-3
 Oct 3, 2021
 */

//images/gifs/font
PImage UFO;
PImage Asteroid;
PImage[] introgif;
int numberOfFrames;
int f =0;
PFont space;

//counting variabes
int AsteroidAmount;
int UFOSpawnTimer;

boolean upkey, downkey, leftkey, rightkey, spacekey, t;
Ship myShip;
ArrayList<GameObject> myObjects;

//Mode Framework
int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;


void setup() {
  size(800, 600);
  rectMode(CENTER);
  mode = INTRO;

  //loading images
  imageMode(CENTER);
  UFO = loadImage("UFO.png");
  Asteroid = loadImage("Asteroid.png");
  //font
  space = createFont("space.ttf", 100);



  // introgif array
  numberOfFrames = 23;
  introgif = new PImage[numberOfFrames];

  int i = 0;
  while (i < numberOfFrames) {
    introgif[i] = loadImage("frame_" +i+ "_delay-0.1s.gif");

    i++;
  }
}

void draw() {

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}

void keyPressed() {
  if (keyCode == UP) upkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (key == 't' || key == 'T' ) t = true;
}


void keyReleased() {
  if (keyCode == UP) upkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (key == 't' || key == 'T') t = false;
}
