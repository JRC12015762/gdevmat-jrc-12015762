//change the background
int backgroundR = 255, backgroundG = 255, backgroundB = 255;

void setup ()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector (x, y);
}

void draw()
{  
  background(backgroundR, backgroundG, backgroundB);
  
  PVector mouse = mousePos();
  
  printOuterGlow (mouse);
  
  printInnerGlow (mouse);
  
  printHandle (mouse);
  
  println(mouse.mag());
}

void printHandle (PVector mouse)
{
  strokeWeight(15);
  stroke(0, 0, 0);
  
  mouse.normalize().mult(100);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}

void printOuterGlow (PVector mouse)
{
  strokeWeight(20);
  stroke(255, 0, 0);
  
  mouse.normalize().mult(500);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  circle(mouse.x, mouse.y, 0.5);
  circle(-mouse.x, -mouse.y, 0.5);
  
  //disguises middle bar
  strokeWeight(20);
  stroke(backgroundR, backgroundG, backgroundB);
  
  mouse.normalize().mult(100);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
  
  //smoothens the lightsaber hilt
  stroke(255, 0, 0);
  circle(mouse.x, mouse.y, 0.5);
  circle(-mouse.x, -mouse.y, 0.5);
}

void printInnerGlow (PVector mouse)
{
  strokeWeight(5);
  stroke(255, 255, 255);
  
  mouse.normalize().mult(500);
  line(0, 0, mouse.x, mouse.y);
  line(0, 0, -mouse.x, -mouse.y);
}
