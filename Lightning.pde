PImage greyPu;
PImage bluePu;
PImage pinkPu;
PImage yellowPu;

int startX = 0; //50 = boundary //immediately changed to random value upon click 
int startY = 550; //50 = boundary //set to 550 so it doesn't draw right after loading, user must click to set it to 50 and start drawing
int endX = 500; //450
int endY = 550; //450

int startX2 = 500; //50
int startY2 = 550; //50

String color1 = ""; //color for 1st Pusheen
String color2 = ""; //color for 2nd Pusheen

void setup()
{
  size(500, 500);
  //various color pusheen images
  greyPu = loadImage("https://github.com/nicecherrim/Lightning/blob/master/bouncey%20grey.png?raw=true;", "png");
  bluePu = loadImage("https://github.com/nicecherrim/Lightning/blob/master/bouncey%20blue.png?raw=true;", "png");
  pinkPu = loadImage("https://github.com/nicecherrim/Lightning/blob/master/bouncey%20pink.png?raw=true;", "png");
  yellowPu = loadImage("https://github.com/nicecherrim/Lightning/blob/master/bouncey%20yellow.png?raw=true;", "png");
  imageMode(CENTER);
  background(200);
  frameRate(10);
}

void draw() //fading effect, drawing Pusheens, and creating random movement
{
  fill(200, 200, 200, 100); //colors the rectangle and makes it slight transparent to give fading effect
  noStroke();
  rect(0, 0, 500, 500);
  //finish line
  stroke(20);
  strokeWeight(20);
  line(0, 480, 500, 480);
  fill(0, 0, 0);
  textSize(50);
  text("Finish", 150, 450);
  //ellipse(0,startY, 20,20); //to test boundaries of image and canvas
  //drawing the Pusheens
  drawPupu(startX, startY, color1);
  startX += ((int)(Math.random()*51)-25); //moves x anywhere between -25 to 25
  startY += ((int)(Math.random()*26)); //y only moves positively so it goes down

  drawPupu(startX2, startY2, color2);
  startX2 += ((int)(Math.random()*51)-25); //moves x anywhere between -25 to 25
  startY2 += ((int)(Math.random()*26));  //y only moves positively so it goes down
}

void mousePressed() //gives both Pusheens random/different starting points anywhere on the top of the screen + changes the colors
{
  startX = ((int)(Math.random()*450));
  startY = 50;
  startX2 = ((int)(Math.random()*450));
  startY2 = 50;
  int ran1 = ((int)(Math.random()*5)+1);
  int ran2 = ((int)(Math.random()*5)+1);
  color1 = pickColor(ran1);
  color2 = pickColor(ran2);
}

void pusheen(String clr, int x, int y, int sizeX, int sizeY) { //prints the pusheen image with chosen color, location, and size
  if (clr == "grey") {
    image(greyPu, x, y, sizeX, sizeY);
  } else if (clr == "blue") {
    image(bluePu, x, y, sizeX, sizeY);
  } else if (clr == "pink") {
    image(pinkPu, x, y, sizeX, sizeY);
  } else if (clr == "yellow") {
    image(yellowPu, x, y, sizeX, sizeY);
  } else { //grey is default color is no color/wrong color is entered
    image(greyPu, x, y, sizeX, sizeY);
  }
} 

void drawPupu(int startx, int starty, String clr) { //this function draws a single Pusheen (looped in draw) and keeps it in the specified boundaries
  if (starty < endY) { //when the pusheen reaches the bottom, the image will stop drawing all togetther 
    //this if statement keeps the pusheen within the boundaries of the canvas
    if (!(startx < 50 || startx > 450)) { 
      pusheen(clr, startx, starty, 100, 100);
    } else if (startx < 50) {
      startx += 50;
      pusheen(clr, startx, starty, 100, 100);
    } else if (startx > 450) {
      startx -= 50;
      pusheen(clr, startx, starty, 100, 100);
    }
  }
}

String pickColor(int num){ //=pick specifc color thru nums, so it can generate a random num to pick random colors each time
  if (num == 0) {
    return "grey";
  } else if (num == 1) {
    return "blue";
  } else if (num == 2) {
    return "pink";
  } else if (num == 3) {
    return "yellow";
  } else { //if number is out of range, grey is default
    return "grey";
  }
}
