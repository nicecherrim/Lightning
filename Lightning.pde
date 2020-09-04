PImage webImg;
  int startX = 500;
  int startY = 500;
  int endX = 500;
  int endY = 500;
void setup()
{
  size(500,500);
  // Load image
  webImg = loadImage("bouncey.png", "png");
  //startX = ((int)(Math.random()*476)+25);
  background(200);
  frameRate(10);
}
void draw()
{
  fill(200,200,200,30);
  rect(0,0,500,500);
  if(startY < endY){
    if(!(startX < 0 || startY < 0 || startX > 450)){
      image(webImg, startX, startY,50,50);
    }else if (startX < 0){
      startX += 50;
    }else if(startX > 450){
      startY += 10;
    }else if(startX > 450){
      startX -= 50;
    }
    startX += ((int)(Math.random()*50)-25);
    startY += ((int)(Math.random()*31)-5);
  }
}
void mousePressed()
{
  fill(200,200,200,30);
  rect(0,0,500,500);
  startX = ((int)(Math.random()*450));
  startY = 0;
}
