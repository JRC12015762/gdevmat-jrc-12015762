Walker blackHole = new Walker(255, 255, 255, 100, 100);
Walker[] matter = new Walker[100];
Walker test = new Walker(255, 0, 0, 100, 20);

void setup ()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  makeMatter();
  
  blackHole.position.x = random(Window.left, Window.right);
  blackHole.position.y = random(Window.bottom, Window.top);
}

void draw ()
{  
  background(0);
  activateMatter();  
  blackHole.renderBH(mousePos());
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector (x, y);
}

void activateTest ()
{
  PVector direction = PVector.sub(blackHole.position, test.position);
  test.render();
  
  if (direction.x > 0) //positive
  {
    test.position.x += abs(direction.x / test.speed.x);
  }
  else if (direction.x < 0) //negative
  {
    test.position.x -= abs(direction.x / test.speed.x);
  }
  
  if (direction.y > 0) //positive
  {
    test.position.y += abs(direction.y / test.speed.y);
  }
  else if (direction.y < 0) //negative
  {
    test.position.y -= abs(direction.y / test.speed.y);
  }
}

void activateMatter ()
{
  for (int i = 0; i < 100; i++)
  {       
    PVector direction = PVector.sub(blackHole.position, matter[i].position);
    matter[i].render();
    
    if (direction.x > 0) //positive
  {
    matter[i].position.x += abs(direction.x / matter[i].speed.x);
  }
  else if (direction.x < 0) //negative
  {
    matter[i].position.x -= abs(direction.x / matter[i].speed.x);
  }
  
  if (direction.y > 0) //positive
  {
    matter[i].position.y += abs(direction.y / matter[i].speed.y);
  }
  else if (direction.y < 0) //negative
  {
    matter[i].position.y -= abs(direction.y / matter[i].speed.y);
  }
  }
}

void makeMatter ()
{
  for (int i = 0; i < 100; i++)
  {   
    float gaussian = randomGaussian();
    float gaussianCircleSize = randomGaussian();
  
    float standardDeviation = 250;
    float mean = 0;
  
    float sizeStandardDeviation = 20;
    float sizeMean = 20;
  
    float x = standardDeviation * gaussian + mean;
    float y = random(Window.bottom, Window.top);
    float size = gaussianCircleSize * sizeStandardDeviation + sizeMean;
  
    int r = int(random(256));
    int g = int(random(256));
    int b = int(random(256));
    int a = int(random(10, 256));
    
    Walker newMatter = new Walker(r, g, b, a, size);    
    newMatter.position.x = x;
    newMatter.position.y = y;
    newMatter.render();
    
    matter[i] = newMatter;
  }
}

void mouseClicked() 
{
  int value = 0;
  if (value == 0) 
  {
    makeMatter();
  }
}
